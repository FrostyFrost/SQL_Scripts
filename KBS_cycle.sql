Use TextCat 

declare @counttables as int
		,@i as int		
		,@Union as nvarchar (20)
		,@sqlstr1 as nvarchar (max) 
		,@sqlstr2 as nvarchar (max) 
		,@sqlstr3 as nvarchar (max) 
		,@sqlstr4 as nvarchar (max) 
		,@lang as nvarchar (6)
		,@Exam as nvarchar (50)
		,@t as nvarchar (50)
		,@Ex as nvarchar (50)
		,@name as nvarchar (50)
		,@RC as nvarchar (50) = ' '
		,@M as int
	    ,@C as int 
	    ,@obuch as int = 45
	    ,@j as int = 0
	    ,@p as int = 0
	   --,@dop as int = 0
	    ,@num as int = 46
	    ,@k as int = 1
	    ,@l as int = 1
	    ,@num_cl as int = 6	    
			set @sqlstr1 = 'delete from ccc'
			exec (@sqlstr1)
			-- delete from [TextCat].[dbo].[kbs_result] --!!комментить 
 ------------------------- PARAMETERS
set @l = 1
while @l < @num_cl + 1 
		begin
			set @ex = rtrim((select Class from Classes where num = (select cl_num from MDT_current where num = @l)))
			set	@lang = rtrim('r')  -- 'r' 'e' 'ruseng' 

			set @num = 56	 -- начало экзаменационной выборки
			set @obuch = 55  -- объем обучающей выборки
		    
	    
While @num < 67 + 1		------- конец экзаменационной выборки +1
 --------------------------------
 

 
begin 
  
	set @j = 0
	While @j<16
			begin
				
				--if @j = 0 or @j = 1 or @j = 2 or @j = 3 or @j = 5 or @j = 10 or @j = 15 
				if @j = 5
				
				begin
					
					set @M = @j --порог отсечения терминов
			
							if @lang = 'ruseng' 
								begin
									--------Union rus + en
									set @t =  @ex 
									
									Set @union = @ex+LTRIM(@num)
									
									IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[q_'+ @union+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
									exec('drop table q_'+ @union) 
									
									set @sqlstr2 = 'select Word, r'+@union + ' as '+@Union +' into q_'+@union +' from q_r' + @Union + ' Union select Word,  e'+@Union  + ' from  q_e' + @Union + ''
									exec(@sqlstr2)
									--Print (@sqlstr2)
									set @exam = @Union
								end
								
							else 
							
								begin
									set @t = @lang + @ex
									set @exam = @lang+@ex+ltrim(str(@num))
								end
								

					--set @RC = ' /@@ROWCOUNT '
					Set @c = @obuch 	 -- N для центроида
					--exec ('drop table #temp')
					IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[BS]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
					exec ('drop table BS')
					
					exec ('create table [dbo].[BS]
					([Name] nvarchar (50),
					[distance] float ,
					[keynum] int)')
					
		set @k = 1
		while @k < @num_cl + 1 
				begin
					set @name = rtrim((select Class from Classes where num = (select cl_num from MDT_current where num = @k)))
					print @name
					set @i = 1
					while @i < @obuch+  1
					begin
					if @lang <> 'ruseng'
					 begin
						set @sqlstr1 = ' SELECT     dbo.MDT_GLOBAL_'+@lang+'.Word, CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' = 0 THEN ((CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' = 0 THEN 0 ELSE sum_'+@lang+@name+ltrim(str(@i))+' END)) ELSE sum_'+@lang+@name+ltrim(str(@i))+' END AS obuch, 
						  CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'0.0 / count_docs)) END AS examen, 
						  square((CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'0.0 / count_docs) END - CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL 
						  THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END)) AS rasst
						  
						  into #temp
	                      
							FROM         dbo.MDT_GLOBAL_'+@lang+' FULL OUTER JOIN
						  dbo.q_'+@exam+' ON dbo.MDT_GLOBAL_'+@lang+'.Word = dbo.q_'+@exam+'.Word
							WHERE     (dbo.MDT_GLOBAL_'+@lang+'.count_words > '+ltrim(str(@m))+') AND (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) 
						  END <> 0) OR
						  (CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL_'+@lang+'.count_words > '+ltrim(str(@m))+') OR
						  (CASE WHEN sum_'+@lang+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_'+@lang+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL_'+@lang+'.count_words > '+ltrim(str(@m))+')
						insert into BS (Name, distance, keynum)  SELECT ''sum_'+@lang+@name+ltrim(str(@i))+''',    abs(SUM(obuch * examen)) / SQRT(SUM(square(obuch)) * SUM(square(examen))) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					 end
					else
					 begin
						set @sqlstr1 = ' 
						SELECT dbo.MDT_GLOBAL_'+@lang+'.Word, CASE WHEN sum_e'+@name+ltrim(str(@i))+' = 0 THEN ((CASE WHEN sum_r'+@name+ltrim(str(@i))+' = 0 THEN 0 ELSE sum_r'+@name+ltrim(str(@i))+' END)) ELSE sum_r'+@name+ltrim(str(@i))+' END AS obuch, CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
											  THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END AS tfidf, square((CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL 
											  THEN ''0'' ELSE [dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs) END - CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END )) AS rasst
											 

						into #Temp
						FROM         dbo.MDT_GLOBAL_'+@lang+' FULL OUTER JOIN
											  dbo.q_'+@exam+' ON dbo.MDT_GLOBAL_'+@lang+'.Word = dbo.q_'+@exam+'.Word
						WHERE     (CASE WHEN [dbo].[q_'+@exam+'].['+@exam+'] IS NULL THEN ''0'' ELSE ([dbo].[q_'+@exam+'].['+@exam+'] * LOG ('+ltrim(str(@obuch))+'.0 / count_docs)) END <> 0) AND (dbo.MDT_GLOBAL_'+@lang+'.count_words > '+ltrim(str(@m))+') OR
											  (CASE WHEN sum_r'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_r'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL_'+@lang+'.count_words > '+ltrim(str(@m))+') 
										 OR   (CASE WHEN sum_e'+@name+ltrim(str(@i))+' IS NULL THEN ''0'' ELSE sum_e'+@name+ltrim(str(@i))+' END <> 0) AND (dbo.MDT_GLOBAL_'+@lang+'.count_words > '+ltrim(str(@m))+') 
						insert into BS (Name, distance, keynum)  SELECT ''sum_'+@name+ltrim(str(@i))+''',    abs(SUM(obuch * examen)) / SQRT(SUM(square(obuch)) * SUM(square(examen))) '+@RC+' AS evklidovo_rasst_'+@name +' , '+ltrim(str(@i))+' FROM  #temp '
					 end
					
					
					
					print(@sqlstr1)
					set @i = @i + 1
					exec (@sqlstr1)
					end
				set @k 	= @k  + 1  
				end

				
					
					
					set @sqlstr1 = 'insert into ccc (M'+ltrim(str(@M))+ '_n , M'+ltrim(str(@M))+ '_d , www)  select  top 15  name, distance, '''+((@Exam))+'''  from BS order by distance desc '
					exec (@sqlstr1)
					--print ('select  top 10  name, distance, '''+@Exam+'''  from BS order by distance desc ')
					set @p = 0
					while @p < 11
					begin
						--if @p = 1 or @p = 3 or @p = 5 or @p = 7 or @p = 10  exec kbs_check @m =@m ,@Exam = @t, @k= @p, @i= @num, @desc = 'desc', @lang_ = @lang --СМ Файл KBS_check_proc
						if @p = 5 exec kbs_check @m =@m ,@Exam = @t, @k= @p, @i= @num, @desc = 'desc', @lang_ = @lang --СМ Файл KBS_check_proc
						
					--	if @p = 15 exec kbs_check @m =@m ,@Exam = @t, @k= @p, @i= @num, @desc = 'desc'
					set @p = @p+1					 
					end
					
					exec ('delete from BS')
					exec ('delete from ccc')
		-------------KBS
					set @sqlstr2 = ''
		------------------
				end
				

				set @j=@j+1 
			END
--	select * from [TextCat].[dbo].[kbs_result]	
 	Set @num = @num + 1
END
set @l = @l + 1
end
--select * from ccc order by www
