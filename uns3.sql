USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[uns3]    Script Date: 01/27/2016 11:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter procedure [dbo].[UNS3](@top_r as nvarchar (4) ,@top_e as nvarchar (4), @name as nvarchar(2))

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
		IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[uns3_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)	
		exec ('drop table uns3_'+@lang+@name)

 
			set @sqlstr = ('select z0.word, max(z0.max_uns3) as max_uns3, max(z0.sum_countdocs ) as sum_countdocs 
			into uns3_'+@lang+@name+' from
 (select * 	from (SELECT     TOP ('+@top_r+') dbo.RO_S_r'+@name+'.word, dbo.RO_S_r'+@name+'.max_RO_S, dbo.S2_S_r'+@name+'.word AS Expr1, dbo.S2_S_r'+@name+'.max_S2_S, (CASE WHEN (S2_S_r'+@name+'.max_S2_S > RO_S_r'+@name+'.max_RO_S) 
                      THEN S2_S_r'+@name+'.max_S2_S ELSE RO_S_r'+@name+'.max_RO_S END) AS max_uns3, dbo.S2_S_r'+@name+'.sum_countdocs


FROM       dbo.RO_S_r'+@name+' FULL OUTER JOIN
                      dbo.S2_S_r'+@name+' ON dbo.RO_S_r'+@name+'.word = dbo.S2_S_r'+@name+'.word order by  (CASE WHEN (S2_S_r'+@name+'.max_S2_S > RO_S_r'+@name+'.max_RO_S) 
                      THEN S2_S_r'+@name+'.max_S2_S ELSE RO_S_r'+@name+'.max_RO_S END) desc ) as z1 

UNION select  * from ( SELECT  TOP ('+@top_e+') dbo.RO_S_e'+@name+'.word, dbo.RO_S_e'+@name+'.max_RO_S, dbo.S2_S_e'+@name+'.word as Expr1, dbo.S2_S_e'+@name+'.max_S2_S, (CASE WHEN (S2_S_e'+@name+'.max_S2_S > RO_S_e'+@name+'.max_RO_S) 
                      THEN S2_S_e'+@name+'.max_S2_S ELSE RO_S_e'+@name+'.max_RO_S END)as max_uns3 , dbo.S2_S_e'+@name+'.sum_countdocs
FROM         dbo.RO_S_e'+@name+' FULL OUTER JOIN
                      dbo.S2_S_e'+@name+' ON dbo.RO_S_e'+@name+'.word = dbo.S2_S_e'+@name+'.word order by  (CASE WHEN (S2_S_e'+@name+'.max_S2_S > RO_S_e'+@name+'.max_RO_S) 
                      THEN S2_S_e'+@name+'.max_S2_S ELSE RO_S_e'+@name+'.max_RO_S END) desc) as z2) as z0 
                       group by z0.word')
        




		--print(@sqlstr)
		exec(@sqlstr)
--		set @i = @i + 1
--	end
