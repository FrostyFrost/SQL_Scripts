USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[Import]    Script Date: 01/04/2013 12:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[row_Import]
(@num as integer
,@path nvarchar (max)
,@name nvarchar (50)
,@stem as bit = 0)
AS
Declare @string nvarchar (max)
		,@string1 nvarchar (max)
		,@string2 nvarchar (max)
		,@string3 nvarchar (max)
		,@stemming as nvarchar (70)
BEGIN
	


set @num = 20
set @name = 'rAU'
set @path = 'D:\”чеба\Text categorization\¬ыборки\AU\rus\'	

--set @string = 'select * from openrowset (''DTSFlatFile'', ''Data source = D:\rTM1.txt '')'
--print(@string)
--exec (@string)



delete from dbo.Table_1 ; --¬ременна€, рабоча€ таблица



set @string1 = ' BULK INSERT table_1 from ''' + @path + @name +  ltrim(str(@num)) + '.txt'' with (codepage = 1251 , rowTERMINATOR = '' '')'
--print (@string1)
exec (@string1)
--Ђ  ї ` У Ф
UPDATE dbo.Table_1 SET ttr = LOWER( rtrim(ltrim(REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE(ttr, '''',''), '
', ''), '`', ''), 'У', ''), 'Ф', ''), ']', ''), '[', ''), '%', ''), 'Ђ', ''), 'ї', ''), '"', ''), ')', ''), '(', ''), ';', ''), ':', ''), '.', ''), ',', ''))))
delete from dbo.Table_1 where ttr like '' 
delete from dbo.Table_1 where ttr is null

set @string3 = 'drop table ' +@name +  ltrim(str(@num)) 
exec (@string3)

set @string3 = 'create table ' +@name +  ltrim(str(@num)) + '(
	[Word] [nvarchar](255) NULL,
	[Num] [int] NULL
) ON [PRIMARY]'
exec (@string3)

if @stem = 1 set @stemming = 'dbo.fnPorterAlgorithm_ru (dbo.fnPorterAlgorithm(ttr))' else set @stemming = 'ttr'
print (@num)
set @string2 =  'insert into '	+ @name +  ltrim(str(@num)) + ' (word, num) select '+@stemming +', ''1''  from table_1 '
exec (@string2)

	
	
END
