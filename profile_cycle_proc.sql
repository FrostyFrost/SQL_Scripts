USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[Profile_cycle_proc]    Script Date: 01/20/2016 10:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  procedure [dbo].[Profile_cycle_proc] (@method_ as nvarchar(4),  @lang_ as char, @M_ as integer, @kbs as integer, @viborka_ as integer, @fast as bit, @method_t_ as nvarchar(4), @method_a_ as nvarchar(4) , @method_k_ as nvarchar(4),@t_ as float, @a_ as float, @k_ as float   )
as 

DECLARE	@return_value int
,@i as integer 
,@name_ as nvarchar (max)
,@sqlstr as nvarchar (max)=''
,@sqlstr1 as nvarchar (max)=''
,@sqlstr2 as nvarchar (max)=''
,@str1 as nvarchar (max)=''
,@j as integer 
,@exam_ as varchar(20)
,@k as integer = 1
,@union as nvarchar (20)
,@num_cl as integer = 7
,@p as int
,@metric_ as nvarchar(3) = 'cos' 
,@tblRes as nvarchar (20)
,@Volume as int = 65
,@VolMultCl as int

--------Parameters---vvv  
--,@t_ float 	= 3/6			-- коэффициненты при соответствующих частях
--,@a_ float 	= 1/6
--,@k_ float 	= 2/6

--,@method_t_  as nvarchar (4) = 'RO'		--метод для соответствующих частей ( если set @method_ = rtrim('part') )
--,@method_k_  as nvarchar (4) = 'RO'		--В ДАННОЙ ПРОЦЕДУРЕ НЕ РАССМАТРИВАЕМ РАЗДЕЛЬНУЮ КЛАССИФИКАЦИЮ
--,@method_a_  as nvarchar (4) = 'RO'

--set @lang_ = 'a'				-- язык. "а" - смешанный  
--set @M_ =200					-- длина профиля  Центроид: m=5, для профилей - длина профиля (100)
--set @method_ = rtrim('S1')		-- CHI2, MI, Cent, Ro, MI_I, uni1(lang=a), uni2(lang=a), tfc, S1, UNI3,4 (lang=a), part

--TODO: @metric
--set @metric_ = 'cos'		 	-- evk cos, для центроида	
--set @mult_ = 0.3				-- eng * mult	|	rus * (1-mult)
								--! Для MI профиля, для изменения порядка, требуется переучить метод
								--!!!!RO  = PHI
---------------------^^^
--IF not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tblRes_'+ @method_+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)


set @VolMultCl = @Volume*@num_cl 
begin
	EXEC	[dbo].[TblRes_Create]
			@method = @method_ 
end

set @tblRes = 'tblRes_'+ @method_ 


while @k < @num_cl + 1
	begin	
			
			set @sqlstr = @sqlstr +'['+rtrim((select class from classes where num = (select cl_num from MDT_current where num = @k)))+ '], '
			set @k = @k+1
	end
set @sqlstr = left(@sqlstr, len(@sqlstr )- 1)


If @fast  = 0   and @method_ <> 'KBS'  --Если полная классификация и не КБС
BEGIN

--IF not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+rtrim(@tblRes)+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
--exec ('Select * into '+@tblRes+' from tblCHI2')  -- Если таблица tblRes_RO удалена

exec('update '+@tblRes+' set TM=0, SC=0, NM=0, EO=0, SA=0, CO=0, MC=0, RO=0, DB=0, AU=0, CD=0, [IS]=0, PR=0, ST=0, OS=0, TV=0, DM=0, TI=0, FR=0, CL=0,PL=0,ML=0,FL=0,WS=0,SO=0,PS=0,CP=0,AP=0,PO=0,EC=0,MD=0,NE=0,CR=0,SL=0,AC=0,IM=0,NL=0,ND=0,NB=0,LN=0,NV=0
			update NaiveBayes set prob=0') 


--------------------------------------^^^
set @j = 1
while @j<@num_cl +1
	begin
		set @name_ = rtrim((select class from Classes where num = (select cl_num from MDT_current where num = @j) ))
		set @i = 1
		
		while @i < 15 + 1
			begin
					

					
					delete from centr1
					set @k = 1
							if @lang_ = 'a' 
								begin
									--------union rus + en
									Set @union = @name_+LTRIM(str(@Volume + @i))
									
									IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[q_'+ @union+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
									exec('drop table q_'+ @union) 
									
									set @sqlstr2 = 'select Word, r'+@union + ' as '+@union +', r'+@union + '_t as '+@union +'_t, r'+@union + '_k as '+@union +'_k,  r'+@union + '_a as '+@union +'_a into q_'+@union +' from q_r' + @union + ' union select Word,  e'+@union  + ', e'+@union + '_t as '+@union +'_t, e'+@union + '_k as '+@union +'_k,  e'+@union + '_a as '+@union +'_a from  q_e' + @union + ''
									exec(@sqlstr2)
									Print (@sqlstr2)
									set @exam_ = @union
								end
								
							else 
							
								begin
									set @exam_ = rtrim(@lang_)+ @name_ + ltrim(str(@Volume+@i ))
								end
						
						
						if @method_ = 'cent'
							begin
							 EXEC	[dbo].[Centroid_classification]
										
										@exam = @exam_
										,@lang = @lang_
										,@metric = @metric_
										,@m = @m_
							end
									
						if @method_ = 'CHI2' or  @method_ = 'MI' or  @method_ = 'Ro' or  @method_ = 'MI_I' or  @method_ = 'Q1'  or  @method_ like  'uni%' or  @method_ like  'uns%' or @method_ like  's[123]' 
							begin
							 EXEC	[dbo].[CHI2_orig] -- для  CHI2 и MI

									@exam = @exam_
									,@lang = @lang_
									,@M = @M_
									,@method = @method_
									,@Vol = @Volume
									--,@mult = @mult_4	
							end
						
						if @method_ = 'Part' 
							begin
							 EXEC	[dbo].[CHI2_orig_parts] 
									@exam = @exam_
									,@lang = @lang_
									,@M = @M_
									,@method = @method_
									,@method_a =@method_a_
									,@method_t =@method_t_
									,@method_k =@method_k_
									,@t_c = @t_
									,@a_c = @a_
									,@k_c = @k_
							end		
							
						--if @method_ = 'tfc' 
						--	begin
						--	 EXEC	[dbo].[proc_tfc] -- для  tfc

						--			@exam = @exam_
						--			,@lang = @lang_
						--			,@M = @M_	
						--	end
												
						if @method_ = 'NB'
							begin
								EXEC	 [dbo].[NBayes]
								@exam = @exam_
								,@name = @name_
								,@lang = @lang_
								,@M = @M_ 
								,@Dc = @Volume
							end
							
							
				set @p = @Volume+@i
				if @method_ = 'cent'
					exec  ('update tblRes_Cent set ['+@name_+'] = (select top 1 name from centr1 order by result desc) where num = ' + @p)

				if @method_ = 'CHI2' or  @method_ = 'MI' or @method_ = 'Ro' or  @method_ = 'MI_I'  or  @method_ like 'uni%' or @method_ = 'tfc' or @method_ like  'S[123]'  or @method_ = 'Part' 
					exec  ('update '+@tblRes+' set ['+@name_+'] = (select top 1 Class from profile_result order by weight desc) where num = ' + @p) --desc для выбора максимального веса. Для выбора минимального - убрать
				
				if @method_ = 'NB'
					exec  ('update tblRes_NB set ['+@name_+'] = (select top 1 Class from NaiveBayes where prob <>0 order by prob ) where num = ' + @p) 

					
				
				set @i =@i +1
			end
	
	
		set @j = @j +1
	end
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+rtrim(@tblRes)+ltrim(str(@viborka_ ))+@lang_+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
	set @str1 = ('drop table '+rtrim(@tblRes)+ltrim(str(@viborka_ ))+@lang_)
	exec (@str1)	
end
set @str1 = ('select * into '+rtrim(@tblRes)+ltrim(str(@viborka_ ))+@lang_ + ' from '+@tblRes+'' )
exec (@str1)	

END --- конец @fast = 0 @method <> KBS

ELSE IF @fast = 0 and @method_ = 'KBS'
BEGIN
	IF not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+rtrim(@tblRes)+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
	exec ('Select * into '+@tblRes+' from tblCHI2')  -- Если таблица tblRes_RO удалена

	exec('update '+@tblRes+' set TM=0, SC=0, NM=0, EO=0, SA=0, CO=0, MC=0, RO=0, DB=0, AU=0, CD=0, [IS]=0, PR=0, ST=0, OS=0, TV=0, DM=0, TI=0, FR=0')
	
	
	EXEC	 [dbo].[KBS_Cycle]
	 @kbs = @kbs
	,@lang = @lang_
	,@j = @M_ 
	,@Vol = 455


	


	IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+rtrim(@tblRes)+ltrim(str(@viborka_ ))+@lang_+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
	begin
		set @str1 = ('drop table '+rtrim(@tblRes)+ltrim(str(@viborka_ ))+@lang_)
		exec (@str1)	
	end
	
	set @str1 = ('select * into '+rtrim(@tblRes)+ltrim(str(@viborka_ ))+@lang_ + ' from '+@tblRes+'' )
	exec (@str1)
		

END



ELSE -- @fast = 1 - быстрая
BEGIN
	IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].['+ltrim(@tblRes)+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
	exec ('drop table '+@tblRes )
	
	set @str1 = ('select * into '+rtrim(@tblRes)+' from '+rtrim(@tblRes) + ltrim(str(@viborka_ ))+@lang_)
	exec (@str1)

END


IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tblRes]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table tblRes')

exec ('select '+@sqlstr+' into tblRes from '+@tblRes+'') --таблица для заполнения гридвью в GUI
exec @return_value = checking   @tbl = @tblRes 

return @return_value


--END
