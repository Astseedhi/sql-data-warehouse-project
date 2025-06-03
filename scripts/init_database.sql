
/*
======================================================================
Create Database and schemas 

======================================================================

Script purpose:
            This script create a new database name 'datawarehouse' after checking if it already exists.
            If the database exists, it is dropped and recreated. Additionally, the script sets up  three schemas within the database:
            'bronze','silver', and 'gold'.
Warning:
      Running this script will drop the  entire 'datawarehouse' database if it exists.
      All data in the database will be  permanently deleted. Proceed with caution 
      and ensure you have proper backups before running the script.
*/


use master;
go

--Drop and recreate the 'Datawarehouse' database
IF exists(select 1 from sys.databases where  name = 'datawarehouse')
begin
  Alter database datawarehouse set  single_user with  rollback immediate;
  drop  database  datawarehouse;
    
end;
go

--Create the 'Datawarehouse' database
create  database datawarehouse;
go

use datawarehouse;
go
-- create schemas
create schema bronze;
go

create schema silver;
go 

create schema gold;
go
