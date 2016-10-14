USE [TextCat]
GO

DECLARE	@return_value int
,@i as integer 
,@name_ as nvarchar (max)
,@sqlstr as nvarchar (max)=''
,@sqlstr1 as nvarchar (max)=''
,@sqlstr2 as nvarchar (max)=''
,@j as integer 
,@exam_ as varchar(20)
,@cl as varchar (2) = 'MC'
,@k as integer = 1
,@union as nvarchar (20)
,@num_cl as integer = 7
,@lang_ as char 
,@M_ as int 
,@p as int
,@method_ as nvarchar(4) = 'CHI2'  
,@metric_ as nvarchar(3) = 'cos' 
,@mult_ as float = 1  
,@tblCHI2 as nvarchar (20) 


--------Parameters---vvv  

,@method_t_  as nvarchar (4) = 'MI_I'			-- метод для соответствующих частей
,@method_k_  as nvarchar (4) = 'mi_I'			-- '0' для исключения части из классификации
,@method_a_  as nvarchar (4) = 's1'

set @lang_ = 'a'				-- язык. "а" - смешанный  
set @M_ = 5					-- длина профиля  Центроид: m=5, для профилей - длина профиля (200), для НБ m=5
set @method_ = rtrim('Cent')		-- NB, CHI2, MI, Cent, Ro, MI_I, uni1(lang=a), uni2(lang=a), tfc, S1, UNI3,4 (lang=a), PART
set @metric_ = 'cos'		 	-- evk cos, для центроида	
--set @mult_ = 0.3				-- eng * mult	|	rus * (1-mult)
								--! Для MI профиля, для изменения порядка, требуется переучить метод
								--!!!!RO  =? PHI
---------------------^^^

If @method_ = 'MI_I' 
	set @tblCHI2 =  'tblCHI2_1'
else if @method_ = 'RO' or  @method_ ='UNI1' or  @method_ ='UNI2'
	set @tblCHI2 =  'tblCHI2_2'
else if @method_ = 'S1'
	set @tblCHI2 =  'tblCHI2_3'
else if @method_ = 'cent'
	set @tblCHI2 =  'centr_Results'
else if @method_ = 'NB'
	set @tblCHI2 =  'NB_Results'  --- В КРП используется как tblCHI2_4
else if @method_ = 'PART'
	set @tblCHI2 =  'tblCHI2'
----- Обнуление таблиц резултатов----vvv
while @k < @num_cl + 1
	begin	
			set @sqlstr = @sqlstr + '['+ rtrim((select class from classes where num = (select cl_num from MDT_current where num = @k)))+ '], '
			set @k = @k+1
	end
set @sqlstr = left(@sqlstr, len(@sqlstr )- 1)

if @method_ = 'cent' 
	exec('update centr_results set TM=0, SC=0, NM=0, EO=0, SA=0, CO=0, MC=0, RO=0, DB=0, AU=0, CD=0, [IS]=0, PR=0, ST=0, OS=0')
else if @method_ = 'CHI2' or @method_ = 'MI' or @method_ = 'Ro' or @method_ = 'MI_I'  or @method_ like 'uni[1234]' or @method_ = 'tfc' or @method_ = 'S1' 
	exec('update '+@tblCHI2+' set  TM=0, SC=0, NM=0, EO=0, SA=0, CO=0, MC=0, RO=0, DB=0, AU=0, CD=0, [IS]=0, PR=0, ST=0, OS=0')
else if @method_ = 'NB' 
	exec('update NB_results set TM=0, SC=0, NM=0, EO=0, SA=0, CO=0, MC=0, RO=0, DB=0, AU=0, CD=0, [IS]=0, PR=0, ST=0, OS=0
		  update NaiveBayes set prob=0') 	


--------------------------------------^^^
set @j = 1
while @j<@num_cl +1
	begin
		set @name_ = rtrim((select class from Classes where num = (select cl_num from MDT_current where num = @j) ))
		set @i = 1
		
		while @i < 12 + 1
			begin
					

					
					delete from centr1
					set @k = 1
							if @lang_ = 'a' 
								begin
									--------union rus + en
									Set @union = @name_+LTRIM(str(55 + @i))
									exec('drop table q_'+ @union) 
									set @sqlstr2 = 'select Word, r'+@union + ' as '+@union +', r'+@union + '_t as '+@union +'_t, r'+@union + '_k as '+@union +'_k,  r'+@union + '_a as '+@union +'_a into q_'+@union +' from q_r' + @union + ' union select Word,  e'+@union  + ', e'+@union + '_t as '+@union +'_t, e'+@union + '_k as '+@union +'_k,  e'+@union + '_a as '+@union +'_a from  q_e' + @union + ''
									exec(@sqlstr2)
									Print (@sqlstr2)
									set @exam_ = @union
								end
								
							else 
							
								begin
									set @exam_ = rtrim(@lang_)+ @name_ + ltrim(str(55+@i ))
								end
						
						
						if @method_ = 'cent'
							begin
							 EXEC	[dbo].[Centroid_classification]
										
										@exam = @exam_
										,@lang = @lang_
										,@metric = @metric_
										,@m = @m_
							end
									
						if @method_ = 'CHI2' or  @method_ = 'MI' or  @method_ = 'Ro' or  @method_ = 'MI_I'  or  @method_ like  'uni[1234]'  or @method_ = 's1' 
							begin
							 EXEC	[dbo].[CHI2_orig] -- для  CHI2 и MI

									@exam = @exam_
									,@lang = @lang_
									,@M = @M_
									,@method = @method_
									--,@mult = @mult_4
							end		
								
						if @method_ = 'PART' 
							begin
							 EXEC	[dbo].[CHI2_orig_parts] -- для  CHI2 и MI

									@exam = @exam_
									,@lang = @lang_
									,@M = @M_
									,@method = @method_
									,@method_a =@method_a_ 
									,@method_t =@method_t_ 	
									,@method_k =@method_k_ 	
							end
							
						if @method_ = 'tfc' ---  использует tblCHI2
							begin
							 EXEC	[dbo].[proc_tfc] -- для  tfc

									@exam = @exam_
									,@lang = @lang_
									,@M = @M_	
							end
												
						if @method_ = 'NB'
							begin
								EXEC	 [dbo].[NBayes]
								@exam = @exam_
								,@name = @name_
								,@lang = @lang_
								,@M = @M_ 
							end
							
							
				set @p = 55+@i
				if @method_ = 'cent'
					exec  ('update centr_results set ['+@name_+'] = (select top 1 name from centr1 order by result desc) where num = ' + @p)

				if @method_ = 'CHI2' or  @method_ = 'MI' or @method_ = 'Ro' or  @method_ = 'MI_I'  or  @method_ like 'uni[1234]' or @method_ = 'tfc' or @method_ = 'S1' or @method_ = 'part'
					exec  ('update '+@tblCHI2+' set ['+@name_+'] = (select top 1 Class from profile_result order by weight desc) where num = ' + @p) --desc для выбора максимального веса. Для выбора минимального - убрать
				
				if @method_ = 'NB'
					exec  ('update NB_results set ['+@name_+'] = (select top 1 Class from NaiveBayes where prob <>0 order by prob ) where num = ' + @p) 

					
				
				set @i =@i +1
			end
	
	--	exec('select '+@sqlstr+' from tblCHI2') 
			
		set @j = @j +1
	end
	
print @name_	
if @method_ = 'Cent' 
	begin
		exec('select '+@sqlstr+' from centr_results') 
		exec checking  @method = @method_ , @tbl = ''
	end
	
else if @method_ = 'CHI2' or  @method_ = 'MI' or @method_ = 'Ro' or  @method_ = 'MI_I'  or  @method_ like 'uni[1234]' or @method_ = 'tfc' or @method_ = 'S1' or @method_ = 'part'

	begin	
		exec('select '+@sqlstr+' from '+@tblCHI2+'') 
		exec checking  @method = @method_ , @tbl = @tblCHI2
	end
else if @method_ = 'NB'
	begin
		exec('select '+@sqlstr +' from NB_results')
		exec checking  @method = @method_ , @tbl = @tblCHI2 
	end
	exec('select * from '+@tblCHI2)
--	drop table  nb_results