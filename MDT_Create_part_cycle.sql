USE [TextCat]
GO

DECLARE	@return_value int
,@i as integer = 101
,@Num_Cl as integer = 107
,@name_ as nvarchar (10)

While @i < @num_cl + 1 -- количество классов + 1
			begin
				set @name_ = rtrim((select class from [dbo].[classes] where num = @i ))
				
		EXEC	 [dbo].[MDT_create_part]
		@name = @name_,
		@lang = N'r',
		@part = N'a'

		
		EXEC	[dbo].[MDT_create_part]
		@name = @name_,
		@lang = N'r',
		@part = N't'
		
		EXEC	 [dbo].[MDT_create_part]
		@name = @name_,
		@lang = N'r',
		@part = N'k'
		
		EXEC	[dbo].[MDT_create_part]
		@name = @name_,
		@lang = N'e',
		@part = N'a'
		
		EXEC	[dbo].[MDT_create_part]
		@name = @name_,
		@lang = N'e',
		@part = N't'
		EXEC	 [dbo].[MDT_create_part]
		@name = @name_,
		@lang = N'e',
		@part = N'k'
				
		
		set @i = @i+1
end




