USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[MI]    Script Date: 11/01/2012 12:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Alter PROCEDURE [dbo].[MI]( @Vol as integer = 55, @N as integer = 385, @name as varchar (10) = 'TM', @exam as varchar (20) = 'rTM63' , @M as integer = 0, @num_cl as integer = 7, @lang as nvarchar(6) ='r', @r as integer = 1)
							--@Vol - объем обучающей выборки;  @N - общее количество документов в обучающей выборке; @name - имя тестируемого класса; @exam - тестируемый документ; @M - длина профиля; @num_cl - количество классов выборки; @lang - язык; @r - степень МИ-профиля



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
,@MI as float
,@tf as float -- вес термина 
,@exam_word as nvarchar(max)

if @lang = 'a' set @lang = 'ruseng' 
set @lang = RTRIM(@lang)

print @exam
--exec('update  q_'+@exam+' set Word = REPLACE (Word,'''''''','''')')
drop table  MI_temp1 
exec('select word, 0.0000 as MI, row_number() over(ORDER BY Count(word)) num 
into MI_temp1
from q_'+@exam+'
group by word')

set @MI = 0.00

set @i = 1 
While @i < (select COUNT(*) from MI_temp1)
		begin
			set @exam_word = (select word from MI_temp1 where num = @i)
			print('---------------vvvvv-----------------------')
			print @exam_word
			
			set @sql= ('select sum(count_docs) as count_docs into MI_temp3 FROM [TextCat].[dbo].[MDT_ruseng'+RTRIM( @name ) + '] where word = '''+@exam_word+''' group by Word') 
			print(@sql) -- CASE WHEN count_docs IS NULL THEN '0' ELSE count_docs END 
			exec (@sql)
			
			set @CD_cl = (select CASE WHEN (select COUNT(*) from MI_temp3) = 0 THEN (select COUNT(*) from MI_temp3) ELSE (select  count_docs from MI_temp3)END as count_docs )
--			set @CD_cl = (select COUNT(*) from MI_temp3  as count_docs )

			drop table MI_temp3
			drop table MI_temp4
			exec('select sum(count_docs) as count_docs into MI_temp4 FROM MDT_global_'+@lang+' where word = '''+@exam_word+''' group by word') 
			set @CD_gl =(select count_docs from  MI_temp4 )
			set @A = @CD_cl
			set @B = @CD_gl-@CD_cl
			set @C = @Vol - @CD_cl
			set @D = @Vol*(@num_cl - 1 )- @CD_gl
			Set @N = @num_cl* @Vol
			print('cd_cl = ' + ltrim(str(@cd_cl)) + '  cd_gl = ' + ltrim(str(@cd_gl)) + '  a= ' +ltrim(str(@a))+ '  b= ' +ltrim(str(@b))+ ' c=' +ltrim(str(@c))+ '  d= ' +ltrim(str(@d))+ '  n=' + ltrim(str(@n)))
			
			--Set @sql = ('Select sum(sum_'+rtrim(@exam)+') as num into MI_temp2 from MDT_Global_'+@lang +' where word = '''+rtrim(@exam_word)+''' group by  word')
			--print (@sql)						--MDT_ruseng'+ left(right(@exam,4),2)+'_tfidf
			--exec (@sql)
			----Set @tf = (select num from MI_temp2) + 0.00
			--print (@tf)4
			--print ('tf')
			
			drop table MI_temp2
			print('MI'+ltrim(str(@i)) + ' = '+ltrim(str(@MI)))
			print ((log((power(@A,@r)*@N)/((@A+@B)*(@A+@C))))/(log(2)))
 			set @MI =  ((log((power(@A,@r)*@N)/((@A+@B)*(@A+@C))))/(log(2)))  
 			
			update MI_temp1 set MI = @MI where num = @i
			print('---------------^^^^^----------------------')

			set @i = @i + 1
		end
		
	print @MI
--drop table MI_temp1	
print ('-----------------------------------------------------------------------------------------------------------------------')
			--  (o) (o)
			--	   v
			--	 vvvvv
			--	 ^^^^^

