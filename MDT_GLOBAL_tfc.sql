USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[MDT_create]    Script Date: 05/02/2012 16:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



------------------------------------------ MDT_GLOBAL


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
--		,@fullname as varchar (50) -- полное имя
		,@num_cl as int = 7

		
set @num = 1
set @i = 1
set @tablname = 'q_'  
--set @fullname = @tablname + @lang+ @name +  ltrim(str(@num))
set @lang = 'r'





exec('drop table Union_words_global_tfc')
exec('drop table MDT_global_ruseng_tfc')

--Заполнить таблицу Classes true\false - выбрать классы для выборки

-- Выборка 1
--update classes set cur = 1 where class = 'TM'
--update classes set cur = 1 where class = 'SC'
--update classes set cur = 1 where class = 'NM'
--update classes set cur = 1 where class = 'EO'
--update classes set cur = 1 where class = 'SA'
--update classes set cur = 1 where class = 'CO'
--update classes set cur = 1 where class = 'MC'
--update classes set cur = 0 where class = 'RO'
--update classes set cur = 0 where class = 'DB'
--update classes set cur = 0 where class = 'AU'

------ Выборка 2
--update classes set cur = 0 where class = 'TM'
--update classes set cur = 0 where class = 'SC'
--update classes set cur = 0 where class = 'NM'
--update classes set cur = 1 where class = 'EO'
--update classes set cur = 1 where class = 'SA'
--update classes set cur = 1 where class = 'CO'
--update classes set cur = 1 where class = 'MC'
--update classes set cur = 1 where class = 'RO'
--update classes set cur = 1 where class = 'DB'
--update classes set cur = 1 where class = 'AU'

---- Выборка 3
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


--exec('insert into MDT_current (num, cl_num) values (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7)')
--exec ('create table MDT_current (num int, cl_num int)')
exec ('drop table MDT_current')
exec ('select row_number() over(ORDER BY num) num, num as cl_num into MDT_current from classes where cur = 1')

-----

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

----------

-- Возвращаемся к первому классу



set @name = (select Class from Classes where num = (select cl_num from MDT_current where num = 1)) -- Возвращаемся к первому классу
set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs into Union_words_GLOBAL_tfc from MDT_ruseng'+rtrim(@Name  )+ '_tfc'
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
		set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs  from MDT_ruseng'  + rtrim(@name )+ '_tfc'
		print(@sqlstr2)
		-------------<	
		set @j = @j +1
	end

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
set @sqlstr3 =  Left(@sqlstr3, len(@sqlstr3) -1 )  + ') as Count_words_tfc, sum(count_words) as count_words,  SUM(count_docs) as count_docs, COUNT(*) AS Count_classes  into MDT_GLOBAL_ruseng_tfc from Union_words_global_tfc GROUP BY Union_words_global_tfc.Word ;'
--print (@sqlstr3)	
print (@sqlstr3)
exec (@sqlstr3)

	
	
	
	
	-----------------------------------------------separately

set @lang = 'r'	
		exec('drop table Union_words_global_'+@lang+'_tfc')
		exec('drop table MDT_global_'+@lang+'_tfc')

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
		set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs into Union_words_GLOBAL_'+@lang+'_tfc from MDT_'+@lang+rtrim(@Name  )+ '_tfc'
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
				set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs  from MDT_'+@lang  + rtrim(@name )+ '_tfc'
				print(@sqlstr2)
				-------------<	
				set @j = @j +1
			end
		---------------Union NM
			

		print(@sqlstr2)

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
		set @sqlstr3 =  Left(@sqlstr3, len(@sqlstr3) -1 )  + ') as Count_words_tfc, sum(count_words) as count_words,  SUM(count_docs) as count_docs, COUNT(*) AS Count_classes  into MDT_GLOBAL_'+@lang +'_tfc from Union_words_global_'+@lang +'_tfc GROUP BY Union_words_global_'+@lang+'_tfc.Word ;'
		--print (@sqlstr3)	
		print (@sqlstr3)
		exec (@sqlstr3)

			

set @lang = 'e'
		exec('drop table Union_words_global_'+@lang+'_tfc')
		exec('drop table MDT_global_'+@lang+'_tfc')

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
		set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs into Union_words_GLOBAL_'+@lang+'_tfc from MDT_'+@lang+rtrim(@Name  )+ '_tfc'
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
				set @sqlstr2 =  Left(@sqlstr2, len(@sqlstr2) -1 )  + ', count_words, count_docs  from MDT_'+@lang  + rtrim(@name )+ '_tfc'
				print(@sqlstr2)
				-------------<	
				set @j = @j +1
			end
		---------------			

		print(@sqlstr2)

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
		set @sqlstr3 =  Left(@sqlstr3, len(@sqlstr3) -1 )  + ') as Count_words_tfc, sum(count_words) as count_words,  SUM(count_docs) as count_docs, COUNT(*) AS Count_classes  into MDT_GLOBAL_'+@lang +'_tfc from Union_words_global_'+@lang +'_tfc GROUP BY Union_words_global_'+@lang+'_tfc.Word ;'
		--print (@sqlstr3)	
		print (@sqlstr3)
		exec (@sqlstr3)

	