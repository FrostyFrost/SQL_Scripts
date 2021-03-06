USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[UNI6]    Script Date: 10/09/2015 15:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[UNI6](@top_r as nvarchar (4) ,@top_e as nvarchar (4), @name as nvarchar(2), @Fish1 as   nvarchar (4) , @Fish2  as nvarchar (4) , @Fish3 as   nvarchar (4) )

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
		IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[uni6_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)	
		exec ('drop table uni6_'+@lang+@name)


													 
			set @sqlstr = ('SELECT     TOP (100) PERCENT word, SUM(Sum_uni6) AS Max_uni6,  sum(z0.sum_countdocs ) as sum_countdocs 
			into uni6_ruseng'+@name+'
FROM         (SELECT     TOP ('+@top_e +') PERCENT dbo.MI_I_e'+@name+'.word, dbo.MI_I_e'+@name+'.sum_countdocs, ' + @Fish1 +' * dbo.MI_I_e'+@name+'.max_MI_I + ' + @Fish2 +' *  dbo.RO_e'+@name+'.max_ro + ' + @Fish3 +' *  dbo.S2_e'+@name+'.max_S2 AS Sum_uni6
                       FROM          dbo.MI_I_e'+@name+' INNER JOIN
                                              dbo.RO_e'+@name+' ON dbo.MI_I_e'+@name+'.word = dbo.RO_e'+@name+'.word INNER JOIN
                                              dbo.S2_e'+@name+' ON dbo.RO_e'+@name+'.word = dbo.S2_e'+@name+'.word
                       UNION
                       SELECT     TOP ('+@top_r +') PERCENT dbo.MI_I_r'+@name+'.word, dbo.MI_I_r'+@name+'.sum_countdocs, ' + @Fish1 +' *  dbo.MI_I_r'+@name+'.max_MI_I + ' + @Fish2 +' *  dbo.RO_r'+@name+'.max_ro + ' + @Fish3 +' * dbo.S2_r'+@name+'.max_S2 AS Expr1
                       FROM         dbo.MI_I_r'+@name+' INNER JOIN
                                             dbo.RO_r'+@name+' ON dbo.MI_I_r'+@name+'.word = dbo.RO_r'+@name+'.word INNER JOIN
                                             dbo.S2_r'+@name+' ON dbo.RO_r'+@name+'.word = dbo.S2_r'+@name+'.word) AS z0
GROUP BY word
ORDER BY max_uni6 DESC			
			')
        




		--print(@sqlstr)
		exec(@sqlstr)
--		set @i = @i + 1
--	end
