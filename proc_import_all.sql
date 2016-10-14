USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[cycle_import]    Script Date: 10/22/2012 09:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter  PROCEDURE [dbo].[cycle_import_all]
(@num_  int) -- @num -количество документов в классе
--,@path_ nvarchar (max) = 'D:\Учеба\Text categorizing\TM 01_03_2012\TM\rus\'
--,@name_ nvarchar (50) = 'rTM')

AS
declare @i int
,@j as int
,@cl as nvarchar (2)
,@num_cl as integer = 7
,@num_docs as integer	= 67
,@lang as char (1)
,@path as nvarchar(250)
,@name as nvarchar (3)

BEGIN
set @i  =1
While @i< @num_cl +1 
	BEGIN
		set @cl = (select Class from Classes where num = @i)
		--русский
		set @lang = 'r'
		set @j = 1
		while @j < @num_docs +1
			begin 
				set @path = 'D:\Учеба\Text categorization\Выборки\'+@cl+'\rus\'   --'D:\Учеба\Text categorizing\TM 01_03_2012\TM\rus\'
				set @name = @lang + @cl 
				
				exec [dbo].[Import] 
				@num = @j, 
				@path =  @path, 
				@name = @name
				
				exec [dbo].[create_View] @num = @j, 
				@name = @name
				
				print @name	+  str(@j)				
				set @j=@j+1
			end
			
			
		--англ
		set @lang = 'e'
		set @j = 1
		while @j < @num_docs +1
			begin 
				set @path = 'D:\Учеба\Text categorization\Выборки\'+@cl+'\eng\'   --'D:\Учеба\Text categorizing\TM 01_03_2012\TM\rus\'
				set @name = @lang + @cl 
				
				exec [dbo].[Import] @num = @j, 
				@path =  @path, 
				@name = @name

				exec [dbo].[create_View] @num = @j, 
				@name = @name
								
				print @name	+ str(@j)
				set @j=@j+1
			end



				--while @i < @num_ +1
				--	begin
				--	--select @i as 'i =' 
				--	exec [dbo].[Import] @num = @i, @path =  @path_, @name = @name_
				--	set @i = @i+1
				--	end
		set @i = @i+1
	end
END
