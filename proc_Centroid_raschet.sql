USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[Centroid_classification]    Script Date: 10/29/2013 11:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Drusengtmription:	<Drusengtmription,,>
-- =============================================
ALTER  PROCEDURE [dbo].[Centroid_classification] (@name as varchar (2) = 'TM', @exam as varchar (20) = 'rTM63' , @M as integer = 0, @num_cl as integer = 7, @lang as nvarchar (6) = 'r', @metric as nvarchar (3) = 'cos')
							--@Vol - объем обучающей выборки;  @N - общее количество документов в обучающей выборке


------ Классификация центроидом
AS
declare 
@sql as nvarchar(max)
,@i as integer
,@j as integer
,@tfidf as float
,@tf as int
,@CD as int
,@dist as float
,@exam_word as nvarchar(max)
,@sqlstr1 as nvarchar (max)= ''
,@sqlstr2 as nvarchar (max)=''
,@sqlstr3 as nvarchar (max)=''
,@CursorName as  CURSOR 

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[centroid_temp1]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table centroid_temp1
exec('select word, '+@exam+' into centroid_temp1 from q_'+@exam )
delete from centr

if @lang = 'a' set @lang = 'ruseng'
set @lang = RTRIM(@lang)
set @sqlstr1 = ''
set @sqlstr2 = ''
set @sqlstr3 = ''
----  CURSOR 
--select * from centroid_temp1
set @cursorname = CURSOR for 
select * from centroid_temp1
OPEN @CursorName
FETCH NEXT FROM @CursorName INTO @exam_word, @tf
WHILE @@FETCH_STATUS = 0 
begin	

	drop table centroid_temp2
	exec('Select word, count_docs,  count_words_tfidf into centroid_temp2 from MDT_GLOBAL_'+@lang + ' where word = '''+@exam_word+'''' )
	
	set @tfidf = CASE WHEN (select count_docs from centroid_temp2)  IS NULL 
					  THEN 0.00 
					  ELSE  @tf * log ((67 * @num_cl)/(select count_docs from centroid_temp2)) end -- Вычисляем вес тф-идф, если @cd = null  тогда вес = 0
	

	exec ('insert into centr (exam_word, tfidf) values ('''+@exam_word+''', '+ @tfidf+')') -- получили вектор документа в таблице centr
    FETCH NEXT FROM @CursorName INTO @exam_word, @tf   

end

set @dist = 0.00
set @i = 1 
while @i < @num_cl + 1
	begin
		set @name = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @i) )
		-- проверяем расстояние до центроидов
		-- dist = по косинусу или евклиду
		print (@name)
			exec ('IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N''[dbo].[centroid_temp3]'') AND OBJECTPROPERTY(id, N''IsUserTable'') = 1)
					drop table centroid_temp3
						  SELECT     dbo.cent_'+@lang+ @name+'.word, CASE WHEN cent_'+@lang+ @name+'.centroid IS NULL THEN 0 ELSE cent_'+@lang+ @name+'.centroid END AS centr, CASE WHEN centr.tfidf IS NULL 
						  THEN 0 ELSE centr.tfidf  END AS exam, MDT_GLOBAL_'+@lang+'.count_words,
						   (CASE WHEN cent_'+@lang+ @name+'.centroid IS NULL 
                           THEN 0 ELSE cent_'+@lang+ @name+'.centroid END) - (CASE WHEN centr.tfidf IS NULL THEN 0 ELSE centr.tfidf END) AS evklid
						  Into centroid_temp3
						  FROM dbo.centr LEFT OUTER JOIN
						  dbo.MDT_GLOBAL_'+@lang+' ON dbo.centr.exam_word = dbo.MDT_GLOBAL_'+@lang+'.Word FULL OUTER JOIN
						  dbo.cent_'+@lang+ @name+' ON dbo.centr.exam_word = dbo.cent_'+@lang+ @name+'.word
						  WHERE     (dbo.MDT_GLOBAL_'+@lang+'.count_words > '+@m+')')
		if @metric = 'cos' 
			begin
				exec ('Insert into centr1 (name, result) values ('''+@name+''' , (	select SUM(exam * centr) / (SQRT(SUM(square(centr)) * SUM(square(exam)))) from centroid_temp3))')
			end
		else if @metric = 'evk' 
			begin
				print ('Insert into centr1 (name, result) values ('''+@name+''' , (	SELECT     SQRT(SUM(power(evklid,2))) AS ['+@name+']
					  FROM   centroid_temp3))')
				exec ('Insert into centr1 (name, result) values ('''+@name+''' , (	SELECT     SQRT(SUM(power(evklid,2))) AS ['+@name+']
					  FROM   centroid_temp3))')
			end
	
		
			
	
					
	set @i = @i + 1	
	end


