USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[CHI2_orig_parts]    Script Date: 05/20/2013 14:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CHI2_orig_parts]( @Vol as integer = 55, @N as integer = 385,  @exam as varchar (20) = 'rTM63' , @M as integer = 10, @num_cl as integer = 7, @lang as nvarchar (6) = 'r', @method as nvarchar (4) = 'PART', @mult as float = 1,  @method_a  as nvarchar (4), @method_t as nvarchar (4), @method_k as nvarchar (4) )
							--@Vol - объем обучающей выборки;  @N - общее количество документов в обучающей выборке



AS
declare 
@sql as nvarchar(max)
,@i as integer
,@j as integer
,@CHI as float
,@tf as float -- вес common-термина 
,@tf_t as float -- вес title-термина 
,@tf_k as float -- вес keyword-термина 
,@tf_a as float -- вес abstract-термина 
,@exam_word as nvarchar(max)
,@wg as float = 0.00000
,@wg_ as float = 0.00000
,@name as varchar (10) = ''
,@a numeric (5,3) 
,@t numeric (5,3) 
,@k numeric (5,3)
delete from profile_result

if @lang = 'a' set @lang = 'ruseng' 

set @lang = RTRIM(@lang)
set @method = RTRIM (@method)
set @j = 1
while @j < @num_cl +1
	begin
		set @name = rtrim((select Class from Classes where num = (select cl_num from MDT_current where num = @j)))
		set @wg = 0.00000

		drop table profile_orig_temp	--tf from q_AU60 - exam	
		--drop table profile_orig_temp2	--weight from profile
		drop table profile_orig_temp3	--title-profile
		drop table profile_orig_temp4	--keywords-profile
		drop table profile_orig_temp5	--abstract-profile

	
		exec ('select top '+@m+' word, sum_countdocs, max_'+@method_t+' as weight  into profile_orig_temp3 from '+@method_t+'_' + @lang+ @name +' order by max_'+@method_t+' desc')
		exec ('select top '+@m+' word, sum_countdocs, max_'+@method_k+' as weight  into profile_orig_temp4 from '+@method_k+'_' + @lang+ @name +' order by max_'+@method_k+' desc')
		exec ('select top '+@m+' word, sum_countdocs, max_'+@method_a+' as weight  into profile_orig_temp5 from '+@method_a+'_' + @lang+ @name +' order by max_'+@method_a+' desc')

		exec ('select word, '+@exam+' as tf , '+@exam+'_t as tf_t , '+@exam+'_k as tf_k, '+@exam+'_a as tf_a, row_number() over(ORDER BY word desc) num into profile_orig_temp from q_'+ @exam   )
		
		set @i = 1
		while @i < (select COUNT (*) from profile_orig_temp) + 1 
			begin
					
				set @exam_word = (select word from profile_orig_temp where num = @i)
				set @tf = (select tf from profile_orig_temp where num = @i)
												
				set @tf_t = (select tf_t from profile_orig_temp where num = @i)
				set @tf_k = (select tf_k from profile_orig_temp where num = @i)
				set @tf_a = (select tf_a from profile_orig_temp where num = @i)
				
				set @t = (select CASE WHEN (select COUNT (*) from profile_orig_temp3 where word = @exam_word) = 0 then 0.000 ELSE (select weight from profile_orig_temp3 where word = @exam_word ) end)
				set @k = (select CASE WHEN (select COUNT (*) from profile_orig_temp4 where word = @exam_word) = 0 then 0.000 ELSE (select weight from profile_orig_temp4 where word = @exam_word ) end)
				set @a = (select CASE WHEN (select COUNT (*) from profile_orig_temp5 where word = @exam_word) = 0 then 0.000 ELSE (select weight from profile_orig_temp5 where word = @exam_word ) end)
				
				print @exam_word
				print (@tf_t)
				print (@tf_k)
				print (@tf_a)
				 
			
				--if (select SUM(tf_k) FROM profile_orig_temp)=0 set @k = 0 else set @k=(select 1.00/SUM(tf_k)   FROM profile_orig_temp)  
				--print('tf_k')
				--print(@k)
				--(select 1.00/SUM(tf_k) FROM profile_orig_temp)
				
				set @wg_ = (@tf_t*@t + @tf_k*@k + @tf_a*@a) -- если оценивать каждую часть своим профилем
				print (@wg_)				
				set @wg = @wg + @wg_

				set @i = @i + 1
			end
		print('----------------Сумма весов документа '+@exam + ' в классе ' +@Name)
		print @wg
		insert into profile_result (class, exam, weight) values (@name, @exam, @wg)
		set @j= @j+1
	end
	
--print (@sql)
--exec (@sql)
--insert into tblCHI2 ( Class, Weight) values ((select top 1 Class from CHI2_result order by chi2_orig desc), (select top 1 chi2_orig from CHI2_result order by chi2_orig desc)) 