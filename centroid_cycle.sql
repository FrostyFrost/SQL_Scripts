USE [TextCat]
GO

DECLARE	@return_value int

,@lang_ as char = 'r'
,@metric_ as nvarchar (3)
,@m_ as int = 0
,@j as integer 
,@i as int
,@exam_ as varchar(20)
,@cl as varchar (2) = 'MC'
,@k as integer = 1
,@Union as nvarchar (20)
,@num_cl as integer = 7
,@p as int
,@name_ as nvarchar (2)
,@sqlstr as nvarchar (max) = ''
,@sqlstr2 as nvarchar (max) = ''

set @lang_ = 'a'		--язык. "а" - смешанный  
set @M_ = 10	--длина профиля
set @metric_ = 'cos'	-- 3 символа

while @k < @num_cl + 1
	begin	
			set @sqlstr = @sqlstr + rtrim((select class from classes where num = (select cl_num from MDT_current where num = @k)))+ '=0, '
			set @k = @k+1
	end

set @sqlstr = left(@sqlstr, len(@sqlstr )- 1)
exec('update centr_results set' + @sqlstr)
set @j = 1
while @j<@num_cl + 1
	begin
		set @name_ = rtrim((select class from Classes where num = (select cl_num from MDT_current where num = @j)))
		set @i = 1

		while @i < 12 + 1
			begin
					delete from centr1
		
				
							if @lang_ = 'a' 
								begin
									--------Union rus + en
 									Set @union = @name_+LTRIM(str(55 + @i))
									exec('drop table q_'+ @union) 
									set @sqlstr2 = 'select Word, r'+@union + ' as '+@Union +' into q_'+@union +' from q_r' + @Union + ' Union select Word,  e'+@Union  + ' from  q_e' + @Union + ''
									exec(@sqlstr2)
									Print (@sqlstr2)
									set @exam_ = @Union
								end
								
							else 
							
								begin
									set @exam_ = rtrim(@lang_)+ @name_ + ltrim(str(55+@i ))
								end
								
											
							EXEC	[dbo].[Centroid_classification]
										
										@exam = @exam_
										,@lang = @lang_
										,@metric = @metric_
										,@m = @m_
														
							--exec('drop table q_'+ @union) 
	
				set @p = 55+@i
				select * from centr1
				exec  ('update centr_results set '+@name_+' = (select top 1 name from centr1 order by result desc) where num = ' + @p)
				
				set @i =@i +1
				
			end
	
		select * from tblCHI2 

		set @j = @j +1
	end
	
print @name_	




GO
