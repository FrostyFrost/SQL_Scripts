USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[Q1]    Script Date: 12/26/2015 10:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE [dbo].[Q1]( @Vol as integer = 55, @N as float = 385.00, @name as varchar (10) = 'TM', @exam as varchar (20) = 'rTM63' , @M as integer = 0, @num_cl as integer = 7, @lang as nvarchar (6) = 'r', @r as integer = 1)
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
,@Q1 as float
,@tf as float -- вес термина 
,@exam_word as nvarchar(max)



if @lang = 'a' set @lang = 'ruseng'

set @lang = RTRIM(@lang)
--exec('update  mdt_'+@lang + @name + '_tfidf set Word = REPLACE (Word,'''''''','''')')

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Q1_temp1]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table Q1_temp1

exec('select row_number() over(ORDER BY Count(word)) num , word, count_docs
into Q1_temp1
from mdt_'+@lang + @name + '
group by word, count_docs
')
exec('alter table Q1_temp1 add  Q1 float')

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Q1_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table Q1_'+@lang+@name)

--exec('CREATE TABLE Q1_'+@name +' (word varchar(100), Q1 float))')
set @i = 1
	while @i<(select COUNT(*) from Q1_temp1) + 1
		begin
		
			set @exam_word = (select word from Q1_temp1 where num = @i)
			set @CD_cl = (select count_docs from Q1_temp1 where word = @exam_word)
			exec ('select count_docs into Q1_temp2 FROM [TextCat].[dbo].[MDT_global_'+@lang+'] where word = '''+@exam_word +'''')
			set @CD_gl = (select count_docs FROM Q1_temp2 ) 
			
			IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Q1_TEMP2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
			drop table Q1_TEMP2
			
			set @A = @CD_cl
			set @B = @CD_gl-@CD_cl
			set @C = @Vol - @CD_cl
			set @D = @Vol*(@num_cl - 1 )- @CD_gl+ @CD_cl 
			--Set @N = @num_cl* @Vol
			
			
			--print ('a = ' + str(@A )+ '  b=' + str(@B ) + '  c='+str(@c) + '   d='+str(@d)+ '  N=' + str(@n) )
 			
 			--print (log((power(@A,@r)*@N) / ((@A+@B)*(@A+@C))))
 			--set @Q1 =  (@A*((log((@A*@N)/((@A+@B)*(@A+@C)))) / (log(2))))   /   ((@A+@B)*((log(@N/((@A+@B)))) / (LOG(2))))
			
			--set @Q1 =  ((@A+@D)*2.0000)/((@A+@B+@C+@D+@A+@D)) -- SQ1 Соукала-Сниса
			
			--set @Q1 =  (@A*1.0000)/(@A+@B+@C+@D) -- RR Рассела-Рао
			--set @Q1 =  ((@A+@D)*1.0000)/(@A+@B+@C+@D) -- S простой коэффициент совстречаемости
			set @Q1 =  (((@A*@D)-(@B*@C))*1.0000)/((@A*@D)+(@B*@C)) -- Юл
			--set @Q1 =  ((@A+@D)*1.0000)/(@A+@B+@C+@D+@B+@C) -- S простой коэффициент совстречаемости
			
			print @Q1
			print  @exam_word
			set @i = @i + 1
			
			update Q1_temp1 set Q1 = @Q1 where word = @exam_word
			
		end
	--select * from 	Q1_temp1
	set @sql = ('select max(num) as max_num, word as word, SUM(count_docs) as sum_countdocs, MAX(Q1) as max_Q1 into Q1_'+@lang+@name+' from Q1_temp1  group by word  order by max(Q1) desc, word')
	print (@sql)	
	exec(@sql)
	set @sql= ('select * from Q1_'+ @lang+@name +' order by max_Q1 desc')
	exec (@sql)
