Use TextCat

--------------------MDT_RUSENG_TFIDF

	declare @name as varchar (10)= 'TM' 
	
		,@lang as char = 'e'
	    ,@counttables as int = 55
		,@sqlstr1 as nvarchar (max) 
		,@sqlstr2 as nvarchar (max) 
		,@sqlstr3 as nvarchar (max) 
		,@sqlstr4 as nvarchar (max) 
		,@num as int
		,@num_cl as int
		,@i as int		
		,@j as int		
--		,@name as varchar (10) -- имя объекта rTM... 
		,@tablname as varchar (10) -- имя таблицы q_...
		,@fullname as varchar (50) -- полное имя
		,@language as varchar (10)
		
		
set @j  = 1
set @num_cl = 7
While @j< @num_cl +1 
	BEGIN
		set @name = rtrim((select Class from Classes where num = @j))
		print (@name)
					
		set @num = 1
		set @i = 1
		set @tablname = 'q_'  
		set @fullname = @tablname + @lang+ @name +  ltrim(str(@num))
		--set @name = 'RO' 
		set	@lang = 'r'


		exec('drop table MDT_ruseng'+@name +'_tfidf')
		exec ('select * into MDT_ruseng'+@name +'_tfidf from MDT_ruseng'+@name +'')

		--set @sqlstr1 = ('alter TABLE dbo.MDT_ruseng'+@name +'_tfidf	alter column [count_words] [real]')
		--exec (@sqlstr1)
		--set @sqlstr1 = ('alter TABLE dbo.MDT_ruseng'+@name +'_tfidf	alter column [count_docs] [real]')
		--exec (@sqlstr1)


		while (@i <@counttables +1)
			begin
				set @sqlstr1 = ('alter TABLE dbo.MDT_ruseng'+@name +'_tfidf	alter column [sum_'+@lang +@name +ltrim(str(@i))+'] [real]')
				exec (@sqlstr1)
				set @sqlstr3 = ('UPDATE mdt_ruseng'+@name +'_tfidf set sum_'+@lang +@name +ltrim(str(@i))+' = sum_'+@lang +@name +ltrim(str(@i))+' * LOG (67.0 / dbo.MDT_ruseng'+@name +'_tfidf.count_docs) ')
				exec (@sqlstr3)
				set @i = @i + 1
			end


				
		set @num = 1
		set @i = 1
		set	@lang = 'e'
		while (@i <@counttables +1)
			begin		
				set @sqlstr1 = ('alter TABLE dbo.MDT_ruseng'+@name +'_tfidf	alter column [sum_'+@lang +@name +ltrim(str(@i))+'] [real]')
				exec (@sqlstr1)
				set @sqlstr3 = ('UPDATE mdt_ruseng'+@name +'_tfidf set sum_'+@lang +@name +ltrim(str(@i))+' = sum_'+@lang +@name +ltrim(str(@i))+' * LOG (67.0 / dbo.MDT_ruseng'+@name +'_tfidf.count_docs) ')
				exec (@sqlstr3)
				set @i = @i + 1
			end


		--set @sqlstr2 = 'Update mdt_ruseng'+@name +'_tfidf set count_words = (count_words* LOG (50.0 / dbo.MDT_ruseng'+@name +'_tfidf.count_docs)) '
		--exec (@sqlstr2)







		------------------ languages separately

		set	@lang = 'r'	
 				set @num = 1
				set @i = 1
				set @tablname = 'q_'  
				set @fullname = @tablname + @lang+ @name +  ltrim(str(@num))
				--set @name = 'RO' 


				exec('drop table MDT_'+@lang+@name +'_tfidf')
				exec ('select * into MDT_'+@lang+@name +'_tfidf from MDT_'+@lang+@name +'')



				while (@i <@counttables +1)
					begin
						set @sqlstr1 = ('alter TABLE dbo.MDT_'+@lang +@name +'_tfidf	alter column [sum_'+@lang +@name +ltrim(str(@i))+'] [real]')
						exec (@sqlstr1)
						set @sqlstr3 = ('UPDATE mdt_'+@lang+@name +'_tfidf set sum_'+@lang +@name +ltrim(str(@i))+' = sum_'+@lang +@name +ltrim(str(@i))+' * LOG (67.0 / dbo.MDT_'+@lang+@name +'_tfidf.count_docs) ')
						exec (@sqlstr3)
						set @i = @i + 1
					end
					
					
					
		set	@lang = 'e'	
				set @num = 1
				set @i = 1
				set @tablname = 'q_'  
				set @fullname = @tablname + @lang+ @name +  ltrim(str(@num))
				--set @name = 'RO' 


				exec('drop table MDT_'+@lang+@name +'_tfidf')
				exec ('select * into MDT_'+@lang+@name +'_tfidf from MDT_'+@lang+@name +'')



				while (@i <@counttables +1)
					begin
						set @sqlstr1 = ('alter TABLE dbo.MDT_'+@lang +@name +'_tfidf	alter column [sum_'+@lang +@name +ltrim(str(@i))+'] [real]')
						exec (@sqlstr1)
						set @sqlstr3 = ('UPDATE mdt_'+@lang+@name +'_tfidf set sum_'+@lang +@name +ltrim(str(@i))+' = sum_'+@lang +@name +ltrim(str(@i))+' * LOG (67.0 / dbo.MDT_'+@lang+@name +'_tfidf.count_docs) ')
						exec (@sqlstr3)
						set @i = @i + 1
					end
	set @j = @j+1
	end