use textcat
declare 
@sql as nvarchar(max)
,@i as integer
,@j as integer
,@CHI as float
,@tf as float -- вес common-термина 
,@exam_word as nvarchar(max)
,@wg as float
,@wg_ as float
,@name as varchar (10) = ''
,@num_cl as int = 15
,@p as integer = 1
,@k as integer = 1
,@prof as nvarchar(4)
,@profs as nvarchar(20) = '   RO  MI_I'


While @k < 2 + 1
BEGIN
	set @prof = RTRIM(SUBSTRING (@profs,@k*4,4))
	set @j = 1
	while @j < @num_cl +1 --создали RO_rAU_prof
		begin
			set @name = rtrim((select Class from Classes where num = @j))

			exec('
			drop table '+@prof+'_r'+@name+'_prof
			SELECT     dbo.'+@prof+'_r'+@name+'.word, CASE WHEN rAU39 IS NULL THEN 0 ELSE rAU39 END as TKA, CASE WHEN rAU39_t IS NULL THEN 0 ELSE rAU39_t END title, CASE WHEN rAU39_a IS NULL 
								  THEN 0 ELSE rAU39_a END AS abstract
			into '+@prof+'_r'+@name+'_prof
			FROM         dbo.'+@prof+'_r'+@name+' LEFT OUTER JOIN
								  dbo.q_rAU39 ON dbo.'+@prof+'_r'+@name+'.word = dbo.q_rAU39.word
								  
		
		    
			update '+@prof+'_r'+@name+'_prof  set TKA = 0, title = 0, abstract = 0
			 ')
			set @p = 1
			while @p < 56
				begin
					exec ('UPDATE '+@prof+'_r'+@name+'_prof  SET '+@prof+'_r'+@name+'_prof.title = ['+@prof+'_r'+@name+'_prof].[title]+[q_r'+@name+@p+'].[r'+@name+@p+'_t] from  '+@prof+'_r'+@name+'_prof  INNER JOIN q_r'+@name+@p+' ON '+@prof+'_r'+@name+'_prof.word = q_r'+@name+@p+'.word;')
					exec ('UPDATE '+@prof+'_r'+@name+'_prof  SET '+@prof+'_r'+@name+'_prof.abstract = ['+@prof+'_r'+@name+'_prof].[abstract]+[q_r'+@name+@p+'].[r'+@name+@p+'_a] from  '+@prof+'_r'+@name+'_prof  INNER JOIN q_r'+@name+@p+' ON '+@prof+'_r'+@name+'_prof.word = q_r'+@name+@p+'.word;')
					exec ('UPDATE '+@prof+'_r'+@name+'_prof  SET '+@prof+'_r'+@name+'_prof.TKA = ['+@prof+'_r'+@name+'_prof].[TKA]+[q_r'+@name+@p+'].[r'+@name+@p+'] from  '+@prof+'_r'+@name+'_prof  INNER JOIN q_r'+@name+@p+' ON '+@prof+'_r'+@name+'_prof.word = q_r'+@name+@p+'.word;')
					set @p = @p + 1 
				end

			set @j = @j + 1
			 exec(' select * from '+@prof+'_r'+@name+'_prof order by title desc')

		end



	-- суммируем веса и частоты

	set @j = 1
	exec ('delete from profiles_'+@prof+'_tka')
	while @j < @num_cl +1 --
		begin
			set @name = rtrim((select Class from Classes where num = @j))
			exec ('insert into profiles_'+@prof+'_tka  (name, sum_weight_title, title, sum_weight_abstract,  abstract ) select   '''+@name+''' , sum(z0.mult_title) , sum(z0.title), sum(z0.mult_abstract) , sum(z0.abstract)  from (select top 50 '+@prof+'_r'+@name+'.word, max_'+@prof+', title, abstract , title*max_'+@prof+' as mult_title , abstract*max_'+@prof+' as mult_abstract from '+@prof+'_r'+@name+' inner join '+@prof+'_r'+@name+'_prof on '+@prof+'_r'+@name+'.word = '+@prof+'_r'+@name+'_prof.word) as z0')
			set @j = @j + 1
		end
select @prof
set @k = @k + 1
END