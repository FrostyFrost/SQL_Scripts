--HETEROGENITY
use textcat

declare @Meth1 nvarchar(12) = 'kbs'
,@Meth2  nvarchar(12) = 'RO'
,@A  int =0
,@B  int=0
,@C  int=0
,@D  int=0
,@sqlstr1   nvarchar(max)
,@sqlstr2   nvarchar(max)
,@cols  nvarchar (100) =''
,@num_cl as int = 7
,@k as int = 1
,@name as nvarchar(4)= ''
,@j as int = 1
,@m1 as bit = 0
,@m2 as bit = 0
,@res1 as nvarchar(4)
,@res2 as nvarchar(4)
, @Q as float = 0.00
, @ro as float = 0.00
, @z as float = 0.00
,@kappa as float = 0.00
,@v as int = 1
,@p as int = 2
,@p_ as int = 1

while @p < 8 + 1 --цикл до 6 (из 7 методов), т.к. последний не участвует в переборе (КБС исключили)
BEGIN
	set @p_ = @p + 1
	while @p_ < 9 + 1 
	begin
		set @Meth1 = (select method from methods where id = @p)
		set @Meth2 = (select method from methods where id = @p_)
		--set @Meth1 = 'kbs'
		--set @Meth2 = 'MI_I'
		select @Meth1, @Meth2 
		IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[heterogenity_'+ @meth1 + '_' +@meth2+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
		exec('drop table [heterogenity_'+ @meth1 + '_' +@meth2+']') 

		exec ('CREATE TABLE [dbo].[Heterogenity_'+ @meth1 + '_' +@meth2+'](
			[vib] [int] NULL,
			[Q] [float] NULL,
			[Corr] [float] NULL,
			[z] [float] NULL,
			[kappa] [float] NULL,
			[spear] [float] NULL
		) ON [PRIMARY]')


		--viborki
		set @v = 1
		while @v < 29 + 1 --11 - количество выборок
		begin
			--set vib (fast)
				EXEC	[dbo].[MDT_GLOBAL_CREATE]
				@fast_ = 1,
				@viborka_ = @v
			--classify (fast)
			
				EXEC	 [dbo].[Profile_cycle_proc]
						@method_ = @meth1,
						@lang_ = N'a',
						@M_ = 200,
						@kbs = 5,
						@viborka_ = @v,
						@fast = 1,
						@method_t_ = N'йцйц',
						@method_a_ = N'йцу',
						@method_k_ = N'йцу',
						@t_ = 1,
						@a_ = 1,
						@k_ = 1
						
				EXEC	 [dbo].[Profile_cycle_proc]
						@method_ = @meth2,
						@lang_ = N'a',
						@M_ = 200,
						@kbs = 5,
						@viborka_ = @v,
						@fast = 1,
						@method_t_ = N'йцйц',
						@method_a_ = N'йцу',
						@method_k_ = N'йцу',
						@t_ = 1,
						@a_ = 1,
						@k_ = 1
			set @A = 0
			set @B = 0	
			set @c = 0
			set @d = 0	
			
			set @k = 1
			while @k < @num_cl + 1
				begin	
						
						set @name = rtrim((select class from classes where num = (select cl_num from MDT_current where num = @k)))
						set @j = 1	
						
						while @j < 15 + 1
							begin
								  			
								IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_hetero]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
								drop table temp_hetero
								exec('select ['+@name+'] as checking into temp_hetero from tblres_'+@meth1+' where num = 65+' + @j)
								set @res1 = (select checking from temp_hetero ) 	

								IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_hetero]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
								drop table temp_hetero
								exec('select ['+@name+'] as checking into temp_hetero from tblres_'+@meth2+' where num = 65+' + @j)
								set @res2 = (select checking from temp_hetero ) 	
									
								if @res1 = @res2 and @res1 = @name --A
									Set @A = @A + 1
								else if @res1 <> @name and @res2 <> @name --D
									Set @D = @D + 1
								else if @res1 = @name AND @res2 <> @name
									Set @B = @B + 1			
								else 
									set @C = @C + 1
									
								set @j = @j +1 
							end	
						set @k = @k+1
				end
				
			--set @cols = left(@cols, len(@cols )- 1)

			Select @A as a, @B as b	, @C as c, @D as d

			Set @Q = (@A * @D - @B * @C + 0.00)/(@A * @D + @B * @C)
			Set @ro = (@A * @D - @B * @C + 0.00)/SQRT((@A + @C)*(@B + @D)*(@A + @B)*(@C + @D)) --
			Set @z = (@B + @C + 0.00)/105
			Set @kappa = 2*(@A * @C - @B * @D + 0.00)/((@A + @B)*(@C + @D)+(@A + @C)*(@B + @D))

			select dbo.viborka_check(), @Q as Q, @ro as corr, @z as Z, @kappa as kappa
			exec('insert into heterogenity_'+@meth1+ '_'+@meth2+' (vib, q,corr,z,kappa) select  '+ @v+', '+ @Q +', '+@ro+', '+@z+', '+@kappa)

		set @v = @v + 1
		if @v= 12 set @v = 21
		end
		exec('select * from heterogenity_'+@meth1+ '_'+@meth2)
		Set @p_ =@p_  +  1 
	end
set @p = @p + 1
END