USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[UNI5]    Script Date: 11/29/2013 13:36:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[UNI5](@top_r as nvarchar (4) ,@top_e as nvarchar (4), @name as nvarchar(2))

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
		set @lang = 'a' -- здесь д.б. 'a' для объединения русских и английских терминов 




		if @lang = 'a' set @lang = 'ruseng'
		IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[uni5_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)	
		exec ('drop table uni5_'+@lang+@name)


													 
			set @sqlstr = ('select z0.word, max(z0.max_UNI5) as max_UNI5, max(z0.sum_countdocs ) as sum_countdocs 
			into uni5_'+@lang+@name+' from
 (select * 	from (SELECT     TOP ('+@top_r+') dbo.MI_I_r'+@name+'.word, dbo.MI_I_r'+@name+'.max_MI_I, dbo.S1_r'+@name+'.word AS Expr1, dbo.S1_r'+@name+'.max_S1, (S1_r'+@name+'.max_S1 + MI_I_r'+@name+'.max_mi_i) 
                      AS max_uni5, dbo.S1_r'+@name+'.sum_countdocs
FROM       dbo.MI_I_r'+@name+' FULL OUTER JOIN
                      dbo.S1_r'+@name+' ON dbo.MI_I_r'+@name+'.word = dbo.S1_r'+@name+'.word order by  (S1_r'+@name+'.max_S1 + MI_I_r'+@name+'.max_mi_i)  desc ) as z1 

UNION select  * from ( SELECT  TOP ('+@top_e+') dbo.MI_I_e'+@name+'.word, dbo.MI_I_e'+@name+'.max_MI_I, dbo.S1_e'+@name+'.word as Expr1, dbo.S1_e'+@name+'.max_S1, (S1_e'+@name+'.max_S1 + MI_I_e'+@name+'.max_mi_i) 
                      as max_uni5 , dbo.S1_e'+@name+'.sum_countdocs
FROM         dbo.MI_I_e'+@name+' FULL OUTER JOIN
                      dbo.S1_e'+@name+' ON dbo.MI_I_e'+@name+'.word = dbo.S1_e'+@name+'.word order by  (S1_e'+@name+'.max_S1 + MI_I_e'+@name+'.max_mi_i)  desc) as z2) as z0 
                       group by z0.word
                       ORDER BY max_UNI5 desc')
        




		--print(@sqlstr)
		exec(@sqlstr)
--		set @i = @i + 1
--	end
