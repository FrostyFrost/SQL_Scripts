USE [TextCat]
GO

DECLARE	@return_value int
,@v as int


set @v =29
while @v < 29 + 1
begin

select @v as Viborka
	--------Viborka

	EXEC	@return_value = [dbo].[MDT_GLOBAL_CREATE]
			@fast_ = 1,
			@viborka_ = @v


	------ Obuchenie

	EXEC	[dbo].[Profile_obuch_proc]
			@method_ = N'UNI6',
			@lang = N'a',
			@fast_ = 1,
			@viborka_ = @v,
			@top_r = 100,
			@top_e = 100,
			@F1 = 1,
			@F2 = 1,
			@F3 = 1
			
				EXEC	[dbo].[Profile_obuch_proc]
			@method_ = N's2',
			@lang = N'a',
			@fast_ = 1,
			@viborka_ = @v,
			@top_r = 100,
			@top_e = 100,
			@F1 = 1,
			@F2 = 1,
			@F3 = 1
			
				EXEC	[dbo].[Profile_obuch_proc]
			@method_ = N'mi_i',
			@lang = N'a',
			@fast_ = 1,
			@viborka_ = @v,
			@top_r = 100,
			@top_e = 100,
			@F1 = 1,
			@F2 = 1,
			@F3 = 1

	----EXEC	 [dbo].[Profile_obuch_proc]
	----		@method_ = N'RO_P',
	----		@lang = N'a',
	----		@fast_ = 1,
	----		@viborka_ =@v,
	----		@top_r = 100,
	----		@top_e = 100,
	----		@F1 = 1,
	----		@F2 = 1,
	----		@F3 = 1

	----EXEC	 [dbo].[Profile_obuch_proc]
	----		@method_ = N's2_P',
	----		@lang = N'a',
	----		@fast_ = 1,
	----		@viborka_ = @v,
	----		@top_r = 100,
	----		@top_e = 100,
	----		@F1 = 1,
	----		@F2 = 1,
	----		@F3 = 1
			
			
	-- ------------Klassif



	EXEC	[dbo].[Profile_cycle_proc]
			@method_ = N'kbs',
			@lang_ = N'a',
			@M_ = 15,
			@kbs = 5,
			@viborka_ = @v,
			@fast =1,
			@method_t_ = N'ro_t',
			@method_a_ = N's2_a',
			@method_k_ = N'mi_k',
			@t_ = 1, --0.33,
			@a_ = 1, --0.5,
			@k_ = 1 --0.16
			
	EXEC	[dbo].[Profile_cycle_proc]
			@method_ = N'ro',
			@lang_ = N'a',
			@M_ = 200,
			@kbs = 5,
			@viborka_ = @v,
			@fast = 1,
			@method_t_ = N'ro_t',
			@method_a_ = N's2_a',
			@method_k_ = N'mi_k',
			@t_ = 1, --0.33,
			@a_ = 1, --0.5,
			@k_ = 1 --0.16
	EXEC	[dbo].[Profile_cycle_proc]
			@method_ = N'mi_i',
			@lang_ = N'a',
			@M_ = 200,
			@kbs = 5,
			@viborka_ = @v,
			@fast = 1,
			@method_t_ = N'ro_t',
			@method_a_ = N's2_a',
			@method_k_ = N'mi_k',
			@t_ = 1, --0.33,
			@a_ = 1, --0.5,
			@k_ = 1 --0.16
	EXEC	[dbo].[Profile_cycle_proc]
			@method_ = N's2',
			@lang_ = N'a',
			@M_ = 200,
			@kbs = 5,
			@viborka_ = @v,
			@fast = 1,
			@method_t_ = N'ro_t',
			@method_a_ = N's2_a',
			@method_k_ = N'mi_k',
			@t_ = 1, --0.33,
			@a_ = 1, --0.5,
			@k_ = 1 --0.16
	EXEC	[dbo].[Profile_cycle_proc]
			@method_ = N'uni6',
			@lang_ = N'a',
			@M_ = 200,
			@kbs = 5,
			@viborka_ = @v,
			@fast = 1,
			@method_t_ = N'ro_t',
			@method_a_ = N's2_a',
			@method_k_ = N'mi_k',
			@t_ = 1, --0.33,
			@a_ = 1, --0.5,
			@k_ = 1 --0.16	
			
select 'Part'													
	EXEC	[dbo].[Profile_cycle_proc]
			@method_ = N'Part',
			@lang_ = N'a',
			@M_ = 200,
			@kbs = 1,
			@viborka_ = @v,
			@fast = 0,
			@method_t_ = N'UNi6',
			@method_a_ = N's2',
			@method_k_ = N'mi_i',
			@t_ = 1, --0.33,
			@a_ = 1, --0.5,
			@k_ = 1 --0.16
		
			
			


			
	----EXEC	[dbo].[Profile_cycle_proc]
	----		@method_ = N'part',
	----		@lang_ = N'a',
	----		@M_ = 200,
	----		@kbs = 1,
	----		@viborka_ = @v,
	----		@fast = 0,
	----		@method_t_ = N'ro_t',
	----		@method_a_ = N's2_a',
	----		@method_k_ = N'mi_k',
	----		@t_ = 0.55, --0.33,
	----		@a_ = 0.06, --0.5,
	----		@k_ = 0.38 --0.16

			
	----EXEC	[dbo].[Profile_cycle_proc]
	----		@method_ = N'part',
	----		@lang_ = N'a',
	----		@M_ = 200,
	----		@kbs = 1,
	----		@viborka_ = @v,
	----		@fast = 0,
	----		@method_t_ = N'ro_t',
	----		@method_a_ = N's2_a',
	----		@method_k_ = N'mi_k',
	----		@t_ = 0.6, --0.33,
	----		@a_ = 0.21, --0.5,
	----		@k_ = 0.19 --0.16


			
	----EXEC	[dbo].[Profile_cycle_proc]
	----		@method_ = N'part',
	----		@lang_ = N'a',
	----		@M_ = 200,
	----		@kbs = 1,
	----		@viborka_ = @v,
	----		@fast = 0,
	----		@method_t_ = N'ro_t',
	----		@method_a_ = N's2_a',
	----		@method_k_ = N'mi_k',
	----		@t_ = 0.6, --0.33,
	----		@a_ = 0.17, --0.5,
	----		@k_ = 0.23 --0.16
			
	----EXEC	[dbo].[Profile_cycle_proc]
	----		@method_ = N'part',
	----		@lang_ = N'a',
	----		@M_ = 200,
	----		@kbs = 1,
	----		@viborka_ = @v,
	----		@fast = 0,
	----		@method_t_ = N'ro_t',
	----		@method_a_ = N's2_a',
	----		@method_k_ = N'mi_k',
	----		@t_ = 0.65, --0.33,
	----		@a_ = 0.12, --0.5,
	----		@k_ = 0.23 --0.16
			
	----EXEC	[dbo].[Profile_cycle_proc]
	----		@method_ = N'part',
	----		@lang_ = N'a',
	----		@M_ = 200,
	----		@kbs = 1,
	----		@viborka_ = 28,
	----		@fast = 0,
	----		@method_t_ = N'ro_t',
	----		@method_a_ = N's2_a',
	----		@method_k_ = N'mi_k',
	----		@t_ = 0.65, --0.33,
	----		@a_ = 0.21, --0.5,
	----		@k_ = 0.14 --0.16

			
	----EXEC	[dbo].[Profile_cycle_proc]
	----		@method_ = N'part',
	----		@lang_ = N'a',
	----		@M_ = 200,
	----		@kbs = 1,
	----		@viborka_ = @v,
	----		@fast = 0,
	----		@method_t_ = N'ro_t',
	----		@method_a_ = N's2_a',
	----		@method_k_ = N'mi_k',
	----		@t_ = 0.7, --0.33,
	----		@a_ = 0.11, --0.5,
	----		@k_ = 0.19 --0.16

			
	----EXEC	[dbo].[Profile_cycle_proc]
	----		@method_ = N'part',
	----		@lang_ = N'a',
	----		@M_ = 200,
	----		@kbs = 1,
	----		@viborka_ = @v,
	----		@fast = 0,
	----		@method_t_ = N'ro_t',
	----		@method_a_ = N's2_a',
	----		@method_k_ = N'mi_k',
	----		@t_ = 0.7, --0.33,
	----		@a_ = 0.21, --0.5,
	----		@k_ = 0.09 --0.16
			
	----EXEC	[dbo].[Profile_cycle_proc]
	----		@method_ = N'part',
	----		@lang_ = N'a',
	----		@M_ = 200,
	----		@kbs = 1,
	----		@viborka_ = @v,
	----		@fast = 0,
	----		@method_t_ = N'ro_t',
	----		@method_a_ = N's2_a',
	----		@method_k_ = N'mi_k',
	----		@t_ = 0.75, --0.33,
	----		@a_ = 0.06, --0.5,
	----		@k_ = 0.19 --0.16

			
	----EXEC	[dbo].[Profile_cycle_proc]
	----		@method_ = N'part',
	----		@lang_ = N'a',
	----		@M_ = 200,
	----		@kbs = 1,
	----		@viborka_ = @v,
	----		@fast = 0,
	----		@method_t_ = N'ro_t',
	----		@method_a_ = N's2_a',
	----		@method_k_ = N'mi_k',
	----		@t_ = 0.7, --0.33,
	----		@a_ = 0.11, --0.5,
	----		@k_ = 0.14 --0.16
			
select 'KRP:'
EXEC	[dbo].[KRP_check]
		@method1 = N'Part',
		@method2 = N'UNI1',
		@method3 = N'MI_I',
		@method4 = N'UNS6',
		@method5 = N'kbs'


			
set @v= @v+1
end

