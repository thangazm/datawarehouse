-- check cdc_enabled Databases
USE master   
GO
SELECT [name], database_id, is_cdc_enabled
FROM sys.databases
GO

-- use database
USE [dev]
GO

-- Enable cdc for database
EXEC sys.sp_cdc_enable_db   
GO

-- disable cdc for database
EXEC sys.sp_cdc_disable_db
GO

-- change owner
EXEC sp_changedbowner 'ThangaMH'


-- Create Schema
/* shows error syntax in with other queries together in one query window */
CREATE SCHEMA  player
GO

-- create table
CREATE TABLE [player].[profile]
(
     Id int identity,
     firstname nvarchar(40) not null,
     lastname nvarchar(40) not null,
     age nvarchar(40) null,
     Country nvarchar(40) null,
     playerposition nvarchar(20) null,
     constraint PK_PLAYER primary key (Id)
)
GO

-- drop table
DROP  TABLE [player].[profile]

-- drop Schema
DROP SCHEMA   player

-- enable cdc table
EXEC sys.sp_cdc_enable_table   
@source_schema = N'player',   --schema
@source_name = N'profile', -- table
@role_name = NULL   
GO

-- disable cdc table
exec sys.sp_cdc_disable_table 
  @source_schema = 'player', 
  @source_name = 'profile',
  @capture_instance = 'player_profile' -- or 'all'

-- check cdc enabled tables to track changes
SELECT [name], is_tracked_by_cdc
FROM sys.tables
where name not like 'sys%'
     and name not like 'MS%'


-- Insert records to Player_position
SET IDENTITY_INSERT [player].[profile] ON
INSERT INTO [player].[profile]
     ([Id],[firstname],[lastname],[age],[Country],[playerposition])
VALUES(1, 'Cristiano', 'Ronaldo', '34', 'Portugal', 'Winger')
SET IDENTITY_INSERT [player].[profile] OFF

SET IDENTITY_INSERT [player].[profile] ON
INSERT INTO [player].[profile]
     ([Id],[firstname],[lastname],[age],[Country],[playerposition])
VALUES(2, 'Leo', 'Messi', '32', 'Argentina', 'Forward')
SET IDENTITY_INSERT [player].[profile] OFF

-- update records to Player_position
UPDATE [player].[profile]
SET age = '28'
WHERE Id = 1;

-- Delete records from table
DELETE FROM [player].[profile] WHERE id=1

-- select all from table
SELECT *
FROM [player].[profile]

-- select change data list
SELECT *
FROM
     cdc.player_profile_CT 
GO

/*
1 = delete

2 = insert

3 = update (captured column values are those before the update operation). This value applies only when the row filter option 'all update old' is specified.

4 = update (captured column values are those after the update operation)
*/

