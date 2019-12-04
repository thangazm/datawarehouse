-- SELECT * FROM HumanResources.Department


-- USE master 
-- GO 
-- SELECT [name], database_id, is_cdc_enabled  
-- FROM sys.databases       
-- GO  


USE [AdventureWorks]
GO

-- enable cdc for the database
EXEC sys.sp_cdc_enable_db --enable for AdventureWorks
GO  