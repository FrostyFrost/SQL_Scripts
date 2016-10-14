USE [TextCat]
GO

DECLARE	@return_value int
,@i as integer 
,@name_ as nvarchar (max)
,@sqlstr as nvarchar (max)
,@sqlstr2 as nvarchar (max)
,@j as integer 
,@exam_ as varchar(20)
,@cl as varchar (2) = 'MC'
,@k as integer = 1
,@Union as nvarchar (20)
,@num_cl as integer = 7
,@lang_ as char 
,@M_ as int 
,@p as int

set @lang_ = 'a'		--язык. "а" - смешанный
set @M_ = 20			--длина профиля


--delete from tblCHI2 
update tblCHI2 set TM=0, SC=0, NM=0, EO=0, SA=0, CO=0, MC=0
set @j = 1
while @j<@num_cl +1
	begin
		set @name_ = rtrim((select class from Classes where num = @j ))
		set @i = 1
		
		while @i < 12 + 1
			begin
					set @k = 1
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
									
								EXEC	@return_value = [dbo].[CHI2]
										@name = @name_
										,@exam = @exam_
										,@lang = @lang_ 


								select * from chi2_temp1


								EXEC	@return_value = [dbo].[CHI2_CHI2]
										@lang = @lang_
										,@m = @m_

	
				set @p = 55+@i
				exec  ('update tblCHI2 set '+@name_+' = (select top 1 Class from CHI2_result order by chi2_orig desc) where num = ' + @p)
				select * from chi2_result
				set @i =@i +1
			end
	
		select * from tblCHI2 

		set @j = @j +1
	end
	
print @name_	
--   drop table q_TM59