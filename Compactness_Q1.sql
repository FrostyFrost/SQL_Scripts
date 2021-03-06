USE [TextCat]
GO

DECLARE	@returnn float
,@j as int
,@i as int
,@num_cl as int = 7
,@Vol as int = 65
,@name as nvarchar(2)
,@Q1 as float
,@obj1_ as nvarchar(20)
,@obj2_ as nvarchar(20)
,@lang as nvarchar(6) = 'r'


set @Q1 = 0.00
set @i = 1 


while @i < @num_cl + 1
	begin
		set @name = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @i) )
		set @j = 1
		while @j < @vol + 1
			begin
				set @obj1_ = 'cent_' + ltrim(rtrim(@lang))+ ltrim(rtrim(@name))
				set @obj2_ =  'q_' + ltrim(rtrim(@lang)) +  ltrim(rtrim(@name)) + ltrim(str(@j)) 
				
				print @obj1_
				print @obj2_
				EXEC	[dbo].[distance]
						@obj1 = @obj1_,
						@obj2 = @obj2_,
						@method = N'evkl',
						@ret = @returnn OUTPUT
						set @Q1 = @Q1 + @returnn 
						
				set @j = @j +1
			end
	set @i = @i +1
	end
SELECT	@Q1/(@Vol*@num_cl ) as 'Q1'
GO

