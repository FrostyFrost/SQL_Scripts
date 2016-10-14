USE [TextCat]
GO

DECLARE	@return_value int
,@i as integer = 1
,@j as integer = 1
,@Num_Cl as integer = 41
,@name as nvarchar (10)

While @i < @num_cl + 1 -- количество классов + 1
			begin
				set @name = rtrim((select class from [dbo].[classes] where num = @i ))
				set @j = 1
				While @j < (3 + @i%5)	+ 1
				begin
					exec('select * into q_e' + @name + @j + '_ from q_e' + @name + @i + '')
					exec ('delete from q_e' + @name + @j)
					set @j = @j + 1
				end	
				
				
			set @i = @i+1
end			

