USE [TextCat]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[Profile_obuch_proc]
		@method_ = N'ro',
		@lang = N'r',
		@fast_ = 0,
		@viborka_ = 2,
		@top_r = 100,
		@top_e = 100

SELECT	'Return Value' = @return_value

GO
