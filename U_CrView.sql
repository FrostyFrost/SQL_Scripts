USE [TextCat]
GO

DECLARE	@return_value int, @j  int

set @j = 1
While @j <91
begin

		EXEC	@return_value = [dbo].[Create_View]
				@num = @j,
				@name = N'rOTH_IPIRAN'
			set @j = @j +1			
end
SELECT	'Return Value' = @return_value

GO
