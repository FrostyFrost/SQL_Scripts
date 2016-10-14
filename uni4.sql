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

alter procedure UNI4(@top_r as nvarchar (4) ,@top_e as nvarchar (4), @name as nvarchar(2), @mult as numeric(4,2) = 1)

as

declare 

@lang as nvarchar (6)
,@sqlstr as nvarchar (max)
,@i as integer
,@num_cl as integer = 7


set @top_r = rtrim(@top_r)
set @top_e = rtrim(@top_e)


set @i = 1
--While @i < @num_cl + 1 -- количество классов +1
	--	begin
--		set @name = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @i) )
		--set @lang = 'a' -- здесь д.б. 'a' для объединения русских и английских терминов 
		--if @lang = 'a' set @lang = 'ruseng'

		exec ('drop table uni4_ruseng'+@name)
		exec ('select * 		
		into uni4_ruseng'+@name+' 
		 from (SELECT     TOP ('+@top_r+') dbo.MI_I_r'+@name+'.word, (power(dbo.MI_I_r'+@name+'.max_MI_I, 1)) AS max_uni4, sum_countdocs
FROM  dbo.MI_I_r'+@name+'  ) as z1 

UNION select  * from ( SELECT  TOP ('+@top_e+') dbo.MI_I_e'+@name+'.word, (power(dbo.MI_I_e'+@name+'.max_MI_I * '+@mult+', 1)) AS max_uni4, sum_countdocs
FROM  dbo.MI_I_e'+@name+'  ) as z2

                      ORDER BY max_uni4 desc') 
                      
		exec ('Update uni4_ruseng'+@name+' set max_uni4 = 1')

		print(@sqlstr)
		exec(@sqlstr)
--		set @i = @i + 1
--	end
