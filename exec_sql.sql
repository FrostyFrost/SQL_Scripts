use textcat
go
DECLARE	@return_value int
,@v as int 
,@string as nvarchar(max)
,@name_ as nvarchar(2)
,@c  as int
,@i as int
,@mini as int = 1

,@SQL NVARCHAR(MAX)


set @i = 1
while @i < 1+ 1
	begin
		    set @name_ =  (select Class from Classes where num = @i)
			print (@name_)
			set @v = 1
			while @v < 100 + 1
			begin 


				set @sql=N'select @c = sum(r'+ @name_ + ltrim(str(@v)) + ') from q_r'+ @name_ + ltrim(str(@v)) + ''

				EXECUTE sp_executesql @SQL, N'@c INT OUTPUT', @C=@C OUTPUT;

				if @c<50 and @c >0 
				begin
					set @mini = @mini + 1	
					set @string = @SQL 
				end
				
				set @v = @v + 1

			end

			print @mini
			print @string
			set @mini = 1
			set @i = @i +1 
	end
	
	