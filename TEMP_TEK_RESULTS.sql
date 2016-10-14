use TextCat 
declare 
@i as integer 
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
,@lang_ as nvarchar(6) 
,@M_ as int 
,@p as int
,@v as int
,@method_ as nvarchar(4) = 'CHI2'  
,@res_RARE as int = 0
,@res_SPECIAL as int = 0
,@res_INTERDISC as int = 0
,@res_COMMON as int = 0

set @method_ = 's1'
set @lang_ = 'e'

		--viborki
		set @v = 1
		while @v < 11 + 1 --11 - количество выборок
		begin
			EXEC	[dbo].[MDT_GLOBAL_CREATE]
				@fast_ = 1,
				@viborka_ = @v

			set @k = 1
			while @k < @num_cl + 1
				begin	
						
						set @name_ = rtrim((select class from classes where num = (select cl_num from MDT_current where num = @k)))
						
						exec ('Select z1.word from (select top 200 * from ' + @method_ + '_' + @lang_ + @name_ + ' order by max_' + @method_ + ' desc) as z1 join temp_TAK_RARE on z1.word = temp_TAK_RARE.word ')
						set @res_RARE  = @res_RARE + @@ROWCOUNT 

						exec ('Select z1.word from (select top 200 * from ' + @method_ + '_' + @lang_ + @name_ + ' order by max_' + @method_ + ' desc) as z1 join temp_TAK_SPECIAL on z1.word = temp_TAK_SPECIAL.word ')
						set @res_SPECIAL  = @res_SPECIAL + @@ROWCOUNT 

						--exec ('Select z1.word from (select top 200 * from ' + @method_ + '_' + @lang_ + @name_ + ' order by max_' + @method_ + ' desc) as z1 join temp_TAK_INTERDISC on z1.word = temp_TAK_INTERDISC.word ')
						--set @res_INTERDISC  = @res_INTERDISC + @@ROWCOUNT 

						exec ('Select z1.word from (select top 200 * from ' + @method_ + '_' + @lang_ + @name_ + ' order by max_' + @method_ + ' desc) as z1 join temp_TAK_COMMON on z1.word = temp_TAK_COMMON.word ')
						set @res_COMMON  = @res_COMMON + @@ROWCOUNT 

						
				set @k = @k +1
				end
		set @v = @v + 1		
		end
update temp_tak_results set [Rare] = @res_RARE , SPECIAL = @res_SPECIAL , [InterDisc] =  @res_INTERDISC , common = @res_COMMON where [Method] = @method_ + '_' + @lang_ 


select * from  temp_tak_results