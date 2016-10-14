USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[CHI2_orig]    Script Date: 11/30/2012 12:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter procedure checking (@method as nvarchar (4))
as 
declare @name_ as  nvarchar (max)
,@i as int
,@num_cl as int = 7
,@j as int
,@res as int = 0
,@check  as nvarchar(max) = ''


set @i = 1
While @i < @num_cl + 1 -- количество классов +1
	begin
		set @name_ = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @i) )
		set @j = 1
		while @j<12 + 1
			begin
				if @method = 'Cent' exec('select ['+@name_+'] as checking into temp_checking from centr_results where num =  55+' + @j)
				else exec('select ['+@name_+'] as checking into temp_checking from tblCHI2 where num =  55+' + @j)
				set @check = (select checking from temp_checking )
				drop table temp_checking
				
				if (@check <> @name_) set @res = @res + 1
				set @j=@j + 1
			end
		set @i = @i+1
	end
select @res as Ошибки, @res/0.84 as Процент