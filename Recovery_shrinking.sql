BACKUP DATABASE textcat 
 TO DISK = 'D:\�����\Text categorization\������������\Projects\TextCat.bak'
   WITH FORMAT;
GO

ALTER DATABASE textCat
SET RECOVERY SIMPLE;
GO
-- Shrink the truncated log file to 800 MB.
DBCC SHRINKFILE (TextCat_Log, 800);
GO
-- Reset the database recovery model.
ALTER DATABASE textCat
SET RECOVERY FULL;
GO

--select log_reuse_wait_desc  from sys.databases
----log_reuse_wait_desc ������� sys.databases

--exec msdb..sp_helppublication;
--exec msdb..sp_removedbreplication;