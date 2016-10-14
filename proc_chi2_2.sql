Use TextCat
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE [dbo].[CHI2_2]( @Vol as integer = 55, @N as float = 385.00, @name as varchar (10) = 'TM', @exam as varchar (20) = 'rTM63' , @M as integer = 0, @num_cl as integer = 7, @lang as nvarchar (6) = 'r')
							--@Vol - объем обучающей выборки;  @N - общее количество документов в обучающей выборке


------ОБУЧЕНИЕ
AS
declare 
@sql as nvarchar(max)
,@A as integer
,@B as INteger
,@C as integer
,@D as integer
,@i as integer
,@CD_cl as integer -- число документов в классе, в которых встречается  Xi
,@CD_gl as integer -- число документов всей выборки, где встречается   Xi
,@CHI as float
,@tf as float -- вес термина 
,@exam_word as nvarchar(max)



if @lang = 'a' set @lang = 'ruseng'
set @lang = RTRIM(@lang)
set @name = RTRIM(@name)
--exec('update  mdt_'+@lang + @name + '_tfidf set Word = REPLACE (Word,'''''''','''')')

drop table chi2_temp1 
exec('CREATE TABLE chi2_temp1 (num int, word varchar(100), count_docs int, chi2 float)')
exec('insert into chi2_temp1 select row_number() over(ORDER BY Count(word)) num , word, count_docs, 0.000 as chi2
from mdt_'+@lang + @name + '_tfidf
group by word, count_docs
')

exec ('drop table chi2_'+@lang+@name)
--exec('CREATE TABLE Chi2_'+@name +' (word varchar(100), chi2 float))')
set @i = 1
	while @i<(select COUNT(*) from chi2_temp1) + 1
		begin
		
			set @exam_word = (select word from chi2_temp1 where num = @i)
			set @CD_cl = (select count_docs from chi2_temp1 where word = @exam_word)
			exec ('select count_docs into chi2_temp2 FROM [TextCat].[dbo].[MDT_global_'+@lang+'] where word = '''+@exam_word +'''')
			set @CD_gl = (select count_docs FROM chi2_temp2 ) 
			drop table chi2_TEMP2
			
			set @A = @CD_cl
			set @B = @CD_gl-@CD_cl
			set @C = @Vol - @CD_cl
			set @D = @Vol*(@num_cl - 1 )- @CD_gl + @CD_cl 
			Set @N = @num_cl* @Vol* 1.00
		
			set @CHI = ( @N* square(@A*@D-@B*@C)/ ((@A+@B)*(@C+@D)*(@A+@C)*(@B+@D))  ) -- CHI2
			
			print @chi 
			print  @exam_word
			set @i = @i +1
			update chi2_temp1 set chi2 = @chi where word = @exam_word
			
		end
	--select * from 	chi2_temp1
	
	set @sql = ('select max(num) as max_num, word as word, SUM(count_docs) as sum_countdocs, MAX(chi2) as max_chi2 into chi2_'+@lang+@name+' from chi2_temp1  group by word  order by max(chi2 )desc')
	print (@sql)	
	exec(@sql)
	set @sql= ('select * from chi2_'+ @lang+@name +' order by chi2 desc')
	exec (@sql)
