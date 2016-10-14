 USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[MDT_create]    Script Date: 05/02/2012 16:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------ MDT_GLOBAL

alter procedure MDT_GLOBAL_CREATE (@fast_ as bit, @viborka_ as int)
AS 
	declare @counttables as int
		,@sum as int = 0
		,@name as nvarchar (10)
		,@lang as char 
		,@sqlstr1 as nvarchar (max) 
		,@sqlstr2 as nvarchar (max) 
		,@sqlstr3 as nvarchar (max) 
		,@sqlstr4 as nvarchar (max) 
		,@num as int
		,@i as int		
		,@j as int		
		,@tablname as varchar (10) -- имя таблицы q_...
		,@num_cl as int = 7
		,@fast as bit
		,@viborka as int
		
set @num = 1
set @i = 1
set @tablname = 'q_'  
set @lang = 'r'


----PARAMETERS
set @fast = @fast_ --  1 - быстрое, 0 - полное
set @viborka  = @viborka_


---------------





set @viborka = rtrim(ltrim(str(@viborka)))

print ('viborka = ' + str(@viborka))

----Заполнить таблицу Classes true\false - выбрать классы для выборки
if @viborka = 1 
		begin 
		---- Выборка 1
			update classes set cur = 1 where class = 'TM'
			update classes set cur = 1 where class = 'SC'
			update classes set cur = 1 where class = 'NM'
			update classes set cur = 1 where class = 'EO'
			update classes set cur = 1 where class = 'SA'
			update classes set cur = 1 where class = 'CO'
			update classes set cur = 1 where class = 'MC'
			update classes set cur = 0 where class = 'RO'
			update classes set cur = 0 where class = 'DB'
			update classes set cur = 0 where class = 'AU'
			update classes set cur = 0 where class = 'CD'
			update classes set cur = 0 where class = 'IS'
			update classes set cur = 0 where class = 'PR'
			update classes set cur = 0 where class = 'ST'
			update classes set cur = 0 where class = 'OS'
			
			
		end

		else if @viborka = 2 
		begin
		---- Выборка 2
			update classes set cur = 0 where class = 'TM'
			update classes set cur = 0 where class = 'SC'
			update classes set cur = 0 where class = 'NM'
			update classes set cur = 1 where class = 'EO'
			update classes set cur = 1 where class = 'SA'
			update classes set cur = 1 where class = 'CO'
			update classes set cur = 1 where class = 'MC'
			update classes set cur = 1 where class = 'RO'
			update classes set cur = 1 where class = 'DB'
			update classes set cur = 1 where class = 'AU'
			update classes set cur = 0 where class = 'CD'
			update classes set cur = 0 where class = 'IS'
			update classes set cur = 0 where class = 'PR'
			update classes set cur = 0 where class = 'ST'
			update classes set cur = 0 where class = 'OS'
		end

		else if @viborka = 3 
		begin
			------ Выборка 3
			update classes set cur = 1 where class = 'TM'
			update classes set cur = 1 where class = 'SC'
			update classes set cur = 1 where class = 'NM'
			update classes set cur = 1 where class = 'EO'
			update classes set cur = 0 where class = 'SA'
			update classes set cur = 0 where class = 'CO'
			update classes set cur = 0 where class = 'MC'
			update classes set cur = 1 where class = 'RO'
			update classes set cur = 1 where class = 'DB'
			update classes set cur = 1 where class = 'AU'
			update classes set cur = 0 where class = 'CD'
			update classes set cur = 0 where class = 'IS'
			update classes set cur = 0 where class = 'PR'
			update classes set cur = 0 where class = 'ST'
			update classes set cur = 0 where class = 'OS'			
		end
		
else if @viborka = 4 
		begin
			------ Выборка 4
			update classes set cur = 0 where class = 'TM'
			update classes set cur = 0 where class = 'SC'
			update classes set cur = 0 where class = 'NM'
			update classes set cur = 0 where class = 'EO'
			update classes set cur = 0 where class = 'SA'
			update classes set cur = 0 where class = 'CO'
			update classes set cur = 0 where class = 'MC'
			update classes set cur = 0 where class = 'RO'
			update classes set cur = 1 where class = 'DB'
			update classes set cur = 1 where class = 'AU'
			update classes set cur = 1 where class = 'CD'
			update classes set cur = 1 where class = 'IS'
			update classes set cur = 1 where class = 'PR'
			update classes set cur = 1 where class = 'ST'
			update classes set cur = 1 where class = 'OS'			
		end
else if @viborka = 5 
		begin
			------ Выборка 5
			update classes set cur = 1 where class = 'TM'
			update classes set cur = 1 where class = 'SC'
			update classes set cur = 0 where class = 'NM'
			update classes set cur = 0 where class = 'EO'
			update classes set cur = 0 where class = 'SA'
			update classes set cur = 0 where class = 'CO'
			update classes set cur = 0 where class = 'MC'
			update classes set cur = 0 where class = 'RO'
			update classes set cur = 0 where class = 'DB'
			update classes set cur = 0 where class = 'AU'
			update classes set cur = 1 where class = 'CD'
			update classes set cur = 1 where class = 'IS'
			update classes set cur = 1 where class = 'PR'
			update classes set cur = 1 where class = 'ST'
			update classes set cur = 1 where class = 'OS'			
		end
else if @viborka = 6 
		begin
			------ Выборка 6
			update classes set cur = 0 where class = 'TM'
			update classes set cur = 0 where class = 'SC'
			update classes set cur = 0 where class = 'NM'
			update classes set cur = 0 where class = 'EO'
			update classes set cur = 0 where class = 'SA'
			update classes set cur = 1 where class = 'CO'
			update classes set cur = 0 where class = 'MC'
			update classes set cur = 1 where class = 'RO'
			update classes set cur = 0 where class = 'DB'
			update classes set cur = 0 where class = 'AU'
			update classes set cur = 1 where class = 'CD'
			update classes set cur = 1 where class = 'IS'
			update classes set cur = 1 where class = 'PR'
			update classes set cur = 1 where class = 'ST'
			update classes set cur = 1 where class = 'OS'			
		end
else if @viborka = 7 
		begin
			------ Выборка 7
			update classes set cur = 1 where class = 'TM'
			update classes set cur = 0 where class = 'SC'
			update classes set cur = 1 where class = 'NM'
			update classes set cur = 0 where class = 'EO'
			update classes set cur = 1 where class = 'SA'
			update classes set cur = 0 where class = 'CO'
			update classes set cur = 1 where class = 'MC'
			update classes set cur = 0 where class = 'RO'
			update classes set cur = 1 where class = 'DB'
			update classes set cur = 0 where class = 'AU'
			update classes set cur = 1 where class = 'CD'
			update classes set cur = 0 where class = 'IS'
			update classes set cur = 1 where class = 'PR'
			update classes set cur = 0 where class = 'ST'
			update classes set cur = 0 where class = 'OS'			
		end						
exec ('drop table MDT_current')
exec ('select row_number() over(ORDER BY num) num, num as cl_num into MDT_current from classes where cur = 1')

IF @fast = 1
	begin 
		exec('	drop table MDT_global_r
				drop table MDT_global_e
				drop table MDT_global_ruseng')
				
		exec('SELECT * into [TextCat].[dbo].[MDT_GLOBAL_e]
			  FROM [TextCat].[dbo].[MDT_GLOBAL_e'+@viborka+'] 
			  SELECT * into [TextCat].[dbo].[MDT_GLOBAL_r]
			  FROM [TextCat].[dbo].[MDT_GLOBAL_r'+@viborka+']
			  SELECT * into [TextCat].[dbo].[MDT_GLOBAL_ruseng]
			  FROM [TextCat].[dbo].[MDT_GLOBAL_ruseng'+@viborka+']')
	end
	
	
	
	
	
ELSE BEGIN
-----------------vvvvv			ПОЛНОЕ СОЗДАНИЕ МДТ

exec('drop table Union_words_global')
exec('drop table MDT_global_ruseng')

set @counttables = 67 -- Количество таблиц



----- Собираем основной запрос Union_words_global

----Первая строка
set @j = 1

set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
set @sqlstr2 = 'select Word, sum_'+@lang +rtrim(@name )+  ltrim(str(@num))+', '


set @lang = 'r'
while(@num <@counttables  )
			begin 
				set @num  = @num + 1
				set @sqlstr2 = @sqlstr2 + 'sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
			end



set @num = 1
set @lang = 'e' 
while(@num <@counttables +1)
	begin 	
		set @sqlstr2 = @sqlstr2 + 'sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
		set @num  = @num + 1
	end


-- Цикл по классам MDT 
set @j = 2
While @j < @num_cl +  1
	begin
		---- Rus
		set @num = 1
		set @lang = 'r' 
		set @name =  (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
		while(@num <@counttables +1 )
			begin 	
				set @sqlstr2 = @sqlstr2 + '''0'' as sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
				set @num  = @num + 1
			end
		---- Eng	
		set @num = 1
		set @lang = 'e' 
		set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
		while(@num <@counttables +1)
			begin 	
				set @sqlstr2 = @sqlstr2 + '''0'' as sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
				set @num  = @num + 1
			end
		
		set @j = @j +1
	end


---------------------<


-- Возвращаемся к первому классу



set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = 1)) -- Возвращаемся к первому классу
set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs into Union_words_GLOBAL from MDT_ruseng'+rtrim(@Name  )+ '_tfidf'
--print ('sqlstr2 '  + @sqlstr2)
--insert  into Table_2 (sss) values (@sqlstr2)
-------------------< конец первой строки

set @j = 2
While @j < @num_cl +1
	begin
		--------->UNION TM
		set @sqlstr2 = @sqlstr2 + ' union select Word, '
		set @num = 1
		set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
		while(@num <(@counttables) * 2* (@j-1)  +1)
			begin 
				set @sqlstr2 = @sqlstr2 + '''0'', '
				set @num  = @num + 1
			end
						

		set @num  = 1
		set @lang = 'r' 
		while(@num <@counttables  +1)
		begin 	
			set @sqlstr2 = @sqlstr2 + 'sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
			set @num  = @num + 1
		end


		set @num  = 1
		set @lang = 'e' 
		while(@num <@counttables +1 )
		begin 	
			set @sqlstr2 = @sqlstr2 + 'sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
			set @num  = @num + 1
		end

		set @num = 1
		while(@num <(@counttables )*2*((@num_cl -@j)) +1 )---*2 lang *3classes
			begin 
				set @sqlstr2 = @sqlstr2 + '''0'', '
				set @num  = @num + 1
			end
		set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs  from MDT_ruseng'  + rtrim(@name )+ '_tfidf'
		print(@sqlstr2)
		-------------<	
		set @j = @j +1
	end


---------------------->Last string of union_global
----set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs  from MDT_ruseng'  + @name + '_tfidf'
print(@sqlstr2)
--insert  into Table_2 (sss) values (@sqlstr2)

exec (@sqlstr2)
--print ('sdf')
-------------<




------------------------------------------------- Матрица Документ-Термин



--set @tablname = 'q_'  
--set @fullname = @tablname + @lang+ @name +  ltrim(str(@num))
set @sqlstr4 = 'SUM('
set @sqlstr3 = 'SELECT Word, '
set @num = 1
set @j = 1
While @j < @num_cl +1
	begin
		set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
		set @lang = 'r'
		set @i = 1
		while (@i < @counttables +1 )
			begin
				set @sqlstr3 = @sqlstr3 + 'SUM(sum_' +@lang+rtrim(@name ) +  ltrim(str(@i))+ ') AS sum_' +@lang+rtrim(@name ) +  ltrim(str(@i))+ ', '
				set @sqlstr4 =  @sqlstr4  +'sum_'+@lang+rtrim(@name ) +  ltrim(str(@i))+ ' + '
				set @i = @i + 1
			end
			
		set @i = 1
		set @lang = 'e'
		while (@i < @counttables +1 )
			begin
				set @sqlstr3 = @sqlstr3 + 'SUM(sum_' +@lang+rtrim(@name ) +  ltrim(str(@i))+ ') AS sum_' +@lang+rtrim(@name ) +  ltrim(str(@i))+ ', '
				set @sqlstr4 =  @sqlstr4  +'sum_'+@lang+rtrim(@name ) +  ltrim(str(@i))+ ' + '
				set @i = @i + 1
			end	
		set @j = @j +1
	end		


----------------<
		
	
	
print (@sqlstr4)
print (@sqlstr3)
set @sqlstr3 = @sqlstr3 + @sqlstr4 
set @sqlstr3 =  Left(@sqlstr3, len(@sqlstr3) -1 )  + ') as Count_words_tfidf, sum(count_words) as count_words,  SUM(count_docs) as count_docs, COUNT(*) AS Count_classes  into MDT_GLOBAL_ruseng from Union_words_global GROUP BY Union_words_global.Word ;'
--print (@sqlstr3)	
print (@sqlstr3)
exec (@sqlstr3)

	
	
	
	
	-----------------------------------------------separately

set @lang = 'r'	
		exec('drop table Union_words_global_'+@lang)
		exec('drop table MDT_global_'+@lang)

		----- Собираем основной запрос Union_words_global

		----Первая строка
		set @j = 1

		set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
		set @sqlstr2 = 'select Word, sum_'+@lang +rtrim(@name )+  ltrim(str(@num))+', '


		while(@num <@counttables  )
					begin 
						set @num  = @num + 1
						set @sqlstr2 = @sqlstr2 + 'sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
					end





		-- Цикл по классам MDT 
		set @j = 2
		While @j < @num_cl +  1
			begin
				---- Rus
				set @num = 1
				set @name =  (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
				while(@num <@counttables +1 )
					begin 	
						set @sqlstr2 = @sqlstr2 + '''0'' as sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
						set @num  = @num + 1
					end		
				set @j = @j +1
			end

		-- Возвращаемся к первому классу

		set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = 1)) -- Возвращаемся к первому классу
		set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs into Union_words_GLOBAL_'+@lang+' from MDT_'+@lang+rtrim(@Name  )+ '_tfidf'
		--print ('sqlstr2 '  + @sqlstr2)
		--insert  into Table_2 (sss) values (@sqlstr2)
		-------------------< конец первой строки



		set @j = 2
		While @j < @num_cl +1
			begin
				--------->UNION TM
				set @sqlstr2 = @sqlstr2 + ' union select Word, '
				set @num = 1
				set @name = (select Class from Classes where num =(select cl_num from MDT_current where num = @j))
				while(@num <(@counttables) *  (@j-1)  +1)
					begin 
						set @sqlstr2 = @sqlstr2 + '''0'', '
						set @num  = @num + 1
					end
								

				set @num  = 1
				while(@num <@counttables  +1)
				begin 	
					set @sqlstr2 = @sqlstr2 + 'sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
					set @num  = @num + 1
				end


				set @num = 1
				while(@num <(@counttables )*((@num_cl -@j)) +1 )---*2 lang *3classes
					begin 
						set @sqlstr2 = @sqlstr2 + '''0'', '
						set @num  = @num + 1
					end
				set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs  from MDT_'+@lang  + rtrim(@name )+ '_tfidf'
				print(@sqlstr2)
				-------------<	
				set @j = @j +1
			end
		---------------Union NM
			

		print(@sqlstr2)
		--insert  into Table_2 (sss) values (@sqlstr2)

		exec (@sqlstr2)
		--print ('sdf')
		-------------<




		------------------------------------------------- Матрица Документ-Термин



		--set @language = 'RUS'

		--set @tablname = 'q_'  
		--set @fullname = @tablname + @lang+ @name +  ltrim(str(@num))
		set @sqlstr4 = 'SUM('
		set @sqlstr3 = 'SELECT Word, '
		set @num = 1
		set @j = 1
		While @j < @num_cl +1
			begin
				set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
				set @i = 1
				while (@i < @counttables +1 )
					begin
						set @sqlstr3 = @sqlstr3 + 'SUM(sum_' +@lang+rtrim(@name ) +  ltrim(str(@i))+ ') AS sum_' +@lang+rtrim(@name ) +  ltrim(str(@i))+ ', '
						set @sqlstr4 =  @sqlstr4  +'sum_'+@lang+rtrim(@name ) +  ltrim(str(@i))+ ' + '
						set @i = @i + 1
					end
				set @j = @j +1
			end		


			
		print (@sqlstr4)
		print (@sqlstr3)
		set @sqlstr3 = @sqlstr3 + @sqlstr4 
		set @sqlstr3 =  Left(@sqlstr3, len(@sqlstr3) -1 )  + ') as Count_words_tfidf, sum(count_words) as count_words,  SUM(count_docs) as count_docs, COUNT(*) AS Count_classes  into MDT_GLOBAL_'+@lang +' from Union_words_global_'+@lang +' GROUP BY Union_words_global_'+@lang+'.Word ;'
		--print (@sqlstr3)	
		print (@sqlstr3)
		exec (@sqlstr3)

			

set @lang = 'e'
		exec('drop table Union_words_global_'+@lang)
		exec('drop table MDT_global_'+@lang)

		----- Собираем основной запрос Union_words_global

		----Первая строка
		set @j = 1

		set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
		set @sqlstr2 = 'select Word, sum_'+@lang +rtrim(@name )+  ltrim(str(@num))+', '


		while(@num <@counttables  )
					begin 
						set @num  = @num + 1
						set @sqlstr2 = @sqlstr2 + 'sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
					end





		-- Цикл по классам MDT 
		set @j = 2
		While @j < @num_cl +  1
			begin
				---- Rus
				set @num = 1
				set @name =  (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
				while(@num <@counttables +1 )
					begin 	
						set @sqlstr2 = @sqlstr2 + '''0'' as sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
						set @num  = @num + 1
					end		
				set @j = @j +1
			end

		-- Возвращаемся к первому классу

		set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = 1)) -- Возвращаемся к первому классу
		set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs into Union_words_GLOBAL_'+@lang+' from MDT_'+@lang+rtrim(@Name  )+ '_tfidf'
		--print ('sqlstr2 '  + @sqlstr2)
		--insert  into Table_2 (sss) values (@sqlstr2)
		-------------------< конец первой строки



		set @j = 2
		While @j < @num_cl +1
			begin
				--------->UNION TM
				set @sqlstr2 = @sqlstr2 + ' union select Word, '
				set @num = 1
				set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
				while(@num <(@counttables) * (@j-1)  +1)
					begin 
						set @sqlstr2 = @sqlstr2 + '''0'', '
						set @num  = @num + 1
					end
								

				set @num  = 1
				while(@num <@counttables  +1)
				begin 	
					set @sqlstr2 = @sqlstr2 + 'sum_' + @lang+rtrim(@name ) +  ltrim(str(@num))+', '
					set @num  = @num + 1
				end


				set @num = 1
				while(@num <(@counttables )*((@num_cl -@j)) +1 )---*2 lang *3classes
					begin 
						set @sqlstr2 = @sqlstr2 + '''0'', '
						set @num  = @num + 1
					end
				set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs  from MDT_'+@lang  + rtrim(@name )+ '_tfidf'
				print(@sqlstr2)
				-------------<	
				set @j = @j +1
			end
		---------------			

		print(@sqlstr2)
		--insert  into Table_2 (sss) values (@sqlstr2)

		exec (@sqlstr2)
		--print ('sdf')
		-------------<




		------------------------------------------------- Матрица Документ-Термин



		--set @language = 'RUS'

		--set @tablname = 'q_'  
		--set @fullname = @tablname + @lang+ @name +  ltrim(str(@num))
		set @sqlstr4 = 'SUM('
		set @sqlstr3 = 'SELECT Word, '
		set @num = 1
		set @j = 1
		While @j < @num_cl +1
			begin 
				set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = @j))
				set @i = 1
				while (@i < @counttables +1 )
					begin
						set @sqlstr3 = @sqlstr3 + 'SUM(sum_' +@lang+rtrim(@name ) +  ltrim(str(@i))+ ') AS sum_' +@lang+rtrim(@name ) +  ltrim(str(@i))+ ', '
						set @sqlstr4 =  @sqlstr4  +'sum_'+@lang+rtrim(@name ) +  ltrim(str(@i))+ ' + '
						set @i = @i + 1
					end
				set @j = @j +1
			end		


			
		print (@sqlstr4)
		print (@sqlstr3)
		set @sqlstr3 = @sqlstr3 + @sqlstr4 
		set @sqlstr3 =  Left(@sqlstr3, len(@sqlstr3) -1 )  + ') as Count_words_tfidf, sum(count_words) as count_words,  SUM(count_docs) as count_docs, COUNT(*) AS Count_classes  into MDT_GLOBAL_'+@lang +' from Union_words_global_'+@lang +' GROUP BY Union_words_global_'+@lang+'.Word ;'
		--print (@sqlstr3)	
		print (@sqlstr3)
		exec (@sqlstr3)

	END
	
	print ('Viborka ' + str(@viborka))
	return