USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[CHI2_orig]    Script Date: 02/25/2014 10:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CHI2_orig]( @Vol as integer = 55, @N as integer = 385,  @exam as varchar (20) = 'rTM63' , @M as integer = 10, @num_cl as integer = 7, @lang as nvarchar (6) = 'r', @method as nvarchar (4) = 'chi2', @mult as float = 1)
							--@Vol - объем обучающей выборки;  @N - общее количество документов в обучающей выборке



AS
declare 
@sql as nvarchar(max)
,@i as integer
,@j as integer
,@CHI as float
,@tf as float -- вес common-термина 
,@exam_word as nvarchar(max)
,@wg as float
,@wg_ as float
,@name as varchar (10) = ''

delete from profile_result

if @lang = 'a' set @lang = 'ruseng' 

set @lang = RTRIM(@lang)
set @method = RTRIM (@method)
set @j = 1
while @j < @num_cl +1
	begin
		set @name = rtrim((select Class from Classes where num = (select cl_num from MDT_current where num = @j)))
		set @i = 1
		set @wg = 0.00000
		
		IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[profile_orig_temp]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
		drop table profile_orig_temp	--tf from q_AU60	
		IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[profile_orig_temp2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
		drop table profile_orig_temp2	--weight from profile
	
--		print (@lang+ @name)
		--print ('select top '+str(@m)+' word, sum_countdocs, max_'+str(@method)+' as weight  into profile_orig_temp2 from '+str(@method)+'_' + str(@lang)+ str(@name )+' order by max_'+str(@method)+' desc')
		exec ('select top '+@m+' word, sum_countdocs, max_'+@method+' as weight  into profile_orig_temp2 from '+@method+'_' + @lang+ @name +' order by max_'+@method+' desc')
	

		exec ('select word, '+@exam+' as tf , row_number() over(ORDER BY word desc) num into profile_orig_temp from q_'+ @exam   )
		--		exec ('select word, '+@exam+' as tf , '+@exam+'_t as tf_t , '+@exam+'_k as tf_k, '+@exam+'_a as tf_a, row_number() over(ORDER BY word desc) num into profile_orig_temp from q_'+ @exam   )

		while @i < (select COUNT (*) from profile_orig_temp) + 1 
			begin
					
				set @exam_word = (select word from profile_orig_temp where num = @i)
				set @tf = (select tf from profile_orig_temp where num = @i)
				
				
				print @exam_word 
				--print ('select CASE WHEN (select COUNT (*) from profile_orig_temp2 where word = '''+@exam_word+''') = 0 then 0.000 ELSE (select weight from profile_orig_temp2 where word = '''+@exam_word+''' ) end')
				set @CHI = (select CASE WHEN (select COUNT (*) from profile_orig_temp2 where word = @exam_word) = 0 then 0.000 ELSE (select weight from profile_orig_temp2 where word = @exam_word ) end)
				print @chi
				 
			
				--if (select SUM(tf_k) FROM profile_orig_temp)=0 set @k = 0 else set @k=(select 1.00/SUM(tf_k)   FROM profile_orig_temp)  
				--print('tf_k')
				--print(@k)
				--(select 1.00/SUM(tf_k) FROM profile_orig_temp)
				
				set @wg_ = @CHI* @tf -- если оценивать одним профилем
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