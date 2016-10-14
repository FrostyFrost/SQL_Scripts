USE [TextCat]
GO

/****** Object:  StoredProcedure [dbo].[CHI2]    Script Date: 10/31/2012 11:58:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE [dbo].[CHI2_CHI2]( @Vol as integer = 55, @N as integer = 385,  @M as integer = 10, @num_cl as integer = 7, @lang as nvarchar (6) = 'r')
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
,@exam as varchar (20) = 'chi2_temp1'
--,@lang as char = 'r'
,@name as varchar (10) = 'TM'

delete from CHI2_result


if @lang = 'a' set @lang = 'ruseng' 

set @lang = RTRIM(@lang)
set @j = 1
while @j < @num_cl +1
	begin
		set @name = rtrim((select Class from Classes where num = @j))
		print(@name)
		set @wg = 0.00000
	  --drop table chi2_orig_temp	-- заменяется на 'chi2_temp1'
		drop table  chi2_chi2_temp2 -- таблица ХИ2 весов класса
		
		exec ('select top '+@m+' *  into chi2_chi2_temp2 from chi2_' + @lang+ @name +' order by max_chi2 desc')
		
		--exec ('select word, chi2 as tf, num into chi_orig_temp from '+ @exam   )
		set @i = 1
		while @i < (select COUNT (*) from chi2_temp1) + 1 
			begin
				set @exam_word = (select word from chi2_temp1 where num = @i)
				set @tf = (select chi2 from chi2_temp1 where num = @i)
				set @CHI = (select CASE WHEN (select COUNT (*) from chi2_chi2_temp2 where word = @exam_word) = 0 then 0.000 ELSE (select max_chi2 from chi2_chi2_temp2 where word = @exam_word ) end)
				--print @tf
				--print @chi
				
				set @wg_ = @tf*@CHI
								
				set @wg = @wg + @wg_

				set @i = @i + 1
			end
		print('----------------Сумма весов документа '+@exam + ' в классе ' +@Name)
		print @wg
		insert into CHI2_result (class, exam, chi2_orig) values (@name, @exam, @wg)
		set @j= @j+1
	end
	
--print (@sql)
--exec (@sql)
--insert into tblCHI2 ( Class, Weight) values ((select top 1 Class from CHI2_result order by chi2_orig desc), (select top 1 chi2_orig from CHI2_result order by chi2_orig desc)) 