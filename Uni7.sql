USE [TextCat]
GO

/****** Object:  StoredProcedure [dbo].[UNI1]    Script Date: 10/27/2015 22:25:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Alter procedure [dbo].[UNI7] (@name as nvarchar(2), @top as nvarchar (4)= '200' )
as

declare 
--@name as nvarchar(2)
@lang as nvarchar (6)
,@sqlstr as nvarchar (max)
,@i as integer
,@num_cl as integer = 7
--,@top as nvarchar (4)= rtrim(9000)

--set @i = 1
--While @i < @num_cl + 1 -- количество классов +1
--		begin
--		set @name = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @i) )
--		--set @lang = 'a' -- здесь д.б. 'a' для объединения русских и английских терминов 

--set @name = 'NM'	


		set @lang = 'ruseng'
		IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[uni1_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)	
		exec ('drop table uni7_'+@lang+@name)

		set @sqlstr = '
		Select Top ('+@top +') z1.word,  (case  when (z1.max_ro > z2.max_mi_i)   then z1.max_ro ELSE z2.max_mi_i end ) as max_uni7
		into uni7_'+@lang+@name+'  
		from (select top ('+@top +') * from RO_ruseng'+@name + '  order by max_ro desc) as z1 
		inner join (select top ('+@top +') * from MI_I_ruseng'+@name + '  order by max_mi_i desc) as z2 
		on z1.word = z2.word order by max_uni7 desc'
		
		
		--select top ('+@top +') z.word as word, max(max_weight) as max_uni7
		--into uni7_'+@lang+@name+' 
		--from (Select top ('+@top +') word, max_ro as MAX_Weight from RO_ruseng'+@name + ' 
		--union Select top ('+@top +') word,max_MI_I from MI_I_ruseng'+@name + ' ) as Z 
		--group by word order by max(max_weight) desc
		
		exec(@sqlstr)
	--	set @i = @i + 1
	--end

GO


