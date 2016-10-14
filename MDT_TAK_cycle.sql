
USE [TextCat]
GO

DECLARE	@return_value int
,@i as integer = 1
,@Num_Cl as integer = 41
,@name_ as nvarchar (10)
,@sqlstr as nvarchar (max)
,@lang as nvarchar (1)




While @i < @num_cl + 1 -- количество классов + 1
			begin
				set @name_ = rtrim((select class from [dbo].[classes] where num = @i ))
	
set @lang  = 'r'

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[MDT_TAK_'+ @lang+@name_ +']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec('	drop table MDT_TAK_'+ @lang+@name_ )

set @sqlstr = 'SELECT     dbo.MDT_'+ @lang+@name_ +'.Word, ISNULL(dbo.MDT_'+ @lang+@name_ +'_t.Count_docs, 0) AS T, (CASE WHEN (dbo.MDT_'+ @lang+@name_ +'_t.Count_docs) > 0 THEN 1 ELSE 0 END) AS T_b, 
                      ISNULL(dbo.MDT_'+ @lang+@name_ +'_a.Count_docs, 0) AS A, (CASE WHEN (dbo.MDT_'+ @lang+@name_ +'_a.Count_docs) > 0 THEN 1 ELSE 0 END) AS A_b, ISNULL(dbo.MDT_'+ @lang+@name_ +'_k.Count_docs, 0) 
                      AS K, (CASE WHEN (dbo.MDT_'+ @lang+@name_ +'_k.Count_docs) > 0 THEN 1 ELSE 0 END) AS K_b

into MDT_TAK_'+ @lang+@name_ +'
FROM dbo.MDT_' + @lang+@name_ +'_a FULL OUTER JOIN
                      dbo.MDT_' + @lang+@name_ +' ON dbo.MDT_' + @lang+@name_ +'_a.Word = dbo.MDT_' + @lang+@name_ +'.Word FULL OUTER JOIN
                      dbo.MDT_' + @lang+@name_ +'_k ON dbo.MDT_' + @lang+@name_ +'.Word = dbo.MDT_' + @lang+@name_ +'_k.Word FULL OUTER JOIN
                      dbo.MDT_' + @lang+@name_ +'_t ON dbo.MDT_' + @lang+@name_ +'.Word = dbo.MDT_' + @lang+@name_ +'_t.Word'
exec(@sqlstr)                   
----

set @lang  = 'e'

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[MDT_TAK_'+ @lang+@name_ +']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec('	drop table MDT_TAK_'+ @lang+@name_ )
	
set @sqlstr = 'SELECT     dbo.MDT_'+ @lang+@name_ +'.Word, ISNULL(dbo.MDT_'+ @lang+@name_ +'_t.Count_docs, 0) AS T, (CASE WHEN (dbo.MDT_'+ @lang+@name_ +'_t.Count_docs) > 0 THEN 1 ELSE 0 END) AS T_b, 
                      ISNULL(dbo.MDT_'+ @lang+@name_ +'_a.Count_docs, 0) AS A, (CASE WHEN (dbo.MDT_'+ @lang+@name_ +'_a.Count_docs) > 0 THEN 1 ELSE 0 END) AS	A_b , ISNULL(dbo.MDT_'+ @lang+@name_ +'_k.Count_docs, 0) 
                      AS K, (CASE WHEN (dbo.MDT_'+ @lang+@name_ +'_k.Count_docs) > 0 THEN 1 ELSE 0 END) AS K_b

into MDT_TAK_'+ @lang+@name_ +'
FROM dbo.MDT_' + @lang+@name_ +'_a FULL OUTER JOIN
                      dbo.MDT_' + @lang+@name_ +' ON dbo.MDT_' + @lang+@name_ +'_a.Word = dbo.MDT_' + @lang+@name_ +'.Word FULL OUTER JOIN
                      dbo.MDT_' + @lang+@name_ +'_k ON dbo.MDT_' + @lang+@name_ +'.Word = dbo.MDT_' + @lang+@name_ +'_k.Word FULL OUTER JOIN
                      dbo.MDT_' + @lang+@name_ +'_t ON dbo.MDT_' + @lang+@name_ +'.Word = dbo.MDT_' + @lang+@name_ +'_t.Word'
exec(@sqlstr)                        
				
		
		set @i = @i+1
end

