/*
===============================================================
Create Database and Schemas
===============================================================
Purpose:
    Drops and recreates the DataWareHouse database, then creates
    the bronze, silver, and gold schemas.

Warning:
    This will delete the existing database and all its data.
    Do not run in production unless intended.

*/

-- Switch to master
USE master;
GO

-- Drop database if it exists
IF EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'DataWareHouse'
)
BEGIN
    ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWareHouse;
END
GO

-- Recreate database
CREATE DATABASE DataWareHouse;
GO

-- Switch to the new database
USE DataWareHouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
