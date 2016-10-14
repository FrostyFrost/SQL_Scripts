USE [TextCat]

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

,@m as integer  = 5
,@lang as varchar (1) = 'e'

exec('update tblCHI2 set  TM=0, SC=0, NM=0, EO=0, SA=0, CO=0, MC=0, RO=0, DB=0, AU=0')
while @k < @num_cl + 1
	begin	
		
			set @sqlstr = @sqlstr + rtrim((select class from classes where num = (select cl_num from MDT_current where num = @k)))+ ', '
			set @k = @k+1
	end
	
set @sqlstr = left(@sqlstr, len(@sqlstr )- 1)
set @k  = 0
While @k < @num_cl+1  -- количество классов + 1

begin
set @j = 1	
set @i = 1
set @cl = (select class  from classes where num =  @k)

		IF (select COUNT(*) from tempdb.sys.sysobjects where name like '%Temp_%') <> 0 
			begin	
				drop table #Temp
			end
		CREATE TABLE #Temp (class varchar(10))

		while @j < 12 + 1  -- объем экзаменационной выборки +1
			begin
				Update Naivebayes set  prob  = ''
		----------Union rus + eng
		--				Set @union = @cl+LTRIM(str(55 + @j))
		--				--exec('drop table q_'+ @union) 
		--				set @sqlstr2 = 'select Word, r'+@union + ' as '+@Union +' into q_'+@union +' from q_r' + @Union + ' Union select Word,  e'+@Union  + ' from  q_e' + @Union + ''
		--				exec(@sqlstr2)
		--				Print (@sqlstr2)
		--				set @exam_ = 'q_'+@Union
		---------------------------		
				set @exam_ = 'q_'+ @lang + @cl + ltrim(str(55 + @j))  --- для моноязычных выборок
				set @i = 1 
				
				While @i < @num_cl + 1 -- количество классов +1
					begin
						set @name_ = (select class from [dbo].[classes] where num = @i )
						
						EXEC [dbo].[NBayes]
							@name = @name_
							,@exam = @exam_
							,@Dc = 55
							,@d =385
							,@m = @m
							
						set @i = @i+1
					end
					
			--	exec ('select class, prob as ''prob '+@exam_+''' from NaiveBayes ')	
				exec ('update tblCHI2 set '+@name_+' = ( select top 1 class from NaiveBayes where abs(prob) > 1 order by abs(prob))')
				exec('drop table q_'+ @union) 
				set @j = @j+1
			end
			--exec ('select class as ''class '+@cl+'''  into from #temp')
			drop table #Temp
			--exec  ('update tblCHI2 set '+@name_+' = (select top 1 Class from profile_result order by weight drusengtm) where num = ' + @p) --drusengtm для выбора максимального веса. Для выбора минимального - убрать

			
set @k = @k +1
End		
		exec('select '+@sqlstr+' from tblCHI2') 

GO
