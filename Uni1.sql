USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[UNI1]    Script Date: 10/28/2013 16:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[UNI1]
as

declare 
@name as nvarchar(2)
,@lang as nvarchar (6)
,@sqlstr as nvarchar (max)
,@i as integer
,@num_cl as integer = 7
,@top as nvarchar (4)= rtrim(9000)

set @i = 1
While @i < @num_cl + 1 -- количество классов +1
		begin
		set @name = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @i) )
		--set @lang = 'a' -- здесь д.б. 'a' для объединения русских и английских терминов 

--set @name = 'NM'	


		set @lang = 'ruseng'
		IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[uni1_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)	
		exec ('drop table uni1_'+@lang+@name)

		set @sqlstr = 'select z0.word, Max(z0.max_uni1) as max_uni1 from (SELECT     z1.word as WORD, (case  when (z1.max_ro > z2.max_mi_i)   then z1.max_ro ELSE z2.max_mi_i end )as max_uni1, z1.sum_countdocs as sum_countdocs
		into uni1_'+@lang+@name+' 
		FROM         (SELECT     TOP (9000) word, max_ro , row_number() over(ORDER BY max_ro desc) Position_in_RO, sum_countdocs
							   FROM          dbo.Ro_rNM) AS z1 FULL OUTER JOIN
								  (SELECT     TOP (9000) word, max_mi_i, row_number() over(ORDER BY max_MI_I desc) Position_in_MI,sum_countdocs

									FROM          dbo.MI_I_rNM) AS z2 ON z1.word = z2.word
									WHERE     (NOT (z2.word = N''isnull'')) AND (NOT (z1.word = N''isnull''))
 
									  									
		Union SELECT   z1.word,  (case  when (z1.max_ro > z2.max_mi_i)   then z1.max_ro ELSE z2.max_mi_i end ), z2.sum_countdocs
		FROM         (SELECT     TOP (9000) word, max_ro , row_number() over(ORDER BY max_ro desc) Position_in_RO, sum_countdocs
							   FROM          dbo.Ro_eNM) AS z1 FULL OUTER JOIN
								  (SELECT     TOP (9000) word, max_mi_i, row_number() over(ORDER BY max_MI_I desc) Position_in_MI,sum_countdocs

									FROM          dbo.MI_I_eNM) AS z2 ON z1.word = z2.word
									WHERE     (NOT (z2.word = N''isnull'')) AND (NOT (z1.word = N''isnull'') ) 
									
									) as z0 	
														group by z0.WORD 
														order by Max(z0.max_uni1)
															
									
									
									
									 
		----  вторая таблица -  считаем среднюю позицию в профиле                    
		--	  SELECT    sum(z1.Position_in_RO)as sum_RO, sum(z1.Position_in_RO)/count(z1.Position_in_RO)as mid_RO ,  sum(z2.Position_in_MI)as sum_MI, sum(z2.Position_in_MI)/count(z2.Position_in_MI)as mid_MI
		--    FROM         (SELECT     TOP ('+@top+') word , row_number() over(ORDER BY max_ro desc) Position_in_RO
		--					   FROM          dbo.Ro_'+@lang+@name+') AS z1 FULL OUTER JOIN
		--						  (SELECT     TOP ('+@top+') word,  row_number() over(ORDER BY max_MI_I desc) Position_in_MI

		--							FROM          dbo.MI_I_'+@lang+@name+') AS z2 ON z1.word = z2.word
		--							WHERE     (NOT (z2.word = N''isnull'')) AND (NOT (z1.word = N''isnull'')) 
		--											 '



		--print(@sqlstr)
		exec(@sqlstr)
		set @i = @i + 1
	end
