/*
=======================================================================================================================
DDL Script: Create Bronze tables
=======================================================================================================================
Script Purpose:
      This script create tables in the 'bronze' schema, dropping existing tables if they already exists 
      Run the script to redine the ddl structure of 'bronze' Tables     


=======================================================================================================================

*/

use datawarehouse;

If OBJECT_ID ('bronze.crm_cust_info','U') is not null
	drop table bronze.crm_cust_info;
Create table bronze.crm_cust_info(
cust_id int,
cst_key nvarchar(50),
cst_firstname nvarchar(50),
cst_last_name nvarchar(50),
cst_material_status  nvarchar(50),
cst_gndr nvarchar(50),
cst_create_date date
)

If OBJECT_ID('bronze.crm_prd_info','U') is not null
	drop table bronze.crm_prd_info;
create table bronze.crm_prd_info(
prd_id int,
prd_key nvarchar(50),
prd_nm nvarchar(50),
prd_cost nvarchar(50),
prd_line nvarchar(50),
prd_start_dt date,
prd_end_dt date
)

if OBJECT_ID('bronze.crm_sales_details','U') is not null
	drop table bronze.crm_sales_details;
create table bronze.crm_sales_details(
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id int,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int,
sls_sales int,
sls_quantity int,
sls_price int

)

create table bronze.erp_loc_a101(
cid nvarchar(50),
cntry nvarchar(50)

)

create table bronze.erp_cust_az12(
cid nvarchar(50),
bdate date,
gen nvarchar(50)

)

Create table bronze.erp_px_cat_g1v2(
id nvarchar(50),
cat nvarchar(50),
subcat nvarchar (50),
maintenance nvarchar(50)

)
