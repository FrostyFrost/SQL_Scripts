USE [TextCat]
GO

DECLARE	@return_value int
,@i as integer = 101
,@Num_Cl as integer = 101
,@name_ as nvarchar (10)

While @i < @num_cl + 1 -- количество классов + 1
			begin
				set @name_ = (select class from [dbo].[classes] where num = @i )
				
			EXEC	@return_value = [dbo].[MDT_create]
					@name = @name_
					,@lang = N'r'
		
			EXEC	@return_value = [dbo].[MDT_create]
					@name = @name_
					,@lang = N'e'		
		
				set @i = @i+1
			end


SELECT	'Return Value' = @return_value

