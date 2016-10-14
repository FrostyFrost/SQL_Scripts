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
		,@t as nvarchar (50)
	    ,@C as int 
		,@Union as nvarchar (20)
	    ,@obuch as int = 30
	    ,@Teacher as nvarchar (20)
	    ,@dop as int = 9
	        
    --порог отсечения терминов
Set @ex = 'TM'
set @num = '7'

While @num < 53
begin   
delete from ccc	
set @j = 0
set	@lang = 'e'
set @t = @lang + @ex 

	While @j<16
		begin   
		--if @j = 0 or @j = 1 or @j = 2 or @j = 3 or @j = 5 or @j = 10 or @j = 15 
		if @j = 5 
		
					begin		
						set @M = @j
					Set @union = @ex+LTRIM(str(@num))

					--exec('drop table q_'+ @union)   
					set @name = 'SC'
					--set @RC = ' /@@ROWCOUNT '
					Set @c = 30	 -- N для центроида
					--exec ('drop table #temp')
					exec ('drop table BS')
					exec ('create table [dbo].[BS]
					([Name] nvarchar (50),
					[distance] float , select * from ccc
					[keynum] int)')


					----Union рус и англ таблиц
					--exec('drop table q_'+ @union)         
					set @sqlstr5 = 'select Word, r'+@union + ' as '+@Union +' into q_'+@union +' from q_r' + @Union + ' Union select Word,  e'+@Union  + ' from  q_e' + @Union + ''
					exec(@sqlstr5)
					Print (@sqlstr5)
					set @exam = ''+@Union
					-------


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

					print(@sqlstr1)
					set @i = @i + 1
					exec (@sqlstr1)
					end  


					--set @i = 1
					--set @lang = 'r'
					--while @i < @obuch + 1
					--begin
					--set @sqlstr1 = ' SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
					--                      THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square(CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
					--                      THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END) AS rasst
					--into #Temp
					--FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
					--                      dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
					--WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
					--                      (CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END <> 0)AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+')
					                      
					--insert into BS (Name, distance, keynum)  SELECT ''sum_'+@lang+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					--print(@sqlstr1)
					--set @i = @i + 1
					--exec (@sqlstr1)
					--end  





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
										  (CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+')
									 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
					insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					--print(@sqlstr1)
					set @i = @i + 1
					exec (@sqlstr1)
					end  


					--set @i = 1
					--set @lang = 'r'
					--while @i < @obuch + 1
					--begin
					--set @sqlstr1 = ' SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
					--                      THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square(CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
					--                      THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END) AS rasst
					--into #Temp
					--FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
					--                      dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
					--WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0)AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
					--                      (CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END <> 0)AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+')
					                      
					--insert into BS (Name, distance, keynum)  SELECT ''sum_'+@lang+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					----print(@sqlstr1)
					--set @i = @i + 1
					--exec (@sqlstr1)
					--end  

					-----------------CLASS NM

					set @name = 'NM'
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
										  (CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+')
									 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
					insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					--print(@sqlstr1)
					set @i = @i + 1
					exec (@sqlstr1)
					end  


					--set @i = 1
					--set @lang = 'r'
					--while @i < @obuch + 1
					--begin
					--set @sqlstr1 = ' SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
					--                      THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square(CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
					--                      THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END) AS rasst
					--into #Temp
					--FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
					--                      dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
					--WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0)AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
					--                      (CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END <> 0)AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+')
					                      
					--insert into BS (Name, distance, keynum)  SELECT ''sum_'+@lang+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					----print(@sqlstr1)
					--set @i = @i + 1
					--exec (@sqlstr1)
					--end  
					-------------
					----------------->CLASS EO

					set @name = 'EO'
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
										  (CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+')
									 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
					insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					--print(@sqlstr1)
					set @i = @i + 1
					exec (@sqlstr1)
					end  


					--set @i = 1
					--set @lang = 'r'
					--while @i < @obuch + 1
					--begin
					--set @sqlstr1 = ' SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
					--                      THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square(CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
					--                      THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END) AS rasst
					--into #Temp
					--FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
					--                      dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
					--WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0)AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
					--                      (CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END <> 0)AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+')
					                      
					--insert into BS (Name, distance, keynum)  SELECT ''sum_'+@lang+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					----print(@sqlstr1)
					--set @i = @i + 1
					--exec (@sqlstr1)
					--end  
					----------------<


					----------------->CLASS SA

					set @name = 'SA'
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
										  (CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+')
									 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') 
					insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					--print(@sqlstr1)
					set @i = @i + 1
					exec (@sqlstr1)
					end  


					--set @i = 1
					--set @lang = 'r'
					--while @i < @obuch + 1
					--begin
					--set @sqlstr1 = ' SELECT dbo.MDT_GLOBAL.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS Expr3, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
					--                      THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square(CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
					--                      THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END) AS rasst
					--into #Temp
					--FROM         dbo.MDT_GLOBAL FULL OUTER JOIN
					--                      dbo.q_'+@exam+' ON dbo.MDT_GLOBAL.Word = dbo.q_'+@exam+'.Word
					--WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0)AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+') OR
					--                      (CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END <> 0)AND (dbo.MDT_GLOBAL.count_words > '+ltrim(str(@m))+')
					                      
					--insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',   SQRT(SUM(rasst)) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					----print(@sqlstr1)
					--set @i = @i + 1
					--exec (@sqlstr1)
					--end  
					------------------------<
					set @sqlstr1 = 'insert into ccc (M'+ltrim(str(@M))+ '_n , M'+ltrim(str(@M))+ '_d , www)  select  top 10  name, distance, '''+((@Exam))+'''  from BS order by distance  '
					exec (@sqlstr1)
					                   
				
					
					set @p = 0
					while @p < 16
					begin
						if @p = 1 or @p = 3 or @p = 5 or @p = 7 or @p = 10 or @p = 15 exec kbs_check @m =@m ,@Exam = @t, @k= @p, @i= @num, @desc = ' '
					--	if @p = 15 exec kbs_check @m =@m ,@Exam = @t, @k= @p, @i= @num, @desc = ' '
					set @p = @p+1					
					end
				--		select top 10 * from BS GROUP BY Name , distance, keynum order by distance  
					exec('drop table q_'+ @union) 				
					exec ('delete from BS')
					
					end
				set @j = @j + 1
			end
	Set @num = @num + 1
end	  
select * from ccc order by www       
					                  