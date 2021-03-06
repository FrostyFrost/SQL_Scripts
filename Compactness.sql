USE [TextCat]
GO

DECLARE	@returnn float
,@j as int
,@i as int
,@k as int
,@num_cl as int = 7
,@Vol as int = 65
,@name as nvarchar(2)
,@Q2 as float
,@obj1_ as nvarchar(20)
,@obj2_ as nvarchar(20)
,@lang as nvarchar(6) = 'r'


set @Q2 = 0.00
set @i = 1 


while @i < @num_cl + 1
	begin
		set @name = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @i) )
		set @j = 1
		while @j < @vol + 1
			begin
				set @obj1_ = 'q_' + ltrim(rtrim(@lang)) +  ltrim(rtrim(@name)) + ltrim(str(@j)) 
				set @k = 1
				while @k < @vol + 1
					begin
					if @k > @j
						begin
							set @obj2_ =  'q_' + ltrim(rtrim(@lang)) +  ltrim(rtrim(@name)) + ltrim(str(@k)) 
							print @obj1_
							print @obj2_
							EXEC	[dbo].[distance]
									@obj1 = @obj1_,
									@obj2 = @obj2_,
									@method = N'evkl',
									@ret = @returnn OUTPUT
									set @Q2 = @Q2 + isnull(@returnn,0) 
						end
					set @k = @k +1
					end	
				set @j = @j +1
				
			end
	set @i = @i +1
	end
SELECT	@Q2/(@Vol*@num_cl ) as 'Q2'
GO

