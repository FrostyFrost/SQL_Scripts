--select * from q_ruNM2

--drop table q_engIS1
--drop table engIS01
Use TExtcat
 EXEC	[dbo].[CHI2_orig] -- для  CHI2 и MI

									@exam = 'rOTH_IPIRAN90'
									,@lang = 'r'
									,@M = 200
									,@method = 'RO'
									,@Vol = 65
									--,@mult = @mult_4	
									
select  class, weight,  ROW_NUMBER() OVER(ORDER BY weight DESC) AS "Row Number"  from profile_result  

