USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[CHI2_orig]    Script Date: 11/30/2012 12:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE [dbo].[proc_tfc]( @Vol as integer = 55, @N as integer = 385,  @exam as varchar (20) = 'rTM63' , @M as integer = 10, @num_cl as integer = 7, @lang as nvarchar (6) = 'r')
							--@Vol - объем обучающей выборки;  @N - общее количество документов в обучающей выборке



AS
declare 
@sql as nvarchar(max)
,@i as integer
,@j as integer
,@CHI as float
,@tf as float -- вес термина 
,@exam_word as nvarchar(max)
,@wg as float
,@wg_ as float
--,@exam as varchar (20) = 'rTM63'
--,@lang as char = 'r'
,@name as varchar (10) = ''

print ('asd')
delete from profile_result

if @lang = 'a' set @lang = 'ruseng' 

set @lang = RTRIM(@lang)
set @j = 1
while @j < @num_cl +1
	begin
		set @name = rtrim((select Class from Classes where num = (select cl_num from MDT_current where num = @j)))
		set @i = 1
		set @wg = 0.00000
		drop table profile_orig_temp
		drop table  profile_orig_temp2
--		print (@lang+ @name)

		exec ('select top '+@m+' word, count_words_tfc as weight into profile_orig_temp2 from MDT_' + @lang+ @name +'_tfc order by count_words_tfc desc, word')
		exec ('select word, '+@exam+' as tf, row_number() over(ORDER BY word desc) num into profile_orig_temp from q_'+ @exam   )
		while @i < (select COUNT (*) from profile_orig_temp) + 1 
			begin
				set @exam_word = (select word from profile_orig_temp where num = @i)
				set @tf = (select tf from profile_orig_temp where num = @i)
				set @CHI = (select CASE WHEN (select COUNT (*) from profile_orig_temp2 where word = @exam_word) = 0 then 0.000 ELSE (select weight from profile_orig_temp2 where word = @exam_word ) end)
				--print @tf
				--print @chi
			
				set @wg_ = @tf*@CHI
			--	print (@wg_)				
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