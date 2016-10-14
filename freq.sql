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
,@res_title as int = 0
,@res_abstract as int = 0
,@res_keywords as int = 0
,@res_title_keywords as int = 0

set @method_ = 'ro'
set @lang_ = 'r'

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
						
						exec ('Select z1.word from (select top 200 * from ' + @method_ + '_' + @lang_ + @name_ + ' order by max_' + @method_ + ' desc) as z1 join temp_dict_title on z1.word = temp_dict_title.word ')
						set @res_title  = @res_title + @@ROWCOUNT 

						exec ('Select z1.word from (select top 200 * from ' + @method_ + '_' + @lang_ + @name_ + ' order by max_' + @method_ + ' desc) as z1 join temp_dict_abstract on z1.word = temp_dict_abstract.word ')
						set @res_abstract  = @res_abstract + @@ROWCOUNT 

						exec ('Select z1.word from (select top 200 * from ' + @method_ + '_' + @lang_ + @name_ + ' order by max_' + @method_ + ' desc) as z1 join temp_dict_keywords on z1.word = temp_dict_keywords.word ')
						set @res_keywords  = @res_keywords + @@ROWCOUNT 

						exec ('Select z1.word from (select top 200 * from ' + @method_ + '_' + @lang_ + @name_ + ' order by max_' + @method_ + ' desc) as z1 join temp_dict_titlekeywords on z1.word = temp_dict_titlekeywords.word ')
						set @res_title_keywords  = @res_title_keywords + @@ROWCOUNT 

						
				set @k = @k +1
				end
		set @v = @v + 1		
		end
update temp_TAK_freq set [title] = @res_title , abstract = @res_abstract , keywords =  @res_keywords, title_keywords = @res_title_keywords where [Method] = @method_ + '_' + @lang_ 


select * from  temp_TAK_freq

--select * into temp_TAK_frq from temp_tak_results