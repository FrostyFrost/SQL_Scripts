Use TextCat

--------------------MDT_RUSENG_tfc

	declare @name as varchar (10)= 'TM' 
	
		,@lang as char = 'e'
	    ,@counttables as int = 67
		,@sqlstr1 as nvarchar (max) 
		,@sqlstr2 as nvarchar (max) 
		,@sqlstr3 as nvarchar (max) 
		,@sqlstr4 as nvarchar (max) 
		,@sqlstr4r as nvarchar (max) 
		,@sqlstr4e as nvarchar (max) 
		,@num as int
		,@num_cl as int
		,@i as int		
		,@j as int		
--		,@name as varchar (10) -- имя объекта rTM... 
		,@tablname as varchar (10) -- имя таблицы q_...
		,@fullname as varchar (50) -- полное имя
		,@language as varchar (10)
		,@M as nvarchar(3)
		
set @j  = 1
set @num_cl = 10
set @M  =rtrim(67)
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


		exec('drop table MDT_ruseng'+@name +'_tfc')
		exec ('select * into MDT_ruseng'+@name +'_tfc from MDT_ruseng'+@name +'')

		

		while (@i <@counttables +1)
			begin
				set @sqlstr1 = ('alter TABLE dbo.MDT_ruseng'+@name +'_tfc	alter column [sum_'+@lang +@name +ltrim(str(@i))+'] [real]')
				exec (@sqlstr1)
				set @sqlstr3 = ('UPDATE mdt_ruseng'+@name +'_tfc set sum_'+@lang +@name +ltrim(str(@i))+' = (sum_'+@lang +@name +ltrim(str(@i))+' * LOG ('+@M+' / dbo.MDT_ruseng'+@name +'_tfc.count_docs)) / (SELECT sqrt(sum(power((sum_'+@lang +@name +ltrim(str(@i))+' * LOG ('+@M+' / dbo.MDT_ruseng'+@name +'_tfc.count_docs)),2))) from mdt_ruseng'+@name +'_tfc) ')
				exec (@sqlstr3)
				set @i = @i + 1
			end


				
		set @num = 1
		set @i = 1
		set	@lang = 'e'
		while (@i <@counttables +1)
			begin		
				set @sqlstr1 = ('alter TABLE dbo.MDT_ruseng'+@name +'_tfc	alter column [sum_'+@lang +@name +ltrim(str(@i))+'] [real]')
				exec (@sqlstr1)
				set @sqlstr3 = ('UPDATE mdt_ruseng'+@name +'_tfc set sum_'+@lang +@name +ltrim(str(@i))+' = (sum_'+@lang +@name +ltrim(str(@i))+' * LOG ('+@M+' / dbo.MDT_ruseng'+@name +'_tfc.count_docs)) / (SELECT sqrt(sum(power((sum_'+@lang +@name +ltrim(str(@i))+' * LOG ('+@M+' / dbo.MDT_ruseng'+@name +'_tfc.count_docs)),2))) from mdt_ruseng'+@name +'_tfc) ')
				exec (@sqlstr3)
				set @i = @i + 1
			end


		--set @sqlstr2 = 'Update mdt_ruseng'+@name +'_tfc set count_words = (count_words* LOG (50.0 / dbo.MDT_ruseng'+@name +'_tfc.count_docs)) '
		--exec (@sqlstr2)

set @sqlstr4r = ' '
		---- Rus
		set @num = 1
		set @lang = 'r' 
		while(@num <@counttables +1 )
			begin 	
				set @sqlstr4r =  @sqlstr4r  +'sum_'+@lang+rtrim(@name ) +  ltrim(str(@num))+ ' + '
				set @num  = @num + 1
			end
set @sqlstr4e = ' '			
		---- Eng	
		set @num = 1
		set @lang = 'e' 
		while(@num <@counttables +1)
			begin 	
				set @sqlstr4e =  @sqlstr4e  +'sum_'+@lang+rtrim(@name ) +  ltrim(str(@num))+ ' + '
				set @num  = @num + 1
			end
		
exec('Alter table dbo.MDT_ruseng'+@name +'_tfc	add  [Count_words_tfc] [real]')
set @sqlstr4 = ('Update dbo.MDT_ruseng'+@name +'_tfc set [Count_words_tfc] = ('+@sqlstr4r+ left(@sqlstr4e, LEN(@sqlstr4e) - 1)+')')
--print(@sqlstr4)
exec(@sqlstr4)




		------------------ languages separately

		set	@lang = 'r'	
 				set @num = 1
				set @i = 1
				set @tablname = 'q_'  
				set @fullname = @tablname + @lang+ @name +  ltrim(str(@num))
				--set @name = 'RO' 


				exec('drop table MDT_'+@lang+@name +'_tfc')
				exec ('select * into MDT_'+@lang+@name +'_tfc from MDT_'+@lang+@name +'')



				while (@i <@counttables +1)
					begin
						set @sqlstr1 = ('alter TABLE dbo.MDT_'+@lang +@name +'_tfc	alter column [sum_'+@lang +@name +ltrim(str(@i))+'] [real]')
						exec (@sqlstr1)
						set @sqlstr3 = ('UPDATE mdt_'+@lang+@name +'_tfc set sum_'+@lang +@name +ltrim(str(@i))+' = (sum_'+@lang +@name +ltrim(str(@i))+' * LOG ('+@M+' / dbo.MDT_'+@lang+@name +'_tfc.count_docs)) / (SELECT sqrt(sum(power((sum_'+@lang +@name +ltrim(str(@i))+' * LOG ('+@M+' / dbo.MDT_'+@lang+@name +'_tfc.count_docs)),2))) from mdt_'+@lang+@name +'_tfc) ')
						exec (@sqlstr3)
						set @i = @i + 1
					end
exec('Alter table dbo.MDT_'+@lang+@name +'_tfc	add  [Count_words_tfc] [real]')
set @sqlstr4 = ('Update dbo.MDT_'+@lang+@name +'_tfc set [Count_words_tfc] = ('+left(@sqlstr4r, LEN(@sqlstr4r) - 1)+')')
--print(@sqlstr4)
exec(@sqlstr4)
					
					
					
		set	@lang = 'e'	
				set @num = 1
				set @i = 1
				set @tablname = 'q_'  
				set @fullname = @tablname + @lang+ @name +  ltrim(str(@num))
				--set @name = 'RO' 


				exec('drop table MDT_'+@lang+@name +'_tfc')
				exec ('select * into MDT_'+@lang+@name +'_tfc from MDT_'+@lang+@name +'')



				while (@i <@counttables +1)
					begin
						set @sqlstr1 = ('alter TABLE dbo.MDT_'+@lang +@name +'_tfc	alter column [sum_'+@lang +@name +ltrim(str(@i))+'] [real]')
						exec (@sqlstr1)
						set @sqlstr3 = ('UPDATE mdt_'+@lang+@name +'_tfc set sum_'+@lang +@name +ltrim(str(@i))+' = (sum_'+@lang +@name +ltrim(str(@i))+' * LOG ('+@M+' / dbo.MDT_'+@lang+@name +'_tfc.count_docs)) / (SELECT sqrt(sum(power((sum_'+@lang +@name +ltrim(str(@i))+' * LOG ('+@M+' / dbo.MDT_'+@lang+@name +'_tfc.count_docs)),2))) from mdt_'+@lang+@name +'_tfc) ')
						exec (@sqlstr3)
						set @i = @i + 1
					end
				exec('Alter table dbo.MDT_'+@lang+@name +'_tfc	add  [Count_words_tfc] [real]')
				set @sqlstr4 = ('Update dbo.MDT_'+@lang+@name +'_tfc set [Count_words_tfc] = ('+left(@sqlstr4e, LEN(@sqlstr4e) - 1)+')')
				--print(@sqlstr4)
				exec(@sqlstr4)
	
	set @j = @j+1
	end