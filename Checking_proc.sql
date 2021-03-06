USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[checking]    Script Date: 02/25/2014 11:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[checking] ( @tbl as nvarchar (15))
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
		while @j<15 + 1
			begin
				IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_checking]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
				drop table temp_checking
				exec('select ['+@name_+'] as checking into temp_checking from '+@tbl+' where num = 65+' + @j)
				set @check = (select checking from temp_checking )
				

				
				if (@check <> @name_) set @res = @res + 1
				set @j=@j + 1
			end
		set @i = @i+1
	end
select @res as Ошибки, @res/1.05 as Процент
return @res