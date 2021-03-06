USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[UNS6]    Script Date: 01/26/2016 21:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  pROcedure [dbo].[UNS6](@top_r as nvarchar (4) ,@top_e as nvarchar (4), @name as nvarchar(2) )

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
		set @lang = 'ruseng' -- здесь д.б. 'a' для объединения русских и английских терминов 




		--if @lang = 'a' 
		IF  EXISTS (SELECT * from dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[uns6_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)	
		exec ('dROp table uns6_'+@lang+@name)


													 
		set @sqlstr = ('SELECT     TOP (100) PERCENT word, SUM(Sum_UNIS6) AS Max_UNIS6,  sum(z0.sum_countdocs ) as sum_countdocs 
			into UNIS6_ruseng'+@name+'
FROM         (SELECT     TOP ('+@top_e +') PERCENT dbo.MI_S_e'+@name+'.word, dbo.MI_S_e'+@name+'.sum_countdocs, dbo.MI_S_e'+@name+'.max_MI_S + dbo.RO_S_e'+@name+'.max_ro_S + dbo.S2_S_e'+@name+'.max_S2_S AS Sum_UNIS6
                       FROM          dbo.MI_s_e'+@name+' INNER JOIN
                                              dbo.RO_S_e'+@name+' ON dbo.MI_S_e'+@name+'.word = dbo.RO_S_e'+@name+'.word INNER JOIN
                                              dbo.S2_S_e'+@name+' ON dbo.RO_S_e'+@name+'.word = dbo.S2_S_e'+@name+'.word
                       UNION
                       SELECT     TOP ('+@top_r +') PERCENT dbo.MI_S_r'+@name+'.word, dbo.MI_S_r'+@name+'.sum_countdocs, dbo.MI_S_r'+@name+'.max_MI_S + dbo.RO_S_r'+@name+'.max_ro_S + dbo.S2_S_r'+@name+'.max_S2_S AS Expr1
                       FROM         dbo.MI_S_r'+@name+' INNER JOIN
                                             dbo.RO_S_r'+@name+' ON dbo.MI_S_r'+@name+'.word = dbo.RO_S_r'+@name+'.word INNER JOIN
                                             dbo.S2_S_r'+@name+' ON dbo.RO_S_r'+@name+'.word = dbo.S2_S_r'+@name+'.word) AS z0
GROUP BY word
ORDER BY max_UNIS6 DESC			
			')
        




		--print(@sqlstr)
		exec(@sqlstr)
--		set @i = @i + 1
--	end
