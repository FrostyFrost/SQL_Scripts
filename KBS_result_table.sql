/****** Сценарий для команды SelectTopNRows среды SSMS  ******/
SELECT TOP 10000 [name]
      ,[m]
      ,[k]
      ,[result]
      

  FROM [TextCat].[dbo].[kbs_result]
--where result = 1
 -- order by result , m, k

	-- delete from [TextCat].[dbo].[kbs_result] where name like 'esc%'
