USE [TextCat]
GO

DECLARE	@return_value int, @j int

set @j = 1
While @j < 91
	begin
		EXEC	@return_value = [dbo].[Import]
				@num = @j,
				@path = N'D:\Учеба\Бакалаврская Юров\Выборка\Выборка_IPIRAN\Новая папка (2)\',
				@name = N'rOTH_IPIRAN',
				@stem = 1
		set @j = @j +1
	end
SELECT	'Return Value' = @return_value

GO

select * from  q_rOTH_IPIRAN5