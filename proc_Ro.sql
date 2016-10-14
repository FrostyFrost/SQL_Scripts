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
alter PROCEDURE [dbo].[RO]( @Vol as integer = 55, @N as float = 385.00, @name as varchar (10) = 'TM', @exam as varchar (20) = 'rTM63' , @M as integer = 0, @num_cl as integer = 7, @lang as nvarchar (6) = 'r')
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
,@Ro as float
,@tf as float -- вес термина 
,@exam_word as nvarchar(max)



if @lang = 'a' set @lang = 'ruseng'
set @lang = RTRIM(@lang)
--exec('update  mdt_'+@lang + @name + '_tfidf set Word = REPLACE (Word,'''''''','''')')

drop table Ro_temp1 
exec('CREATE TABLE Ro_temp1 (num int, word varchar(100), count_docs int, Ro float)')
exec('insert into Ro_temp1 select row_number() over(ORDER BY Count(word)) num , word, count_docs, 0.000 as Ro
from mdt_'+@lang + @name + '_tfidf
group by word, count_docs
')

exec ('drop table Ro_'+@lang+@name)
--exec('CREATE TABLE Chi2_'+@name +' (word varchar(100), chi2 float))')
set @i = 1
	while @i<(select COUNT(*) from Ro_temp1) + 1
		begin
		
			set @exam_word = (select word from Ro_temp1 where num = @i)
			set @CD_cl = (select count_docs from Ro_temp1 where word = @exam_word)
			exec ('select count_docs into Ro_temp2 FROM [TextCat].[dbo].[MDT_global_'+@lang+'] where word = '''+@exam_word +'''')
			set @CD_gl = (select count_docs FROM Ro_temp2 ) 
			drop table Ro_TEMP2
			
			set @A = @CD_cl
			set @B = @CD_gl-@CD_cl
			set @C = @Vol - @CD_cl
			set @D = @Vol*(@num_cl - 1 )- @CD_gl + @CD_cl 
			Set @N = @num_cl* @Vol
		
			set @CHI = ( @N* square(@A*@D-@B*@C) / ((@A+@B)*(@C+@D)*(@A+@C)*(@B+@D))  )
			
			print @chi 
			print  @exam_word
			set @i = @i +1
			
			update Ro_temp1 set  ro = sqrt((@chi/@N))  where word = @exam_word  -- ФИ = (@chi/@N), РО = sqrt((@chi/@N))
			
		end
	--select * from 	Ro_temp1
	set @sql = ('select max(num) as max_num, word as word, SUM(count_docs) as sum_countdocs, MAX(ro) as max_ro into Ro_'+@lang+@name+' from Ro_temp1  group by word  order by max(Ro )desc, word ')
	print (@sql)	
	exec(@sql)
	set @sql= ('select * from Ro_'+ @lang+@name +' order by max_Ro desc')
	exec (@sql)
