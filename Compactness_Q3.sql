USE [TextCat]
GO

DECLARE	@returnn float
,@j as int
,@i as int
,@k as int
,@l as int
,@num_cl as int = 7
,@Vol as int = 65
,@name1 as nvarchar(2)
,@name2 as nvarchar(2)
,@Q3 as float
,@obj1_ as nvarchar(20)
,@obj2_ as nvarchar(20)
,@lang as nvarchar(6) = 'r'


set @Q3 = 0.00
set @i = 1 


while @i < @num_cl + 1
	begin
		set @name1 = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @i) )
		set @j = 1
		while @j < @vol + 1
			begin
				set @obj1_ = 'q_' + ltrim(rtrim(@lang)) +  ltrim(rtrim(@name1)) + ltrim(str(@j)) 
				set @k = 1
				while @k < @num_cl + 1 
					begin
					if @k > @i
						begin
							set @name2 = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @k) )
							set @l = 1
							while @l < @vol + 1
								begin
									set @obj2_ =  'q_' + ltrim(rtrim(@lang)) +  ltrim(rtrim(@name2)) + ltrim(str(@l)) 
									--print @obj1_
									--print @obj2_
									EXEC	[dbo].[distance]
											@obj1 = @obj1_,
											@obj2 = @obj2_,
											@method = N'evkl',
											@ret = @returnn OUTPUT
											set @Q3 = @Q3 + isnull(@returnn,0) 
								set @l = @l + 1
								end
						end
					set @k = @k +1
					end	
				set @j = @j +1
				
			end
	set @i = @i +1
	end
SELECT	@Q3/(@vol*@Vol*@num_cl ) as 'Q3_v4'

----------v33
print 'v33'
EXEC	[dbo].[MDT_GLOBAL_CREATE]
		@fast_ = 1,
		@viborka_ = 33
		
		
set @Q3 = 0.00

set @i = 1 
while @i < @num_cl + 1
	begin
		set @name1 = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @i) )
		set @j = 1
		while @j < @vol + 1
			begin
				set @obj1_ = 'q_' + ltrim(rtrim(@lang)) +  ltrim(rtrim(@name1)) + ltrim(str(@j)) 
				set @k = 1
				while @k < @num_cl + 1 
					begin
					if @k > @i
						begin
							set @name2 = (select class from [dbo].[classes] where num = (select cl_num from MDT_current where num = @k) )
							set @l = 1
							while @l < @vol + 1
								begin
									set @obj2_ =  'q_' + ltrim(rtrim(@lang)) +  ltrim(rtrim(@name2)) + ltrim(str(@l)) 
									--print @obj1_
									--print @obj2_
									EXEC	[dbo].[distance]
											@obj1 = @obj1_,
											@obj2 = @obj2_,
											@method = N'evkl',
											@ret = @returnn OUTPUT
											set @Q3 = @Q3 + isnull(@returnn,0) 
								set @l = @l + 1
								end
						end
					set @k = @k +1
					end	
				set @j = @j +1
				
			end
	set @i = @i +1
	end
SELECT	@Q3/(@vol*@Vol*@num_cl ) as 'Q3_v33'
