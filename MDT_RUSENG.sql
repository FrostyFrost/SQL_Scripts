USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[MDT_create]    Script Date: 05/02/2012 16:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------- MDT_RUSENG_cycle

	declare @counttables as int
		,@name as varchar (10)
		,@lang as char 
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
		,@j as int
		,@num_cl as int
		


				
	set @num = 1
	set @i = 1
	set @name ='TM' 



		
set @j  = 1
set @num_cl = 41


While @j< @num_cl +1 
BEGIN
	set @i = 1
	set @name = rtrim((select Class from Classes where num = @j))
	print (@name)

	set @tablname = 'q_'  
	set @fullname = @tablname + @lang+ @name +  ltrim(str(@num))
	set @lang = 'r'
	set @language = 'RUS'

	exec('drop table Union_words_ruseng'+@Name   )
	exec('drop table MDT_ruseng' + @name)

	--- подсчет количества таблиц 
	--set @sqlstr1 = 'select Name from  sys.all_objects where name like ''' + rtrim(ltrim(@tablname + @lang+  @name)) + '%'''
	--exec (@sqlstr1)
	--set @counttables = @@ROWCOUNT
	---- print (@counttables)
	set @counttables = 65

	--- Собираем основной запрос Union_words_Rus
	--Первая строка
	set @sqlstr2 = 'select Word, sum_'+@lang +@name +  ltrim(str(@num))+', '
	--rSC
	while(@num <@counttables  ) -- -1, т.к. первый элемент уже записан
		begin 
		set @num  = @num + 1
		set @sqlstr2 = @sqlstr2 + 'sum_' + @lang+@name +  ltrim(str(@num))+', '
		--print (@sqlstr2)

	end

	set @num = 1
	set @lang = 'e' 
	while(@num <@counttables +1)
		begin 
		
		set @sqlstr2 = @sqlstr2 + '''0'' as sum_' + @lang+@name +  ltrim(str(@num))+', '
		set @num  = @num + 1
		--print (@sqlstr2)
	end

	set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs into Union_words_ruseng'+@Name   + ' from MDT_r'+@Name   
	print(@sqlstr2)

	-------UNION

	set @sqlstr2 = @sqlstr2 + ' union select Word, '
	set @num = 1
	while(@num <@counttables  +1)
		begin 
		
		set @sqlstr2 = @sqlstr2 + '''0'', '
		set @num  = @num + 1
		--print (@sqlstr2)
	end

	set @language = 'ENG'
	set @num  = 1
	while(@num <@counttables +1)

	begin 	
		set @sqlstr2 = @sqlstr2 + 'sum_' + @lang+@name +  ltrim(str(@num))+', '
		set @num  = @num + 1
		--print (@sqlstr2)
	end

	set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs  from MDT_e'  + @name
	exec (@sqlstr2)
	print (@sqlstr2)





	---------------- Матрица Документ-Термин


	set @lang = 'r'
	set @language = 'RUS'
	set @num = 1
	set @i = 1
	--set @name = 'SC' 
	set @tablname = 'q_'  
	set @fullname = @tablname + @lang+ @name +  ltrim(str(@num))
	set @sqlstr4 = 'SUM('
	set @sqlstr3 = 'SELECT Word, '

	while (@i < @counttables +1)
		begin
			set @sqlstr3 = @sqlstr3 + 'SUM(sum_' +@lang+@name +  ltrim(str(@i))+ ') AS sum_' +@lang+@name +  ltrim(str(@i))+ ', '
			set @sqlstr4 =  @sqlstr4  +'sum_'+@lang+@name +  ltrim(str(@i))+ ' + '
			set @i = @i + 1
		end
		
	set @lang = 'e'
	set @language = 'ENG'
	set @num = 1
	set @i = 1
	while (@i < @counttables +1)
		begin
			set @sqlstr3 = @sqlstr3 + 'SUM(sum_' +@lang+@name +  ltrim(str(@i))+ ') AS sum_' +@lang+@name +  ltrim(str(@i))+ ', '
			set @sqlstr4 =  @sqlstr4 +'sum_'+@lang+@name +  ltrim(str(@i))+ ' + '
			set @i = @i + 1
		end




	--set @sqlstr3 = @sqlstr3 + @sqlstr4 
	--set @sqlstr3 =  Left(@sqlstr3, len(@sqlstr3) -1 )  + ') as Count_words_2, COUNT(*) AS Count_docs_2, SUM(count_words) as fff, SUM(count_docs) as fdfd into MDT_ruseng from UNION_WORDS_rus_ GROUP BY UNION_WORDS_rus_.Word, count_words, count_docs;'
	--print (@sqlstr3)	
	--exec (@sqlstr3)

	set @sqlstr3 = @sqlstr3 
	set @sqlstr3 =  Left(@sqlstr3, len(@sqlstr3) -1 )  + ', SUM(count_words) as count_words,  SUM(count_docs) as count_docs, COUNT(*) AS Count_classes  into MDT_ruseng'+@name+' from Union_words_ruseng'+@Name   + ' GROUP BY Word;'
	print (@sqlstr3)	
	exec (@sqlstr3)
	print (@sqlstr3)

	set @j = @j + 1	
END
