USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[Centroid_raschet]    Script Date: 08/26/2013 15:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER  PROCEDURE [dbo].[Centroid_raschet] (@Vol as integer = 55, @name as varchar (10) = 'TM' , @M as integer = 0, @num_cl as integer = 7, @lang as nvarchar (6) = 'r')
							--@Vol - объем обучающей выборки;  @N - общее количество документов в обучающей выборке


------Расчет центроидов
AS
declare 
@sql as nvarchar(max)
,@i as integer
,@j as integer
,@exam_word as nvarchar(max)
,@sqlstr1 as nvarchar (max)= ''
,@sqlstr2 as nvarchar (max)=''
,@sqlstr3 as nvarchar (max)=''



print('Centr-  ' + @name)
set @lang = RTRIM(@lang)
set @name = RTRIM(ltrim(@name))

IF @lang = 'a' 
BEGIN
set @i = 1 
set @lang = 'ruseng'  
while @i < @num_cl + 1
	begin
	set @sqlstr1 = ''
	set @sqlstr2 = ''
	set @sqlstr3 = ''

		--set @name = rtrim((select class from classes where num = (select cl_num from MDT_current where num = @i)))
						
			drop table centroids 
				set @j = 1
				set @sqlstr1 = ('select word, (')
				while @j < 67 + 1
					begin
						set @sqlstr2 = @sqlstr2 + ' sum_r'+@name + ltrim(STR(@j)) + ' + '
						set @sqlstr3 = @sqlstr3 + ' sum_e'+@name + ltrim(STR(@j)) + ' + '
						set @j = @j +1
					end 
				set @sqlstr1 = @sqlstr1 + @sqlstr2 +  ( left(@sqlstr3, LEN(@sqlstr3)-2) + ') as centroid, count_words into centroids from MDT_ruseng' +@name +'_tfidf group by '+replace(@sqlstr2,'+',',') + replace(@sqlstr3,'+',',') + ' Word, count_words')
				print (@sqlstr1)
				exec (@sqlstr1)
			exec ('drop table cent_'+@lang+@name)	
			exec('select * into cent_'+@lang+@name+ ' from centroids ')
		set @i = @i + 1	
	end
END

ELSE 

BEGIN
set @i = 1
while @i < @num_cl + 1
	begin
	set @sqlstr1 = ''
	set @sqlstr2 = ''
		--set @name = rtrim((select class from classes where num = (select cl_num from MDT_current where num = @i)))
						
			drop table centroids 
				set @j = 1
				set @sqlstr1 = ('select word, (')
				while @j < 67 + 1
					begin
						set @sqlstr2 = @sqlstr2 + ' sum_'+@lang +@name + ltrim(STR(@j)) + ' + '
						set @j = @j +1
					end 
				set @sqlstr1 = @sqlstr1 +  ( left(@sqlstr2, LEN(@sqlstr2)-2)  +  ') as centroid, count_words into centroids from MDT_'+@lang +@name +'_tfidf group by '+replace(@sqlstr2,'+',',') + replace(@sqlstr3,'+',',') + ' Word, count_words')
				print (@sqlstr1)
				exec (@sqlstr1)
			exec ('drop table cent_'+@lang+@name)	
			exec('select * into cent_'+@lang+@name+ ' from centroids ')
		set @i = @i + 1	
	end
END

