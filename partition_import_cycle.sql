use textcat
declare 
@i as integer
,@j as integer 
,@name_ as nvarchar (max)
,@sqlstr as nvarchar (max)=''
,@sqlstr1 as nvarchar (max)=''
,@sqlstr2 as nvarchar (max)=''
,@exam_ as varchar(20)
,@k as integer = 1
,@union as nvarchar (20)
,@num_cl as integer = 1 -- номер класса 
,@lang_ as char  
,@M_ as int 
,@p as int


--Русский язык

set @i = 101
while @i < 101 + 1
	begin
		set @name_ =  (select Class from Classes where num = @i)
		
		set @j = 140	
		set @lang_ = 'r'
		while @j < 150+1
			begin
				EXEC	[dbo].[partition_import]
						@lang = @lang_,
						@name = @name_,
						@num = @j

				
				set @j = @j + 1
			end
			
		set @lang_ = 'e'	
		set @j = 1	
		while @j < 150+ 1
			begin
				EXEC	[dbo].[partition_import]
						@num = @j,
						@name = @name_ ,
						@lang = @lang_
				
				set @j = @j + 1
			end
		set @i = @i + 1
	end

	
------Английский
--set @lang_ = 'e'
--set @i = 12
--while @i < @num_cl + 1
--	begin
--		set @name_ = (select Class from Classes where num = @i)
--		set @j = 1	
--		while @j < 80 + 1
--			begin
--				EXEC	[dbo].[partition_import]
--						@num = @j,
--						@name = @name_ ,
--						@lang = @lang_
				
--				set @j = @j + 1
--			end
--		set @i = @i + 1
--	end