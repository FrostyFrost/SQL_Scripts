USE [TextCat]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[MDT_GLOBAL_CREATE]
		@fast_ = 1,
		@viborka_ = 4

SELECT	'Return Value' = @return_value

GO
