USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[MDT_create]    Script Date: 04/18/2013 16:10:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[MDT_create] (
@name as varchar (10)= 'TM' 
,@lang as char = 'r'
)
AS
	declare @counttables as int
		,@sqlstr1 as nvarchar (max) 
		,@sqlstr2 as nvarchar (max) 
		,@sqlstr3 as nvarchar (max) 
		,@sqlstr4 as nvarchar (max) 
		,@num as int
		,@i as int		
--		,@name as varchar (10) -- имя объекта rTM... 
		,@tablname as varchar (10) -- имя таблицы q_...
		,@fullname as varchar (50) -- полное имя
		,@language as varchar (10)
BEGIN

		
set @num = 1
set @i = 1
--set @name = 'TM' 
set @tablname = 'q_'  
set @fullname = @tablname + @lang+ rTrim(@name) +  ltrim(str(@num))
if @lang = 'r'
set @language = 'RUS'
else 
set @language = 'ENG'

exec('drop table Union_words_'+ @lang+ @name)
exec('drop table MDT_'+ @lang+ @name)

--- подсчет количества таблиц 
set @sqlstr1 = 'select Name from  sys.all_objects where name like ''' + rtrim(ltrim(@tablname + @lang+  rtrim(@name))) + '%'''
exec (@sqlstr1)
set @counttables = @@ROWCOUNT 
print (@counttables)

-----
--- Собираем основной запрос Union_words_Rus
--Первая строка
set @sqlstr2 = 'select ' + @fullname +'.Word as Word, '+@fullname + '.'+@lang +rTrim(@name) +  ltrim(str(@num))+' as ' +@lang+Rtrim(@name)+  ltrim(str(@num)) + ','
print (@sqlstr2)
while(@num <@counttables  )
	begin 
	set @num  = @num + 1
	set @sqlstr2 = @sqlstr2 + '''0''as '+@lang+Rtrim(@name)+  ltrim(str(@num))+', '
	--print (@sqlstr2)

end
set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ' into Union_words_'+ @lang+ @name + ' from '  +@fullname 
--print (@sqlstr2)
---Конец первой строки



set @num= 2
while (@num < @counttables +1 )
begin

set @i = 1
--set @name = 'rTM' 
set @tablname = 'q_' 
set @fullname = @tablname + @lang+ Rtrim(@name)+  ltrim(str(@num))

	set @sqlstr2 = @sqlstr2 + ' Union select ' + @fullname +'.Word, '
	while (@i < @counttables +1 )
		begin
			
			if @i = @num 
				set @sqlstr2 = @sqlstr2 +@lang+Rtrim(@name)+  ltrim(str(@num))+ ','
			else 	
				set @sqlstr2 = @sqlstr2 + '''0'','
			
		set @i = @i +1
		end
	set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ' from ' +@fullname 
	set @num = @num + 1		
	end

exec (@sqlstr2)	



------------ Матрица Документ-Термин

set @num = 1
set @i = 1
--set @name = 'rTM' 
set @tablname = 'q_'  
set @fullname = @tablname + @lang+ Rtrim(@name)+  ltrim(str(@num))
set @sqlstr4 = 'SUM('
set @sqlstr3 = 'SELECT Word, '

while (@i < @counttables +1)
	begin
		set @sqlstr3 = @sqlstr3 + 'SUM(' +@lang+Rtrim(@name)+  ltrim(str(@i))+ ') AS sum_' +@lang+Rtrim(@name)+  ltrim(str(@i))+ ', '
		set @sqlstr4 =  @sqlstr4  +@lang+Rtrim(@name)+  ltrim(str(@i))+ ' + '
		set @i = @i + 1
	end
	
set @sqlstr3 = @sqlstr3 + @sqlstr4 
set @sqlstr3 =  Left(@sqlstr3, len(@sqlstr3) -1 )  + ') as Count_words, COUNT(*) AS Count_docs into MDT_'+ @lang+ Rtrim(@name)+' from UNION_WORDS_'+ @lang+ Rtrim(@name) +' GROUP BY UNION_WORDS_'+ @lang+ Rtrim(@name)+' .Word;'
exec (@sqlstr3)

--print (@sqlstr3)
END
