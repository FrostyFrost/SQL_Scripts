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
alter PROCEDURE [dbo].[CHI2]( @Vol as integer = 55, @N as integer = 385, @name as varchar (10) = 'TM', @exam as varchar (20) = 'rTM63' , @M as integer = 0, @num_cl as integer = 7)
							--@Vol - объем обучающей выборки;  @N - общее количество документов в обучающей выборке



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



--set @CD_cl = (select count_docs FROM [TextCat].[dbo].[MDT_rTM] where word = @exam) 
--set @CD_gl = (select count_docs FROM [TextCat].[dbo].[MDT_global] where word = @exam) 
--set @A = @CD_cl
--set @B = @CD_gl-@CD_cl
--set @C = @Vol - @CD_cl
--set @D = @Vol*(@num_cl - 1 )- @CD_gl
--Set @N = @num_cl* @Vol
----set @exam_word =  654-   361201\ 29*14147*55*322


--set @CHI = @tf * log(@A*@N+0.00) / ((@A+@B)*(@A+@C))
--set @CHI = @tf * square(@A*@D-@B*@C) / ((@A+@B)*(@C+@D)*(@A+@C)*(@B+@D))  --  * @N



exec('update  q_'+@exam+' set Word = REPLACE (Word,'''''''','''')')
drop table  chi2_temp1 
exec('select word, 0.0000 as chi2, row_number() over(ORDER BY Count(word)) num 
into chi2_temp1
from q_'+@exam+'
group by word')

set @CHI = 0.00
set @i = 1 
While @i < (select COUNT(*) from chi2_temp1)
		begin
			set @exam_word = (select word from chi2_temp1 where num = @i)
			print('---------------vvvv-----------------------')
			print @exam_word
			
			set @sql= ('select sum(count_docs) as count_docs into chi2_temp3 FROM [TextCat].[dbo].[MDT_ruseng'+RTRIM( @name ) + '] where word = '''+@exam_word+''' group by Word') 
			print(@sql) -- CASE WHEN count_docs IS NULL THEN '0' ELSE count_docs END 
			exec (@sql)
			set @CD_cl = (select CASE WHEN (select COUNT(*) from chi2_temp3) = 0 THEN (select COUNT(*) from chi2_temp3) ELSE (select  count_docs from chi2_temp3)ENd as count_docs )
--			set @CD_cl = (select COUNT(*) from chi2_temp3  as count_docs )

			drop table chi2_temp3
			set @CD_gl = (select sum(count_docs) as count_docs FROM [TextCat].[dbo].[MDT_global] where word = @exam_word group by word) 
			set @A = @CD_cl
			set @B = @CD_gl-@CD_cl
			set @C = @Vol - @CD_cl
			set @D = @Vol*(@num_cl - 1 )- @CD_gl
			Set @N = @num_cl* @Vol
			print('cd_cl = ' + ltrim(str(@cd_cl)) + '  cd_gl = ' + ltrim(str(@cd_gl)) + '  a= ' +ltrim(str(@a))+ '  b= ' +ltrim(str(@b))+ ' c=' +ltrim(str(@c))+ '  d= ' +ltrim(str(@d))+ '  n=' + ltrim(str(@n)))
			
			Set @sql = ('Select sum(sum_'+rtrim(@exam)+') as num into chi2_temp2 from MDT_Global where word = '''+rtrim(@exam_word)+''' group by  word')
			print (@sql)						--MDT_ruseng'+ left(right(@exam,4),2)+'_tfidf
			exec (@sql)
			--Set @tf = (select num from chi2_temp2) + 0.00
			--print (@tf)
			--print ('tf')
			drop table chi2_temp2
			print('chi'+ltrim(str(@i)) + ' = '+ltrim(str(@CHI)))
			print ((  1.00*square(@A*@D-@B*@C))/((@A+@B)*(@C+@D)*(@A+@C)*(@B+@D)))
 			set @CHI =  ( 1.00*square(@A*@D-@B*@C))/((@A+@B)*(@C+@D)*(@A+@C)*(@B+@D))   --  * @N
 			
			update chi2_temp1 set chi2 = @CHI where num = @i
			print('---------------^^^^^----------------------')

			set @i = @i + 1
		end
		
	print @chi
--drop table chi2_temp1	
print ('-----------------------------------------------------------------------------------------------------------------------')
