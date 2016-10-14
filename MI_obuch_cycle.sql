USE [TextCat]
GO

DECLARE	
@i  as integer
,@num_cl as integer = 7
,@name_ as nvarchar (max)
,@lang_ as char = 'r'
,@r_ as integer
,@method as nvarchar (4)


-----ПЕРЕМЕННЫЕ
set @method = rtrim('CHI2')
Set @r_ = 2 -- степень МИ-профиля


-----------




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
	

set @lang_ = 'a' --   'a' - ruseng
set @r_ = 2


set @i = 1
While @i < @num_cl + 1 -- количество классов +1
		begin
			set @name_ = (select class from [dbo].[classes] where num = @i )
			if @method = 'MI'
			 begin
				EXEC	[dbo].[MI_2]
						@name = @name_ 
						,@lang = @lang_		
						,@r = @r_	--Степень метода
			 end
			 
			else if @method = 'CHI2'	
			 begin		
				EXEC	[dbo].[CHI2_2]
						@name = @name_ 
						,@lang = @lang_		
			 end				
			 
			set @i = @i + 1		
		end		
		
		
