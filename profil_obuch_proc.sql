USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[Profile_obuch_proc]    Script Date: 01/28/2016 18:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[Profile_obuch_proc] (@method_ as nvarchar(4),  @lang as char, @fast_ as bit, @viborka_ as integer , @top_r as integer, @top_e as integer , @F1 as float, @F2 as float , @F3 as float  )

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
set @top_r_ = @top_r
set @top_e_ = @top_e
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
						,@Vol = 65
						,@N = 455.00	
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
							,@Vol = 65	
				 end	
				 	
			else if @method = 'Ro'	
				 begin		
					EXEC	[dbo].[Ro]
							@name = @name_ 
							,@lang = @lang_		
							,@Vol = 65
							,@N =455.00
				 end	
			else if @method = 'Ro_p'	
				 begin		
					EXEC	[dbo].[Ro_p]
							@name = @name_ 
							,@lang = @lang_		
							,@Vol = 65
							,@N =455.00
				 end	
				 
			else if @method = 'Ro_S'	
				 begin		
					EXEC	[dbo].[Ro_S]
							@name = @name_ 
				 end					 
				 	
			else if @method = 'S1'	
				 begin		
					EXEC	[dbo].[S1]
							@name = @name_ 
							,@lang = @lang_		
							,@Vol = 65
							,@N = 455.00
				 end		
				
			else if @method = 'S2'	
				 begin		
					EXEC	[dbo].[S2]
							@name = @name_ 
							,@lang = @lang_		
							,@Vol = 65
							,@N = 455.00
				 end
				 
			else if @method = 'S2_S'	
				 begin		
					EXEC	[dbo].[S2_S]
							@name = @name_ 
				 end
			else if @method = 'MI_S'	
				 begin		
					EXEC	[dbo].[MI_S]
							@name = @name_ 
				 end
								
											 		
			else if @method = 'Q1'	
				 begin		
					EXEC	[dbo].[Q1]
							@name = @name_ 
							,@lang = @lang_		
							,@Vol = 65
							,@N = 455.00
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
					EXEC	[dbo].[UNI3]
							@name = @name_ 
							,@top_r = @top_r_	
							,@top_e = @top_e_	
				 end	
				else if @method = 'uns3'	
				 begin		
					EXEC	[dbo].[UNS3]
							@name = @name_ 
							,@top_r = @top_r_	
							,@top_e = @top_e_	
				 end					 		
				else if @method = 'uni4'	
				 begin		
					EXEC	[dbo].[uni4]
							@name = @name_ 
							,@top_r = @top_r_	
							,@top_e = @top_e_	
							,@mult = @mult_  
				 end	
				 		
				else if @method = 'UNI5'	
				 begin		
					EXEC	[dbo].[UNI5]
							@name = @name_ 
							,@top_r = @top_r_	
							,@top_e = @top_e_	
				 end	
				 
				else if @method = 'UNI6'	
				 begin		
					EXEC	[dbo].[UNI6]
							@name = @name_ 
							,@top_r = @top_r_	
							,@top_e = @top_e_	
							--,@Fish1 = @F1
							--,@Fish2 = @F2
							--,@Fish3 = @F3
				 end 
				 
				else if @method = 'UNS6'	
				 begin		
					EXEC	[dbo].[UNS6]
							@name = @name_ 
							,@top_r = @top_r_	
							,@top_e = @top_e_	

				 end 
				 
				else if @method = 'UNI7'	
				 begin		
					EXEC	[dbo].[UNI7]
							@name = @name_ 
							,@top = @top_r_
				 end					 
				 
				 
				  		
				else if @method = 'uni1'	
				 begin		
					EXEC	[dbo].[uni1]
							
				end	 
			set @i = @i + 1	
			
			if @lang_ <> 'a' and @method <> 'RO_P'
				begin
					IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+@method + '_'+ @lang_  + rtrim(@name_) +ltrim(str(@viborka))+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
					begin
						set @sqlstr = ('drop table '+@method + '_'+ @lang_ + rtrim(@name_) +ltrim(str(@viborka)))
						exec (@sqlstr)
					end
					SET @sqlstr =('SELECT * into '+@method + '_'+ @lang_ + rtrim(@name_)+  ltrim(str(@viborka))+ ' from '+@method + '_'+ @lang_ + @name_ )
					exec (@sqlstr)
				end
			else if @lang_ = 'a' and @method <> 'RO_P'
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
			else if @method = 'RO_P'
				begin
				IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RO_t_ruseng' + rtrim(@name_) +ltrim(str(@viborka))+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
					begin
						set @sqlstr = ('drop table RO_t_ruseng' +rtrim(@name_) +ltrim(str(@viborka)))
						exec (@sqlstr)
					end
				set @sqlstr = ''
				SET @sqlstr = ('SELECT * into RO_t_ruseng' + rtrim(@name_)+  ltrim(str(@viborka ))+ ' from RO_t_ruseng'+ @name_ )
				exec (@sqlstr)
				
				IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RO_k_ruseng' + rtrim(@name_) +ltrim(str(@viborka))+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
					begin
						set @sqlstr = ('drop table RO_k_ruseng' +rtrim(@name_) +ltrim(str(@viborka)))
						exec (@sqlstr)
					end
				set @sqlstr = ''
				SET @sqlstr = ('SELECT * into RO_k_ruseng' + rtrim(@name_)+  ltrim(str(@viborka ))+ ' from RO_k_ruseng'+ @name_ )
				exec (@sqlstr)
				
				IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RO_a_ruseng' + rtrim(@name_) +ltrim(str(@viborka))+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
					begin
						set @sqlstr = ('drop table RO_a_ruseng' +rtrim(@name_) +ltrim(str(@viborka)))
						exec (@sqlstr)
					end
				set @sqlstr = ''
				SET @sqlstr = ('SELECT * into RO_a_ruseng' + rtrim(@name_)+  ltrim(str(@viborka ))+ ' from RO_a_ruseng'+ @name_ )
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
				
				if @lang_ <> 'a' and @method <> 'RO_P'
					begin
						IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+@method + '_'+ @lang_ + @name_+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
						exec('	drop table '+@method + '_'+ @lang_ + @name_)

 						set @sqlstr = ('SELECT * into '+@method + '_'+ @lang_ + rtrim(@name_) + ' from '+@method + '_'+ @lang_ + rtrim(@name_) +ltrim(str(@viborka)))
						exec (@sqlstr)
					end
				else if @lang_ = 'a' and @method <> 'RO_P'
					begin
						IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+@method + '_ruseng'+ @name_+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
						exec('	drop table '+@method + '_ruseng' + @name_)

						set @sqlstr = ('SELECT * into '+@method + '_ruseng' +rtrim(@name_) + ' from '+@method + '_ruseng' + rtrim(@name_)  +ltrim(str(@viborka)))
						exec (@sqlstr)
					end
				else if @method = 'ro_p'
					begin
						IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RO_t_ruseng'+ @name_+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
						exec('	drop table RO_t_ruseng' + @name_)

						set @sqlstr = ('SELECT * into RO_t_ruseng' +rtrim(@name_) + ' from RO_t_ruseng' + rtrim(@name_)  +ltrim(str(@viborka)))
						exec (@sqlstr)
						
						
						IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RO_k_ruseng'+ @name_+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
						exec('	drop table RO_k_ruseng' + @name_)

						set @sqlstr = ('SELECT * into RO_k_ruseng' +rtrim(@name_) + ' from RO_k_ruseng' + rtrim(@name_)  +ltrim(str(@viborka)))
						exec (@sqlstr)
						
						
						IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RO_a_ruseng'+ @name_+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
						exec('	drop table RO_a_ruseng' + @name_)

						set @sqlstr = ('SELECT * into RO_a_ruseng' +rtrim(@name_) + ' from RO_a_ruseng' + rtrim(@name_)  +ltrim(str(@viborka)))
						exec (@sqlstr)
					end
			set @i = @i +1
		end
		
return 1 -- быстрое, успешно
END