USE [TextCat]
GO

DECLARE	
@i  as integer
,@num_cl as integer = 7
,@name_ as nvarchar (max)
,@lang_ as char = 'r'



IF (select COUNT(*) from sys.all_objects  where name like 'chi2_Temp1') <> 0 
	begin	
		drop table chi2_temp1
	end
IF (select COUNT(*) from sys.all_objects  where name like 'chi2_Temp2') <> 0 
	begin	
		drop table chi2_temp2
	end
IF (select COUNT(*) from sys.all_objects  where name like 'chi2_Temp3') <> 0 
	begin	
		drop table chi2_temp3
	end


set @lang_ = 'a'

set @i = 1
--While @i < @num_cl + 1 -- количество классов +1
		begin
			set @name_ = (select class from [dbo].[classes] where num = @i )

				EXEC	[dbo].[CHI2_2]
						@name = 'CO'
						,@lang = @lang_			
							
			set @i = @i +1		
		end		
		
		
