USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[partition_import]    Script Date: 08/09/2013 13:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[partition_import]
(@num as integer					 -- 56
,@name nvarchar (50)				 -- AU
,@lang as nvarchar(6))				 -- r
as

declare @word varchar(MAX), 
        @string1 varchar(MAX), 
        @i int,
        @language as nvarchar(3),
        @path as nvarchar(max),
        @command as nvarchar(max)

if @lang = 'r' set @language = 'rus' else set @language = 'eng'
set @name = ltrim(RTRIM(@name))
set @path = 'D:\Учеба\Text categorization\Выборки\'+@name+'\'+@language+'\'+@lang+@name+rtrim(ltrim(str(@num)))+'.txt'


delete from table_122

exec('BULK INSERT table_122
   FROM '''+@path+'''
   with (codepage = 1251, fieldterminator = ''\n'', rowterminator = '''', keepnulls)
   
   select * from table_122	')
   




drop table table_123


--set @i = 1
--while @i < 1000
--	begin	
--		insert into table_123 (num) select @i
--		set @i = @i + 1
--	end
select * into table_123 from table_1000


--abstract
UPDATE dbo.Table_122 SET abstract = LOWER( rtrim(ltrim(REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE(abstract, '''',''), '
', ''), '`', ''), '“', ''), '”', ''), ']', ''), '[', ''), '%', ''), '«', ''), '»', ''), '"', ''), ')', ''), '(', ''), ';', ''), ':', ''), '.', ''), ',', ''))))
set @string1 = (select abstract from table_122)
set @i = 0
while  charindex(' ', (@string1))> 0
	begin
		
		set @word = (left(@string1, charindex(' ', (@string1))-1))
		if (select COUNT(*) from RusStop where Поле1 = @word) = 0 
		begin
			set @i = @i +1
			update  table_123  set abstract = dbo.fnPorterAlgorithm_ru(dbo.fnPorterAlgorithm(@word )) where num = @i
		end
		set @string1 = right(@string1, LEN(@string1)-LEN(@word)-1)	

	end
update  table_123  set abstract = dbo.fnPorterAlgorithm_ru(dbo.fnPorterAlgorithm(@string1)) where num = @i +1	
update  table_123  set abstract = null where abstract = ' ' or abstract = ''
	
	
	
	
--title
UPDATE dbo.Table_122 SET title = LOWER( rtrim(ltrim(REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE(title, '''',''), '
', ''), '`', ''), '“', ''), '”', ''), ']', ''), '[', ''), '%', ''), '«', ''), '»', ''), '"', ''), ')', ''), '(', ''), ';', ''), ':', ''), '.', ''), ',', ''))))
set @string1 = (select title from table_122)
set @i = 0
while  charindex(' ', (@string1))> 0
	begin
		
		set @word = left(@string1, charindex(' ', (@string1))-1)
		print @word
		if (select COUNT(*) from RusStop where Поле1 = @word) = 0 
		begin
			set @i = @i +1
			update  table_123  set title =dbo.fnPorterAlgorithm_ru(dbo.fnPorterAlgorithm(@word )) where num = @i
		end
		set @string1 = right(@string1, LEN(@string1)-LEN(@word)-1)
	end
update  table_123  set title = dbo.fnPorterAlgorithm_ru(dbo.fnPorterAlgorithm(@string1)) where num = @i +1	
update  table_123  set title = null where title = ' ' or title = ''
	
	

	
--keywords
UPDATE dbo.Table_122 SET keywords = LOWER( rtrim(ltrim(REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE(keywords, '''',''), '
', ''), '`', ''), '“', ''), '”', ''), ']', ''), '[', ''), '%', ''), '«', ''), '»', ''), '"', ''), ')', ''), '(', ''), ';', ''), ':', ''), '.', ''), ',', ''))))
set @string1 = (select keywords from table_122)
set @i = 0
while  charindex(' ', (@string1))> 0
	begin
		set @word = left(@string1, charindex(' ', (@string1))-1)
		print @word
		if (select COUNT(*) from RusStop where Поле1 = @word) = 0 
		begin
			set @i = @i +1
			update  table_123  set keywords = dbo.fnPorterAlgorithm_ru(dbo.fnPorterAlgorithm(@word )) where num = @i
		end
		set @string1 = right(@string1, LEN(@string1)-LEN(@word)-1)
	end
update  table_123  set keywords = dbo.fnPorterAlgorithm_ru(dbo.fnPorterAlgorithm(@string1)) where num = @i +1	
update  table_123  set keywords = null where keywords = ' ' or keywords = ''



delete from table_123 where title is null and keywords is null and abstract is null 
select * from table_123 order by num
if @@ROWCOUNT = 0		 
	begin
		insert into table_1 values( @lang+@name+rtrim(ltrim(str(@num))))	
	end

delete from Table_124 

----вставляем слова
insert into Table_124 (word) 
	select title from Table_123 where title is not null
	union select keywords from Table_123 where keywords is not null
	union select abstract from Table_123 where abstract is not null

----вставляем TF
update  table_124 set title_count = (SELECT COUNT(title) FROM dbo.Table_123 where Table_123.title = Table_124.word  GROUP BY title )
update  table_124 set keywords_count = (SELECT COUNT(keywords) FROM dbo.Table_123 where Table_123.keywords = Table_124.word  GROUP BY keywords )
update  table_124 set abstract_count = (SELECT COUNT(abstract) FROM dbo.Table_123 where Table_123.abstract = Table_124.word  GROUP BY abstract )

----убираем NULL
update  table_124 set title_count = 0 where title_count  is null
update  table_124 set keywords_count = 0 where keywords_count  is null
update  table_124 set abstract_count = 0 where abstract_count  is null

----вставляем веса common
update  table_124 set common_count = abstract_count + title_count + keywords_count 


---- проверка существования таблицы статьи и ее удаление
set @command = 'select name from [TextCat].[sys].[all_objects] where name = ''q_'+@lang+@name +ltrim(str(@num))+ ''''
exec (@command )
if @@ROWCOUNT <> 0 
begin 
		set @command = 'drop table q_' +@lang+@name +ltrim(str(@num))
		print @command
		exec (@command)
end


----запись в таблицу 
set @command =('select word, common_count as '+@lang+@name +ltrim(str(@num))+', title_count as '+@lang+@name +ltrim(str(@num))+'_t, keywords_count as '+@lang+@name +ltrim(str(@num))+'_k ,  abstract_count as '+@lang+@name +ltrim(str(@num))+'_a into q_'+@lang+@name +ltrim(str(@num))+' from Table_124
select * from q_'+@lang+@name +ltrim(str(@num)))

exec (@command)