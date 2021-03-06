/****** Сценарий для команды SelectTopNRows среды SSMS  ******/
use TextCat
go

Alter procedure KBS_TblRes 


AS


BEGIN
declare @j as integer
,@row_count as integer
,@string as nvarchar(5)
,@cl as nvarchar (2)
,@num as integer


--delete from kbs_result
SELECT *  FROM [TextCat].[dbo].[kbs_result] order by result desc

	exec('update tblRes_KBS set TM=0, SC=0, NM=0, EO=0, SA=0, CO=0, MC=0, RO=0, DB=0, AU=0, CD=0, [IS]=0, PR=0, ST=0, OS=0')
select name, result, row_number() over(ORDER BY name desc) num from kbs_result

set @j = 1
while @j < (select COUNT(*)+ 1 from kbs_result) 
	begin
		set @string = (select z1.name from (select name, result, row_number() over(ORDER BY name ) num from kbs_result) as z1 where z1.num = @j)
		
		if LEN(@string) = 4 
		set @cl = substring(@string,1,4)  --для русского-англ - 2,4; для смешанной 1,4
		else 
		set @cl = substring(@string,2,4)
		
		set @num = right(@string,2)
		
		if ((select z1.result  from (select name, result, row_number() over(ORDER BY name ) num from kbs_result) as z1 where z1.num = @j)) = 0
			exec('update tblRes_KBS set '+@cl+'= '''+@cl+''' where num = ' +@num)
		else 
			exec('update tblRes_KBS set '+@cl+'= ''ER'' where num = ' +@num)
			
		set @j = @j+1
		print  @num
	end
select * from tblRes_KBS  
exec checking   @tbl = 'tblRes_KBS'
  
END