Use TextCat 

declare @counttables as int
		,@i as int	
		,@num as int
		,@sqlstr1 as nvarchar (max) =''
		,@sqlstr2 as nvarchar (max) =''
		,@sqlstr3 as nvarchar (max) =''
		,@sqlstr4 as nvarchar (max) =''
		,@sqlstr5 as nvarchar (max) =''
		,@lang as char
		,@Exam as nvarchar (50)
		,@Ex as nvarchar (50)
		,@name as nvarchar (50)
		,@RC as nvarchar (50) = ' '
		,@M as int
		,@p as int	
		,@j as int
	    ,@C as int 
		,@Union as nvarchar (20)
	    ,@obuch as int = 45
	    ,@Teacher as nvarchar (20)
	    ,@dop as int = 0
		,@t as nvarchar (50) 
		
		       
	     ---set @M = 18   --порог отсечения терминов 
	     ----------------Parameters
Set @ex = 'RO'
set @num = 46       --- начало экзаменационной выборки 
set @obuch = 45		-- объем обучающей выборки


While @num < 53  	------- конец экзаменационной выборки +1  delete from ccc
----------------------------





 

begin 
delete from ccc	
set	@lang = 'e'
set @t = @ex 
set @j = 0
Set @union = @ex+LTRIM(str(@num))

	While @j<16
			begin
				  
			--	if @j = 0 or @j = 1 or @j = 2 or @j = 3 or @j = 5 or @j = 10 or @j = 15 
				if @j = 10   -- = m - порог отсечения терминов
				begin
					
					set @M = @j

					Set @c = @obuch	 -- N для центроида
					exec ('drop table BS')
					exec ('create table [dbo].[BS]
					([Name] nvarchar (50),
					[distance] float ,
					[keynum] int)')

					----Union рус и англ таблиц
					--exec('drop table q_'+ @union)         
					set @sqlstr5 = 'select Word, r'+@union + ' as '+@Union +' into q_'+@union +' from q_r' + @Union + ' Union select Word,  e'+@Union  + ' from  q_e' + @Union + ''
					exec(@sqlstr5)
					Print (@sqlstr5)
					set @exam = ''+@Union
					
						---------- CLASS 'SC'

					set @name = 'SC'
					set @i = 1+ @dop
					set @lang = 'e'
					while @i < @obuch+ @dop + 1
					begin
								--(CASE WHEN sum_eSC20 = 0 THEN ((CASE WHEN sum_rSC20 = 0 THEN 0 ELSE sum_rSC20 END)) ELSE sum_eSC20 END)
					set @sqlstr1 = ' 
					
					SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square((CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END + (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END))) AS rasst
					into #Temp
					FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
										  dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
					WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
										  (CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
									 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
					insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '

					print(@sqlstr1)
					set @i = @i + 1
					exec (@sqlstr1)
					end  





					------TM

					set @name = 'TM'
					set @i = 1+ @dop
					set @lang = 'e'
					while @i < @obuch+ @dop + 1
					begin
					set @sqlstr1 = ' 
					
					SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square((CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END + (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END))) AS rasst
					into #Temp
					FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
										  dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
					WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
										  (CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
									 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
					insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					--print(@sqlstr1)
					set @i = @i + 1
					exec (@sqlstr1)
					end  


				--	-----------------CLASS NM

				--	set @name = 'NM'
				--	set @i = 1+ @dop
				--	set @lang = 'e'
				--	while @i < @obuch+ @dop + 1
				--	begin
				--set @sqlstr1 = ' 
					
				--	SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
				--						  THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square((CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
				--						  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END + (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
				--						  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END))) AS rasst
				--	into #Temp
				--	FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
				--						  dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
				--	WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
				--						  (CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
				--					 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
				--	insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '

				--	set @i = @i + 1
				--	exec (@sqlstr1)
				--	end  


					
				----	----------------->CLASS EO

				--	set @name = 'EO'
				--	set @i = 1+ @dop
				--	set @lang = 'e'
				--	while @i < @obuch + @dop+ 1
				--	begin
				--	set @sqlstr1 = ' 
									
				--	SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
				--						  THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square((CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
				--						  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END + (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
				--						  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END))) AS rasst
				--	into #Temp
				--	FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
				--						  dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
				--	WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
				--						  (CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
				--					 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
				--	insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '

				--	set @i = @i + 1
				--	exec (@sqlstr1)
				--	end  


				--	----------------<


				--	----------------->CLASS SA

				--	set @name = 'SA'
				--	set @i = 1+ @dop
				--	set @lang = 'e'
				--	while @i < @obuch + @dop+ 1
				--	begin
				--	set @sqlstr1 = ' 
					
				--	SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
				--						  THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square((CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
				--						  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END + (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
				--						  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END))) AS rasst
				--	into #Temp
				--	FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
				--						  dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
				--	WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
				--						  (CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
				--					 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
				--	insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '

				--	set @i = @i + 1
				--	exec (@sqlstr1)
				--	end  


					------------------------<
					                   
					--		 ------------->CLASS CO

					set @name = 'CO'
					set @i = 1+ @dop
					set @lang = 'e'
					while @i < @obuch + @dop+ 1
					begin
					set @sqlstr1 = ' 
					
					SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square((CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END + (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END))) AS rasst
					into #Temp
					FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
										  dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
					WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
										  (CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
									 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
					insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '

					set @i = @i + 1
					exec (@sqlstr1)
					end  
					------------------------<

					----------------->CLASS MC

					set @name = 'MC'
					set @i = 1+ @dop
					set @lang = 'e'
					while @i < @obuch + @dop+ 1
					begin
					set @sqlstr1 = ' 
					
					SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square((CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END + (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END))) AS rasst
					into #Temp
					FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
										  dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
					WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
										  (CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
									 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
					insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '

					set @i = @i + 1
					exec (@sqlstr1)
					end 
					----------------------<

					----------------->CLASS RO

					set @name = 'RO'
					set @i = 1+ @dop
					set @lang = 'e'
					while @i < @obuch + @dop+ 1
					begin
					set @sqlstr1 = ' 
					
					SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square((CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END + (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
										  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END))) AS rasst
					into #Temp
					FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
										  dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
					WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
										  (CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
									 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
					insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '

					set @i = @i + 1
					exec (@sqlstr1)
					end  				
					------------------------<
					
					
					
					set @sqlstr1 = 'insert into ccc (M'+ltrim(str(@M))+ '_n , M'+ltrim(str(@M))+ '_d , www)  select  top 15 name, distance, '''+((@Exam))+'''  from BS order by distance '
					exec (@sqlstr1)
									
					
					set @p = 0
					while @p < 11
						begin
			--			print('m= ' + str(@m) + ' Exam= ' + str(@t)+ ' p= '+ str(@p) + ' num= ' + str(@num))
							if @p = 1 or @p = 3 or @p = 5 or @p = 7 or @p = 10 or @p = 15 exec kbs_check @m =@m ,@Exam = @t, @k= @p, @i= @num, @desc = ' '
							set @p = @p+1					
						end
								
				
					select top 15 * from BS GROUP BY Name , distance, keynum order by distance  
					exec ('delete from BS')		
					exec('drop table q_'+ @union)     
				end
				set @j = @j + 1
			end
	Set @num = @num + 1
end	  
select * from ccc order by www       
