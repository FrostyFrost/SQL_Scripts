USE [TextCat]
GO

EXEC	 [dbo].[KRP_check]
EXEC	 [dbo].[checking] @method = 'CHI2', @tbl = 'tblCHI2_KRP'

GO
