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
,@p as int = 1
,@p_ as int = 1
,@return_value as float = 0.0000
,@corr as float = 0.0000



while @p < 6 + 1 --цикл до 7 (из 8 методов), т.к. последний не участвует в переборе
BEGIN
	set @p_ = @p + 1
	while @p_ < 7 + 1 
	begin
		set @Meth1 = (select method from methods where id = @p)
		set @Meth2 = (select method from methods where id = @p_)
		--set @Meth1 = 'kbs'
		--set @Meth2 = 'MI_I'
		--select @Meth1, @Meth2 
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
		while @v < 11 + 1 --11 - количество выборок
		begin
			--set vib (fast)
			EXEC	[dbo].[MDT_GLOBAL_CREATE]
				@fast_ = 1,
				@viborka_ = @v

			set @k = 1
			while @k < @num_cl + 1
				begin	
						
						set @name = rtrim((select class from classes where num = (select cl_num from MDT_current where num = @k)))


														
							EXEC	@return_value = [dbo].[Spearman_corr]
									@N = 200,
									@pr1 = @meth1,
									@lang1 = N'ruseng',
									@cl1 = @name,
									@pr2 = @meth2,
									@lang2 = N'ruseng',
									@cl2 = @name
							set @corr = @corr + @return_value/1000



	
						set @k = @k+1
				end


		set @v = @v + 1
		end
	set @corr = @corr /(7*11)
	select @corr , @Meth1, @meth2
	exec('update  heterogenity set AVG_spear = '+@corr + ' where name = ''heterogenity_'+@meth1+ '_'+@meth2+ '''')
	set @corr = 0.00000
	--exec('select * from heterogenity_'+@meth1+ '_'+@meth2)
	Set @p_ =@p_  +  1 
	end
set @p = @p + 1
END