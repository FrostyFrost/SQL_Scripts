USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[UNP2]    Script Date: 01/12/2016 16:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter procedure [dbo].[UNP2](@top_r as nvarchar (4) ,@top_e as nvarchar (4), @name as nvarchar(2), @Vol as integer = 55)

as

declare 

@lang as nvarchar (6)
,@sqlstr as nvarchar (max)
,@i as integer
,@num_cl as integer = 7
,@A as integer
,@B as integer
,@C as integer
,@D as integer
,@At as integer
,@Aa as integer
,@Akw as integer
,@CD_cl as integer -- число документов в классе, в которых встречается  Xi
,@CD_gl as integer -- число документов всей выборки, где встречается   Xi
,@CHI as float
,@Ro as float
,@tf as float -- вес термина 
,@exam_word as nvarchar(max)


set @top_r = rtrim(@top_r)
set @top_e = rtrim(@top_e)

set @i = 1
set @lang = 'a' -- здесь д.б. 'a' для объединения русских и английских терминов 

exec('CREATE TABLE Ro_temp1 (num int, word varchar(100), count_docs int, Ro float)')
exec('insert into Ro_temp1 select row_number() over(ORDER BY Count(word)) num , word, count_docs, 0.000 as Ro
from mdt_'+@lang + @name + '
group by word, count_docs
')

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Ro_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table Ro_'+@lang+@name)

--exec('CREATE TABLE Chi2_'+@name +' (word varchar(100), chi2 float))')
set @i = 1
	while @i<(select COUNT(*) from Ro_temp1) + 1
		begin
		
			set @exam_word = (select word from Ro_temp1 where num = @i)
			set @CD_cl = (select count_docs from Ro_temp1 where word = @exam_word)
			exec ('select count_docs into Ro_temp2 FROM [TextCat].[dbo].[MDT_global_'+@lang+'] where word = '''+@exam_word +'''')
			set @CD_gl = (select count_docs FROM Ro_temp2 ) 
			IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Ro_TEMP2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
			drop table Ro_TEMP2
			
			set @A = @CD_cl
			set @B = @CD_gl-@CD_cl
			set @C = @Vol - @CD_cl
			set @D = @Vol*(@num_cl - 1 )- @CD_gl + @CD_cl 
			--Set @N = @num_cl* @Vol -- входной параметр
		
			set @CHI = ( @N* (square(@A*@D-@B*@C)*1.0000) / ((@A+@B)*(@C+@D)*(@A+@C)*(@B+@D))  )
			
			print @chi 
			print  @exam_word
			set @i = @i +1
			
			update Ro_temp1 set  ro = sqrt((@chi/@N))  where word = @exam_word  -- ФИ = (@chi/@N), РО = sqrt((@chi/@N))
			
		end
	--select * from 	Ro_temp1
	set @sql = ('select max(num) as max_num, word as word, SUM(count_docs) as sum_countdocs, MAX(ro) as max_ro into RO_'+@lang+@name+' from Ro_temp1  group by word  order by max(Ro )desc, word ')
	print (@sql)	
	exec(@sql)
	set @sql= ('select * from Ro_'+ @lang+@name +' order by max_Ro desc')
	exec (@sql)
