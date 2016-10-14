
alter  procedure [dbo].[Spearman_corr] (@N as int ,@pr1 as nvarchar(4) ,@lang1 as nvarchar(6),@cl1 as nvarchar(2)  ,@pr2 as nvarchar(4) ,@lang2 as nvarchar(6),@cl2 as nvarchar(2) )  
AS
BEGIN
declare @Ti as float =0.0000
,@Tk as float = 0.0000

,@NN as int = 0
,@NNN as float = 0
,@mi as int = 0
,@mk as int = 0
,@ni as int = 0
,@nk as int = 0
,@xi as float = 0.0000
,@xk as float = 0.0000
,@Xik as float = 0.0000
,@Rik as float = 0.0000

,@prof1 as nvarchar(15) -- MI_I_ePR6
,@i1 as nvarchar(1) = ''	
,@prof2 as nvarchar(15) -- MI_I_ePR6
,@i2 as nvarchar(1) = ''			--6

----for debug:
--,@pr1 as nvarchar(4)	--MI_I
--,@lang1 as nvarchar(6)  --e
--,@cl1 as nvarchar(2)	--PR
--,@pr2 as nvarchar(4)	--MI_I
--,@lang2 as nvarchar(6)  --e
--,@cl2 as nvarchar(2)	--PR
--,@N as int = 200

,@sqlstr2 as nvarchar(max)
,@sqlstr1 as nvarchar(max)

----for debug:
--set @pr1 = 'S1'
--set @lang1 = 'r'
--set @cl1 = 'tm'
--set @i1 = 1
--select @Prof1
--set @pr2= 'RO'
--set @lang2 = 'r'
--set @cl2 = 'tm'
--set @i2 = 1

set @prof1 = rtrim(@pr1) + '_'+ rtrim(@lang1)+ RTRIM (@cl1) + ltrim(@i1)
set @prof2 = rtrim(@pr2) + '_'+ rtrim(@lang2)+ RTRIM (@cl2) + ltrim(@i2)
--select @Prof2


IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_spear1]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table temp_spear1

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_spear2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table temp_spear2	

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_spear3]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table temp_spear3




set @sqlstr1 =('select top ' +STR(@n) +' word as ''word1'', '+ @prof1 +'.max_'+ @pr1 +' as ''max_pr1'' into temp_spear1 from '+ @prof1 +' order by max_pr1 desc')
exec(@sqlstr1)

set @sqlstr2 =('select top ' +STR(@n) +' word as ''word2'', '+ @prof2 +'.max_'+ @pr2 +' as ''max_pr2'' into temp_spear2 from '+ @prof2 +' order by max_pr2 desc')
exec(@sqlstr2)


--1,2 Full Join + num  --into temp_spear3
Select   word1, word2, row_number() over(ORDER BY max_pr1  desc) num1, case when max_pr1 IS NULL then -1 else max_pr1 end as 'max_pr1' , row_number() over(ORDER BY max_pr2  desc) num2, case when max_pr2 IS NULL then -1 else max_pr2 end as 'max_pr2'  into temp_spear3 from
	 temp_spear1 full outer join temp_spear2 on temp_spear1.word1 = temp_spear2.word2 order by max_pr1 desc


set @NN = @@ROWCOUNT 


-- Get @Xik
declare cur_Xik Cursor for
 
Select  rank1, rank2 from temp_spear3 left join (select AVG(num1*1.0) as 'rank1', case when max_pr1 IS NULL then -1 else max_pr1 end as 'max_pr1' from (Select   word1, word2, row_number() over(ORDER BY max_pr1  desc) num1, max_pr1, row_number() over(ORDER BY max_pr2  desc) num2, max_pr2  from
	 temp_spear1 full outer join temp_spear2 on temp_spear1.word1 = temp_spear2.word2 ) as z1 group by max_pr1) as y1 on temp_spear3.max_pr1 = y1.max_pr1 left join (select AVG(num2*1.0) as 'rank2', case when max_pr2 IS NULL then -1 else max_pr2 end as 'max_pr2' from (Select   word1, word2, row_number() over(ORDER BY max_pr1  desc) num1, max_pr1, row_number() over(ORDER BY max_pr2  desc) num2, max_pr2  from
	 temp_spear1 full outer join temp_spear2 on temp_spear1.word1 = temp_spear2.word2 ) as z1 group by max_pr2) as y2 on temp_spear3.max_pr2 = y2.max_pr2 

Open cur_Xik

Fetch next from cur_Xik into  @xi, @xk
while @@FETCH_STATUS = 0
begin 
	set @Xik = @Xik + power(@xi - @xk ,2)
	--select @xik as '@xik'
	fetch next from  cur_Xik into @xi, @xk
end
close cur_Xik
Deallocate cur_Xik


--------- Compute Ti
---- Get @mi - number of groups
--select max_pr1 as 'ccc' from temp_spear  group by max_pr1 
--set @mi = (select @@ROWCOUNT )

-- Cursor for @ni, @Ti
declare cur_Ti Cursor for 
select count (num1) from (Select   word1, word2, row_number() over(ORDER BY max_pr1  desc) num1, max_pr1, row_number() over(ORDER BY max_pr2  desc) num2, max_pr2  from
	 temp_spear1 full outer join temp_spear2 on temp_spear1.word1 = temp_spear2.word2 ) as z1 group by max_pr1

Open cur_Ti
Fetch next from cur_Ti into @ni
while @@FETCH_STATUS = 0
begin
	set @Ti = @Ti + (power(@ni,3) - @ni)
 	--select @Ti as 'Ti', @ni as 'ni'
	
	FETCH NEXT FROM cur_Ti into @ni
end
CLOSE cur_Ti;
DEALLOCATE cur_Ti;
set @Ti = @Ti/12


----Compute Tk
-- Get @mk - number of groups
--select max_pr2,  count(max_pr2) as 'ccc' from temp_spear group by max_pr1 order by max_pr2 desc
--set @mk = (select @@ROWCOUNT )

-- Cursor for @nk, @Tk
declare cur_Tk Cursor for 

select  count (num2) from (Select   word1, word2, row_number() over(ORDER BY max_pr1  desc) num1, max_pr1, row_number() over(ORDER BY max_pr2  desc) num2, max_pr2  from
	 temp_spear1 full outer join temp_spear2 on temp_spear1.word1 = temp_spear2.word2 ) as z1 group by max_pr2


open cur_Tk

Fetch next from cur_Tk into @nk
while @@FETCH_STATUS = 0
begin

	set @Tk = @Tk + (power(@nk, 3) - @nk)
 	--select @Tk as 'TK', @nk as 'NI'
	
	FETCH NEXT FROM cur_Tk into @nk
end
CLOSE cur_Tk;
DEALLOCATE cur_Tk;
set @Tk = @Tk/12


set @NN = (power(@NN,3) - @NN)/6
--select @Ti as 'Ti', @Tk as 'Tk', @NN as 'NN', @Xik as 'Xik'

set @Rik = ((@NN - @Xik - @Ti - @Tk))/(sqrt((@NN- 2*@Ti)*(@NN - 2*@Tk))) * 1000 --Домножаем, чтобы результат был INT,  при получении нужно разделить на 1000

--Select @Rik as 'Rik', (@NN - @Xik - @Ti - @Tk) as 'ch', sqrt((@NN - 2*@Ti)*(@NN - 2*@Tk)) as 'zn' 
return @rik
END