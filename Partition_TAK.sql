USE [TextCat]
GO

DECLARE	@return_value int
,@v as int


set @v = 24
while @v < 29 + 1
begin

select @v as Viborka
	--------Viborka

	EXEC	@return_value = [dbo].[MDT_GLOBAL_PART_CREATE]
			@fast_ = 1,
			@viborka_ = @v,
			@part = N'k'

	EXEC	 [dbo].[MDT_GLOBAL_PART_CREATE]
			@fast_ = 1,
			@viborka_ = @v,
			@part = N't'

	EXEC	 [dbo].[MDT_GLOBAL_PART_CREATE]
			@fast_ = 1,
			@viborka_ = @v,
			@part = N'a'


	------ Obuchenie

	EXEC	[dbo].[Profile_obuch_proc]
			@method_ = N'MI_P',
			@lang = N'a',
			@fast_ = 1,
			@viborka_ = @v,
			@top_r = 100,
			@top_e = 100,
			@F1 = 1,
			@F2 = 1,
			@F3 = 1

	EXEC	 [dbo].[Profile_obuch_proc]
			@method_ = N'RO_P',
			@lang = N'a',
			@fast_ = 1,
			@viborka_ =@v,
			@top_r = 100,
			@top_e = 100,
			@F1 = 1,
			@F2 = 1,
			@F3 = 1

	EXEC	 [dbo].[Profile_obuch_proc]
			@method_ = N's2_P',
			@lang = N'a',
			@fast_ = 1,
			@viborka_ = @v,
			@top_r = 100,
			@top_e = 100,
			@F1 = 1,
			@F2 = 1,
			@F3 = 1
			
			
	-- ------------Klassif



	EXEC	[dbo].[Profile_cycle_proc]
			@method_ = N'part',
			@lang_ = N'a',
			@M_ = 200,
			@kbs = 1,
			@viborka_ = @v,
			@fast = 0,
			@method_t_ = N'ro_t',
			@method_a_ = N's2_a',
			@method_k_ = N'mi_k',
			@t_ = 0.33, --0.33,
			@a_ = 0.16, --0.5,
			@k_ = 0.5 --0.16
			

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
	----		@t_ = 0.5, --0.33,
	----		@a_ = 0.16, --0.5,
	----		@k_ = 0.33 --0.16
			
			
			
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
	----		@a_ = 0.21, --0.5,
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
	----		@t_ = 0.8, --0.33,
	----		@a_ = 0.11, --0.5,
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
	----		@t_ = 0.8, --0.33,
	----		@a_ = 0.01, --0.5,
	----		@k_ = 0.19 --0.16
			
			
set @v= @v+1
end