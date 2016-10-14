use TextCat
go
alter procedure Profile_obuch_proc (@method_ as nvarchar(4),  @lang as char, @fast_ as bit, @viborka_ as integer )

as
DECLARE	
@i  as integer
,@num_cl as integer = 7
,@name_ as nvarchar (max)
,@lang_ as char
,@r_ as integer
,@method as nvarchar (4) 
,@top_e_ as integer
,@top_r_ as integer
,@mult_ as numeric(4,2)
,@fast as bit
,@viborka as integer
,@sqlstr as nvarchar (max)
-------------------ОБУЧЕНИЕ


-----ПЕРЕМЕННЫЕ-------vvv
set @method = @method_
Set @r_ = 1 -- степень МИ-профиля -- не объявлено параметром
set @lang_ = @lang 

set @fast = @fast_  --  1 - быстрое, 0 - полное
set @viborka = @viborka_  

		--для UNI2,3:  
set @top_r_ = 100 -- не объявлено параметром
set @top_e_ = 100 -- не объявлено параметром
set @mult_	= 1   -- не объявлено параметром
----------------------^^^



if @fast = 0 --полное
BEGIN

IF (select COUNT(*) from sys.all_objects  where name like ''+@method+'_Temp1') <> 0 
	begin	
		exec('drop table '+@method+'_temp1')
	end
IF (select COUNT(*) from sys.all_objects  where name like ''+@method+'_Temp2') <> 0 
	begin	
		exec('drop table '+@method+'_temp2')
	end
IF (select COUNT(*) from sys.all_objects  where name like ''+@method+'_Temp3') <> 0 
	begin	
		exec('drop table '+@method+'_temp3')
	end
	


set @i = 1
While @i < @num_cl + 1 -- количество классов +1
		begin
			set @name_ = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @i) )
			print @name_
			
			
			 if @method = 'MI_I'
			 begin
				EXEC	[dbo].[MI_I]
						@name = @name_ 
						,@lang = @lang_	
						,@Vol = 67
						,@N = 469.00	
						--,@r = @r_	--Степень метода - Не понятно, насколько правильно применять степень
			 end
			 
			--else if @method = 'MI' --!!
			-- begin4
			--	EXEC	[dbo].[MI_2]
			--			@name = @name_ 
			--			,@lang = @lang_		
			--			,@r = @r_	--Степень метода
			--end

			else if @method = 'CHI2'	
			 begin		
				EXEC	[dbo].[CHI2_2]
						@name = @name_ 
						,@lang = @lang_		
			 end	
			 			
			else if @method = 'Cent'	
				 begin		
					EXEC	[dbo].[Centroid_raschet]
							@name = @name_ 
							,@lang = @lang_	
							,@Vol = 67	
				 end	
				 	
			else if @method = 'Ro'	
				 begin		
					EXEC	[dbo].[Ro]
							@name = @name_ 
							,@lang = @lang_		
							,@Vol = 67
							,@N = 469.00
				 end	
				 	
			else if @method = 'S1'	
				 begin		
					EXEC	[dbo].[S1]
							@name = @name_ 
							,@lang = @lang_		
							,@Vol = 67
							,@N = 469.00
				 end		
				
		
				 
			else if @method = 'UNI2'	
				 begin		
					EXEC	[dbo].[UNI2]
							@name = @name_ 
							,@top_r = @top_r_	
							,@top_e = @top_e_	
				 end		 
			
					
				else if @method = 'uni3'	
				 begin		
					EXEC	[dbo].[uni3]
							@name = @name_ 
							,@top_r = @top_r_	
							,@top_e = @top_e_	
							,@mult = @mult_
				 end			
				else if @method = 'uni4'	
				 begin		
					EXEC	[dbo].[uni4]
							@name = @name_ 
							,@top_r = @top_r_	
							,@top_e = @top_e_	
							,@mult = @mult_  
				 end	
				 		
				else if @method = 'uni1'	
				 begin		
					EXEC	[dbo].[uni1]
							
				end	 
			set @i = @i + 1	
			
			if @lang_ <> 'a'
				begin
					IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+@method + '_'+ @lang_  + rtrim(@name_) +ltrim(str(@viborka))+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
					begin
						set @sqlstr = ('drop table '+@method + '_'+ @lang_ + rtrim(@name_) +ltrim(str(@viborka)))
						exec (@sqlstr)
					end
					SET @sqlstr =('SELECT * into '+@method + '_'+ @lang_ + rtrim(@name_)+  ltrim(str(@viborka))+ ' from '+@method + '_'+ @lang_ + @name_ )
					exec (@sqlstr)
				end
			else
				begin
					IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+@method + '_ruseng' + rtrim(@name_) +ltrim(str(@viborka))+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
					begin
						set @sqlstr = ('drop table '+@method + '_ruseng' +rtrim(@name_) +ltrim(str(@viborka)))
						print (@sqlstr)
						print (@name_)
						exec (@sqlstr)
					end
					
					set @sqlstr = ''
					SET @sqlstr = ('SELECT * into '+@method + '_ruseng' + rtrim(@name_)+  ltrim(str(@viborka ))+ ' from '+@method + '_ruseng'+ @name_ )
					print (@sqlstr)
					print (@name_)
					exec (@sqlstr)
				end
			--SET @sqlstr = ('SELECT * into '+@method + '_ruseng' + rtrim(@name_) +  ltrim(str(@viborka)) + ' from '+@method + '_ruseng' + rtrim(@name_) )
			--print (@sqlstr)
			--exec (@sqlstr)
		end	
	return 2	-- полное, успешно
END
		
ELSE --если быстрое

BEGIN

set @i = 1
While @i < @num_cl + 1 -- количество классов +1
		begin
			set @name_ = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @i) )
				
				if @lang_ <> 'a'
					begin
						IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+@method + '_'+ @lang_ + @name_+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
						exec('	drop table '+@method + '_'+ @lang_ + @name_)

 						set @sqlstr = ('SELECT * into '+@method + '_'+ @lang_ + rtrim(@name_) + ' from '+@method + '_'+ @lang_ + rtrim(@name_) +ltrim(str(@viborka)))
						exec (@sqlstr)
					end
				else
					begin
						IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+@method + '_ruseng'+ @name_+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
						exec('	drop table '+@method + '_ruseng' + @name_)

						set @sqlstr = ('SELECT * into '+@method + '_ruseng' +rtrim(@name_) + ' from '+@method + '_ruseng' + rtrim(@name_)  +ltrim(str(@viborka)))
						exec (@sqlstr)
					end
					
			set @i = @i +1
		end
		
return 1 -- быстрое, успешно
END