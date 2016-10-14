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
ALTER PROCEDURE [dbo].[MI_I]( @Vol as integer = 55, @N as float = 385.00, @name as varchar (10) = 'TM', @exam as varchar (20) = 'rTM63' , @M as integer = 0, @num_cl as integer = 7, @lang as nvarchar (6) = 'r', @r as integer = 1)
							--@Vol - объем обучающей выборки;  @N - общее количество документов в обучающей выборке																								@r - параметр метода	


------ОБУЧЕНИЕ
AS
declare 
@sql as nvarchar(max)
,@A as integer
,@B as integer
,@C as integer
,@D as integer
,@i as integer
,@CD_cl as integer -- число документов в классе, в которых встречается  Xi
,@CD_gl as integer -- число документов всей выборки, где встречается   Xi
,@MI_I as float
,@tf as float -- вес термина 
,@exam_word as nvarchar(max)



if @lang = 'a' set @lang = 'ruseng'

set @lang = RTRIM(@lang)
exec('update  mdt_'+@lang + @name + '_tfidf_'+@lang+' set Word = REPLACE (Word,'''''''','''')')

drop table MI_I_temp1
exec('select row_number() over(ORDER BY Count(word)) num , word, count_docs
into MI_I_temp1
from mdt_'+@lang + @name + '_tfidf
group by word, count_docs
')
exec('alter table MI_I_temp1 add  MI_I float')

exec ('drop table MI_I_'+@lang+@name)
--exec('CREATE TABLE MI_I_'+@name +' (word varchar(100), MI_I float))')
set @i = 1
	while @i<(select COUNT(*) from MI_I_temp1) + 1
		begin
		
			set @exam_word = (select word from MI_I_temp1 where num = @i)
			set @CD_cl = (select count_docs from MI_I_temp1 where word = @exam_word)
			exec ('select count_docs into MI_I_temp2 FROM [TextCat].[dbo].[MDT_global_'+@lang+'] where word = '''+@exam_word +'''')
			set @CD_gl = (select count_docs FROM MI_I_temp2 ) 
			drop table MI_I_TEMP2
			
			set @A = @CD_cl
			set @B = @CD_gl-@CD_cl
			set @C = @Vol - @CD_cl
			set @D = @Vol*(@num_cl - 1 )- @CD_gl+ @CD_cl 
			Set @N = @num_cl* @Vol
			
			
			--print ('a = ' + str(@A )+ '  b=' + str(@B ) + '  c='+str(@c) + '   d='+str(@d)+ '  N=' + str(@n) )
 			
 			--print (log((power(@A,@r)*@N) / ((@A+@B)*(@A+@C))))
 			set @MI_I =  (@A*((log((@A*@N)/((@A+@B)*(@A+@C)))) / (log(2))))   /   ((@A+@B)*((log(@N/((@A+@B)))) / (LOG(2))))
	--		set @MI_I =  (((log((@A*@N)/((@A+@B)*(@A+@C)))) / (log(2))))   /   (((log(@N/((@Vol)))) / (LOG(2))))

			print @MI_I 
			print  @exam_word
			set @i = @i + 1
			
			update MI_I_temp1 set MI_I = @MI_I where word = @exam_word
			
		end
	--select * from 	MI_I_temp1
	set @sql = ('select max(num) as max_num, word as word, SUM(count_docs) as sum_countdocs, MAX(MI_I) as max_MI_I into MI_I_'+@lang+@name+' from MI_I_temp1  group by word  order by max(MI_I )desc, word')
	print (@sql)	
	exec(@sql)
	set @sql= ('select * from MI_I_'+ @lang+@name +' order by max_MI_I desc')
	exec (@sql)
