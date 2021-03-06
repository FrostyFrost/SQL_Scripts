USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[S2_P]    Script Date: 01/30/2016 16:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER  PROCEDURE [dbo].[S2_P]( @Vol as integer = 65, @N as float = 455.00, @name as varchar (2) = 'TM' , @num_cl as integer = 7, @lang as nvarchar (6) = 'r')
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
,@S2 as float
,@tf as float -- вес термина 
,@exam_word as nvarchar(max)



if @lang = 'a' set @lang = 'ruseng'
set @lang = RTRIM(@lang)
--exec('update  mdt_'+@lang + @name + '_tfidf set Word = REPLACE (Word,'''''''','''')')

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_temp1]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table S2_temp1 

exec('CREATE TABLE S2_temp1 (num int, word varchar(100), count_docs int, S2 float)')
exec('insert into S2_temp1 select row_number() over(ORDER BY Count(word)) num , word, count_docs, 0.000 as S2
from mdt_'+@lang + @name + '_t
group by word, count_docs
')

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_t_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table S2_t_'+@lang+@name+ '')

--exec('CREATE TABLE Chi2_'+@name +' (word varchar(100), chi2 float))')
set @i = 1
	while @i<(select COUNT(*) from S2_temp1) + 1
		begin
		
			set @exam_word = (select word from S2_temp1 where num = @i)
			set @CD_cl = (select count_docs from S2_temp1 where word = @exam_word)
			exec ('select count_docs into S2_temp2 FROM [TextCat].[dbo].[MDT_global_'+@lang+'_t] where word = '''+@exam_word +'''')
			set @CD_gl = (select count_docs FROM S2_temp2 ) 
			IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_TEMP2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
			drop table S2_TEMP2
			
			set @A = @CD_cl
			set @B = @CD_gl-@CD_cl
			set @C = @Vol - @CD_cl
			set @D = @Vol*(@num_cl - 1 )- @CD_gl + @CD_cl 
			--Set @N = @num_cl* @Vol -- входной параметр
		
			set @S2 =  ((@A)*1.0000)/(@A+@B+@C) -- Жаккар
						
			print @S2 
			print  @exam_word
			set @i = @i +1
			
			update S2_temp1 set  S2 = @S2  where word = @exam_word  -- ФИ = (@chi/@N), РО = sqrt((@chi/@N))
			
		end
	--select * from 	S2_temp1
	set @sql = ('select max(num) as max_num, word as word, SUM(count_docs) as sum_countdocs, MAX(S2) as max_S2_t into S2_t_'+@lang+@name+' from S2_temp1  group by word  order by max(S2) desc, word ')
	print (@sql)	
	exec(@sql)
	set @sql= ('select * from S2_t_'+ @lang+@name +' order by max_S2_t desc')
	exec (@sql)

-----abstr

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_temp1]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table S2_temp1 

exec('CREATE TABLE S2_temp1 (num int, word varchar(100), count_docs int, S2 float)')
exec('insert into S2_temp1 select row_number() over(ORDER BY Count(word)) num , word, count_docs, 0.000 as S2
from mdt_'+@lang + @name + '_a
group by word, count_docs
')

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_a_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table S2_a_'+@lang+@name+ '')

--exec('CREATE TABLE Chi2_'+@name +' (word varchar(100), chi2 float))')
set @i = 1
	while @i<(select COUNT(*) from S2_temp1) + 1
		begin
		
			set @exam_word = (select word from S2_temp1 where num = @i)
			set @CD_cl = (select count_docs from S2_temp1 where word = @exam_word)
			exec ('select count_docs into S2_temp2 FROM [TextCat].[dbo].[MDT_global_'+@lang+'_a] where word = '''+@exam_word +'''')
			set @CD_gl = (select count_docs FROM S2_temp2 ) 
			IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_TEMP2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
			drop table S2_TEMP2
			
			set @A = @CD_cl
			set @B = @CD_gl-@CD_cl
			set @C = @Vol - @CD_cl
			set @D = @Vol*(@num_cl - 1 )- @CD_gl + @CD_cl 
			--Set @N = @num_cl* @Vol -- входной параметр
		
 			set @S2 =  (@A*((log((@A*@N)/((@A+@B)*(@A+@C)))) / (log(2))))   /   ((@A+@B)*((log(@N/((@A+@B)))) / (LOG(2))))
			
			print @S2 
			print  @exam_word
			set @i = @i +1
			
			update S2_temp1 set  S2 = @S2  where word = @exam_word  -- ФИ = (@chi/@N), РО = sqrt((@chi/@N))
			
		end
	--select * from 	S2_temp1
	set @sql = ('select max(num) as max_num, word as word, SUM(count_docs) as sum_countdocs, MAX(S2) as max_S2_a into S2_a_'+@lang+@name+' from S2_temp1  group by word  order by max(S2) desc, word ')
	print (@sql)	
	exec(@sql)
	set @sql= ('select * from S2_a_'+ @lang+@name +' order by max_S2_a desc')
	exec (@sql)


----keywords

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_temp1]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table S2_temp1 

exec('CREATE TABLE S2_temp1 (num int, word varchar(100), count_docs int, S2 float)')
exec('insert into S2_temp1 select row_number() over(ORDER BY Count(word)) num , word, count_docs, 0.000 as S2
from mdt_'+@lang + @name + '_k
group by word, count_docs
')

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_k_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table S2_k_'+@lang+@name+ '')

--exec('CREATE TABLE Chi2_'+@name +' (word varchar(100), chi2 float))')
set @i = 1
	while @i<(select COUNT(*) from S2_temp1) + 1
		begin
		
			set @exam_word = (select word from S2_temp1 where num = @i)
			set @CD_cl = (select count_docs from S2_temp1 where word = @exam_word)
			exec ('select count_docs into S2_temp2 FROM [TextCat].[dbo].[MDT_global_'+@lang+'_k] where word = '''+@exam_word +'''')
			set @CD_gl = (select count_docs FROM S2_temp2 ) 
			IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_TEMP2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
			drop table S2_TEMP2
			
			set @A = @CD_cl
			set @B = @CD_gl-@CD_cl
			set @C = @Vol - @CD_cl
			set @D = @Vol*(@num_cl - 1 )- @CD_gl + @CD_cl 
			--Set @N = @num_cl* @Vol -- входной параметр
		
 			set @S2 =  (@A*((log((@A*@N)/((@A+@B)*(@A+@C)))) / (log(2))))   /   ((@A+@B)*((log(@N/((@A+@B)))) / (LOG(2))))
			
			print @S2 
			print  @exam_word
			set @i = @i +1
			
			update S2_temp1 set  S2 = @S2  where word = @exam_word  -- ФИ = (@chi/@N), РО = sqrt((@chi/@N))
			
		end
	--select * from 	S2_temp1
	set @sql = ('select max(num) as max_num, word as word, SUM(count_docs) as sum_countdocs, MAX(S2) as max_S2_k into S2_k_'+@lang+@name+' from S2_temp1  group by word  order by max(S2) desc, word ')
	print (@sql)	
	exec(@sql)
	set @sql= ('select * from S2_k_'+ @lang+@name +' order by max_S2_k desc')
	exec (@sql)


