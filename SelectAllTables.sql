use textcat
declare @I as int = 1
,@rw as int
,@tbl as nvarchar(30)
SELECT name, id  FROM dbo.sysobjects WHERE  name like '%heterogenity_%'
set @rw = @@ROWCOUNT
while @i < @rw +1
begin
	set @tbl = (select z1.name  from (SELECT name, id , row_number() over(order by name) as row_cnt FROM dbo.sysobjects WHERE  name like '%heterogenity_%' )as z1 where row_cnt = @i)
	exec('insert into heterogenity select  '''+@tbl+''' , AVG(Q), AVG(Corr), AVG(z)a, AVG(kappa), 0   from ' + @tbl )
	set @I = @I + 1
end

--delete from heterogenity where name like '%uni2%'
select name, Avg_Q ,Avg_Corr  from heterogenity group by name, Avg_Q, Avg_Corr   order by naME desc