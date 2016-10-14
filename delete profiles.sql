declare @lang as nvarchar(6)
,@name as nvarchar(2) 
,@num as int
,@i as int
,@j as int
,@sqlstr as nvarchar(max)
,@meth as nvarchar(4) 


Set @i = 1
set @lang = rtrim('r')
set @meth = 'RO'
While @i < 15 + 1 -- количество классов +1
		begin
			set @name = (select class from [dbo].[classes] where num =  @i) 
			print (@name)
			set @sqlstr = ('drop table '+@meth+'_'+@lang+rtrim(@name))
					--print(@sqlstr)
					IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+@meth+'_'+@lang+rtrim(@name)+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
					exec (@sqlstr)
			
			set @j = 1
			while @j<15
				begin
					set @sqlstr = ('drop table '+@meth+'_'+@lang+rtrim(@name)+ltrim(str(@j)))
					--print(@sqlstr)
					IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+@meth+'_'+@lang+rtrim(@name)+ltrim(str(@j))+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
					exec (@sqlstr)
					set	@j = @j +1
				end
		set @i = @i + 1
		end