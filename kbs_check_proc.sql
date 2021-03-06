USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[kbs_check]    Script Date: 11/28/2012 15:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[kbs_check] (
@m as int
,@exam as nvarchar (5) -- lang + ex = rTM
,@k as int  -- количество БС
,@i as int  -- rTMi
,@desc as nvarchar (4) = 'desc'
,@lang_ as nvarchar (6)
) 



as
declare 
@sql as nvarchar(max)
,@n as int
--,@ttt as nvarchar(max) = 'select  top 10  name, distance, ''rTM47''  from BS order by distance desc 

if @lang_ = 'ruseng' set @n = 2
else set @n = 3
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[#temp]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table #temp
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[#temp2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table #temp2
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[#temp3]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table #temp3
set @sql = '
select top '+ltrim(str(@k))+' substring(m'+ltrim(str(@m))+'_n, 5, '+str(@n)+') as name, ''0'' as rep into #temp from ccc where www = '''+@exam+ltrim(str(@i))+''';

select  row_number() over(ORDER BY Count(name) '+@desc+') num, name,  Count(name) as rep into #temp2 from #temp GROUP BY name, rep
ORDER BY Count(name) '+@desc+';

create table #temp3
		([Name1] nvarchar (10),
		rep1 int ,
		[Name2] nvarchar (10),
		rep2 int )
		
insert into #temp3(Name1, rep1) select Name, rep from #temp2 where num = 1 
update #temp3 set name2= (select  Name from #temp2 where num = 2 ), rep2 = (select  rep from #temp2 where num = 2 )
select * from #temp3

if ((((select top 1 rep1 from #temp3) >= (select top 1 rep2 from #temp3)) and ((select top 1 name1 from #temp3)= '''+@exam+'''))
 OR	(((select top 1 rep1 from #temp3) = (select top 1 rep2 from #temp3)) and ((select top 1 name2 from #temp3)= '''+@exam+'''))
 OR    (((select top 1 name2 from #temp3) is null)and (select top 1 name1 from #temp3) = '''+@exam+''')   )
insert into kbs_result (name, m, k, result) values( '''+@exam+ltrim(str(@i))+''', '''+ltrim(str(@m))+''', '''+ltrim(str(@k))+''', ''0'' )
else
insert into kbs_result (name, m, k, result) values( '''+@exam+ltrim(str(@i))+''', '''+ltrim(str(@m))+''', '''+ltrim(str(@k))+''', ''1'' )
'
print(@sql)
exec (@sql) 