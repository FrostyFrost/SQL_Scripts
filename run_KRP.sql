USE [TextCat]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[KRP_check]
		@method1 = N'MI_I',
		@method2 = N'RO',
		@method3 = N'S2'
		--@method4 = N'Uni2',
		--@method5 = N'UNI6'

SELECT	'Return Value' = @return_value

GO
