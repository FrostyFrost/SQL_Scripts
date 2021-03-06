USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[NBayes]    Script Date: 08/30/2012 12:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,
-- =============================================
ALTER PROCEDURE [dbo].[NBayes](  @Dc as integer = 55, @d as integer = 385, @name as varchar (10) = 'TM', @exam as varchar (20), @M as integer = 0, @lang as nvarchar (6) = 'r')
							--@Dc - объем обучающей выборки;  @d - общее количество документов в обучающей выборке
AS
declare 
@sql as nvarchar(max)
,@p as float -- Вероятность по Байесу
,@pp as float
,@i as integer
,@j as integer = 1
,@Wic as integer -- Сколько раз i-e слово встречается в док-те класса С
,@V as integer -- Количество слов во всех документах выборки
,@Lc as integer -- Кол-во слов в классе С
,@k as integer -- по классам


if @lang = 'a' set @lang = 'ruseng'
set @lang = rtrim(@lang)
set @exam = 'q_'+@exam


set @k = 1
while @k < 7 +1
	begin
		set @name = rtrim((select Class from Classes where num = (select cl_num from MDT_current where num = @k)))

				set @sql = '
				Drop table Temp_NB


				SELECT     dbo.'+Rtrim(@exam)+'.Word, CASE WHEN dbo.MDT_'+@lang+Rtrim(@name)+'_tfidf.count_words IS NULL THEN 0   WHEN dbo.MDT_'+@lang+Rtrim(@name)+'_tfidf.count_words < '+rtrim(str(@M))+' THEN 0 ELSE dbo.MDT_'+@lang+Rtrim(@name)+'_tfidf.count_words END + 0.00 AS count_words, row_number() over(ORDER BY Count(dbo.MDT_'+@lang+Rtrim(@name)+'_tfidf.word)  ) num
				into temp_NB
				FROM         dbo.MDT_'+@lang+Rtrim(@name)+'_tfidf RIGHT OUTER JOIN
									  dbo.'+Rtrim(@exam)+' ON dbo.MDT_'+@lang+Rtrim(@name)+'_tfidf.Word = dbo.'+Rtrim(@exam)+'.Word
				GROUP BY dbo.'+Rtrim(@exam)+'.Word, dbo.MDT_'+@lang+Rtrim(@name)+'_tfidf.count_words
				Having count_words >=5
				--HAVING      (CASE WHEN dbo.MDT_'+@lang+Rtrim(@name)+'_tfidf.count_words IS NULL THEN 0 ELSE dbo.MDT_'+@lang+Rtrim(@name)+'_tfidf.count_words END >= 0)
				'


				--print (@sql)
				exec (@sql)


				set @i =@@ROWCOUNT --number of columns (words)
				set @p = log(@Dc+0.00/@d) 
				
				if @lang = 'ruseng'
					set @V  = (select COUNT(*) from MDT_GLOBAL_ruseng)
				else if @lang = 'r'
					set @V  = (select COUNT(*) from MDT_GLOBAL_r)
				else if @lang = 'e'
					set @V  = (select COUNT(*) from MDT_GLOBAL_e)
					
					
				set @sql = '
				select * into #temp from MDT_'+@lang+Rtrim(@name)+'_tfidf 
				'
				exec (@sql)
				set @Lc = @@ROWCOUNT
				set @j = 1
				while  @j < @i + 1
					begin
						set @Wic = (select count_words from temp_NB where num = @j)
				--		Set @Wic = 99
						set @p = @p + log((1.000 + @Wic)/(@V + @Lc))
						set @j = @j + 1
					end
					
				exec ('Update NaiveBayes set prob = '+@p+' where Class = '''+@name+'''')
		set @k = @k +1
	end	
