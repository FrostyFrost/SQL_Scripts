USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[uni3]    Script Date: 11/29/2013 14:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[UNI3](@top_r as nvarchar (4) ,@top_e as nvarchar (4), @name as nvarchar(2))

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
		IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[uni3_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)	
		exec ('drop table uni3_'+@lang+@name)

--		set @sqlstr = ('select * 		-- Старая версия - с повторяющимися словами
--		into uni2_'+@lang+@name+' 
--		 from (SELECT     TOP ('+@top_r+') dbo.MI_I_r'+@name+'.word, dbo.MI_I_r'+@name+'.max_MI_I, dbo.Ro_r'+@name+'.word AS Expr1, dbo.Ro_r'+@name+'.max_ro, (CASE WHEN (Ro_r'+@name+'.max_ro > MI_I_r'+@name+'.max_mi_i) 
--                      THEN Ro_r'+@name+'.max_ro ELSE MI_I_r'+@name+'.max_mi_i END) AS max_uni2, dbo.Ro_r'+@name+'.sum_countdocs


--FROM       dbo.MI_I_r'+@name+' FULL OUTER JOIN
--                      dbo.Ro_r'+@name+' ON dbo.MI_I_r'+@name+'.word = dbo.Ro_r'+@name+'.word order by  (CASE WHEN (Ro_r'+@name+'.max_ro > MI_I_r'+@name+'.max_mi_i) 
--                      THEN Ro_r'+@name+'.max_ro ELSE MI_I_r'+@name+'.max_mi_i END) desc ) as z1 

--UNION select  * from ( SELECT  TOP ('+@top_e+') dbo.MI_I_e'+@name+'.word, dbo.MI_I_e'+@name+'.max_MI_I, dbo.Ro_e'+@name+'.word as Expr1, dbo.Ro_e'+@name+'.max_ro, (CASE WHEN (Ro_e'+@name+'.max_ro > MI_I_e'+@name+'.max_mi_i) 
--                      THEN Ro_e'+@name+'.max_ro ELSE MI_I_e'+@name+'.max_mi_i END)as max_uni2 , dbo.Ro_e'+@name+'.sum_countdocs
--FROM         dbo.MI_I_e'+@name+' FULL OUTER JOIN
--                      dbo.Ro_e'+@name+' ON dbo.MI_I_e'+@name+'.word = dbo.Ro_e'+@name+'.word order by  (CASE WHEN (Ro_e'+@name+'.max_ro > MI_I_e'+@name+'.max_mi_i) 
--                      THEN Ro_e'+@name+'.max_ro ELSE MI_I_e'+@name+'.max_mi_i END) desc) as z2
--                      ORDER BY max_uni2 desc') 
													 
			set @sqlstr = ('select z0.word, max(z0.max_uni3) as max_uni3, max(z0.sum_countdocs ) as sum_countdocs 
			into uni3_'+@lang+@name+' from
 (select * 	from (SELECT     TOP ('+@top_r+') dbo.MI_I_r'+@name+'.word, dbo.MI_I_r'+@name+'.max_MI_I, dbo.S1_r'+@name+'.word AS Expr1, dbo.S1_r'+@name+'.max_S1, (CASE WHEN (S1_r'+@name+'.max_S1 > MI_I_r'+@name+'.max_mi_i) 
                      THEN S1_r'+@name+'.max_S1 ELSE MI_I_r'+@name+'.max_mi_i END) AS max_uni3, dbo.S1_r'+@name+'.sum_countdocs


FROM       dbo.MI_I_r'+@name+' FULL OUTER JOIN
                      dbo.S1_r'+@name+' ON dbo.MI_I_r'+@name+'.word = dbo.S1_r'+@name+'.word order by  (CASE WHEN (S1_r'+@name+'.max_S1 > MI_I_r'+@name+'.max_mi_i) 
                      THEN S1_r'+@name+'.max_S1 ELSE MI_I_r'+@name+'.max_mi_i END) desc ) as z1 

UNION select  * from ( SELECT  TOP ('+@top_e+') dbo.MI_I_e'+@name+'.word, dbo.MI_I_e'+@name+'.max_MI_I, dbo.S1_e'+@name+'.word as Expr1, dbo.S1_e'+@name+'.max_S1, (CASE WHEN (S1_e'+@name+'.max_S1 > MI_I_e'+@name+'.max_mi_i) 
                      THEN S1_e'+@name+'.max_S1 ELSE MI_I_e'+@name+'.max_mi_i END)as max_uni3 , dbo.S1_e'+@name+'.sum_countdocs
FROM         dbo.MI_I_e'+@name+' FULL OUTER JOIN
                      dbo.S1_e'+@name+' ON dbo.MI_I_e'+@name+'.word = dbo.S1_e'+@name+'.word order by  (CASE WHEN (S1_e'+@name+'.max_S1 > MI_I_e'+@name+'.max_mi_i) 
                      THEN S1_e'+@name+'.max_S1 ELSE MI_I_e'+@name+'.max_mi_i END) desc) as z2) as z0 
                       group by z0.word')
        




		--print(@sqlstr)
		exec(@sqlstr)
--		set @i = @i + 1
--	end
