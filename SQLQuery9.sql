USE [TextCat]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[KRP_check]

exec checking  @method = 'KRP' , @tbl = 'tblCHI2_KRP'

GO

select * from tblCHI2_KRP