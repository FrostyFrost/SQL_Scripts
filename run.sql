USE [TextCat]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[Profile_cycle_proc]   
		@method_ = N'ro',
		@lang_ = N'r',
		@M_ = 200
		,@kbs = 0
		,@viborka_ = 1
		,@fast = 0
 
SELECT	'Return Value' = @return_value  
									
GO
