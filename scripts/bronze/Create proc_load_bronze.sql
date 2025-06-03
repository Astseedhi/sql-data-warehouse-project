/*
==========================================================================================================================
Stored Pr0cedure: Load Bronze layer ( source -bronze) 
==========================================================================================================================
Script Purpose:
      This store Procedure loads data into the 'bronze' schema from external csv files.
      It Performs the following actions:
      - Truncates the bronze tables before loading data.
      - Uses 'Bulk insert' command to load data from csv files in to the bronze tables.

Parameters:
    None.
    This stored Procedure does not accept any parameter or return  any values
Usage Examples:
  EXEC Bronze.load_bronze;
==========================================================================================================================
*/


create or alter procedure bronze.load_bronze as 
begin
	declare @start_time datetime, @end_time datetime ,@batch_start_time datetime ,@batch_end_time datetime;
	begin try
		set @batch_start_time = GETDATE();
		print '===============================================================================================================================';
		print 'Loading the Bronze Layer';
		print '===============================================================================================================================';



		print '-------------------------------------------------------------------------------------------------------------------------------';
		print 'Loading CRM tables'
		print '-------------------------------------------------------------------------------------------------------------------------------';

		print '>> Truncating table :bronze.crm_cust_info '
		truncate table bronze.crm_cust_info;

		set @start_time = getdate();
		print '>> Inserting Data into: bronze.crm_cust_info '
		bulk insert  bronze.crm_cust_info from 'C:\Users\HP\Documents\Baraa SQL\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
		)
		set @end_time = getdate();
		print'>> load duration: '+  cast( datediff(second,@start_time,@end_time) as nvarchar)+ 'seconds'


		--select count(*) from bronze.crm_cust_info;
	
		print '>> Truncating table :bronze.crm_prd_info'
		truncate table bronze.crm_prd_info;

		set @start_time = getdate();
		print '>> Inserting Data into:bronze.crm_prd_info'
		bulk insert bronze.crm_prd_info from 'C:\Users\HP\Documents\Baraa SQL\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		)
		set @end_time = getdate();
		print'>> load duration: ' +  cast(datediff(second,@start_time,@end_time) as nvarchar) + ' seconds'
		--select count(*) from bronze.crm_prd_info

		print '>> Truncating table :[bronze].[crm_sales_details]'
		truncate table [bronze].[crm_sales_details];

		set @start_time = getdate();
		print '>> Inserting Data into:bronze.crm_prd_info'
		bulk insert [bronze].[crm_sales_details] from 'C:\Users\HP\Documents\Baraa SQL\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock

		)
		set @end_time = getdate();
		print'>> load duration: '+  cast( datediff(second,@start_time,@end_time) as nvarchar)+ 'seconds'
		--select COUNT(*) from [bronze].[crm_sales_details
	
		print '-------------------------------------------------------------------------------------------------------------------------------';
		print 'Loading ERP tables';
		print '-------------------------------------------------------------------------------------------------------------------------------';


		print '>> Truncating table :[bronze].[erp_cust_az12]'
		truncate table [bronze].[erp_cust_az12];

		set @start_time = getdate();
		print '>> Inserting Data into:[bronze].[erp_cust_az12]'
		bulk insert [bronze].[erp_cust_az12] from 'C:\Users\HP\Documents\Baraa SQL\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		)
		set @end_time = getdate();
		print'>> load duration: '+  cast( datediff(second,@start_time,@end_time)as nvarchar)+ 'seconds'


		--select COUNT(*) from [bronze].[erp_cust_az12]				--18483

		print '>> Truncating table :[bronze].[erp_loc_a101]'
		truncate table [bronze].[erp_loc_a101];

		set @start_time = getdate();
		print '>> Inserting Data into:[bronze].[erp_loc_a101]'
		bulk insert [bronze].[erp_loc_a101] from 'C:\Users\HP\Documents\Baraa SQL\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		with (
			firstrow  = 2,
			fieldterminator = ',',
			tablock

		)
		set @end_time = getdate();
		print'>> load duration: '+  cast( datediff(second,@start_time,@end_time)as nvarchar)+ 'seconds'


		--select COUNT(*) from [bronze].[erp_loc_a101]                --18484

		print '>> Truncating table : [bronze].[erp_px_cat_g1v2]'
		truncate table [bronze].[erp_px_cat_g1v2]

		set @start_time = getdate();
		print '>> Inserting Data into:[bronze].[erp_px_cat_g1v2]'
		bulk insert [bronze].[erp_px_cat_g1v2] from  'C:\Users\HP\Documents\Baraa SQL\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		)
		set @end_time = getdate();
		print'>> load duration: '+  cast( datediff(second,@start_time,@end_time)as nvarchar)+ 'seconds'

		set @batch_end_time = GETDATE();
		print'=================================================================='
		print'loading broze layer is completed'
		print'     - Total Load duration: ' + cast(datediff(second,@batch_start_time,@batch_end_time) as nvarchar) + 'seconds'
		print'=================================================================='
		end try
		

		begin catch
		print'==========================================================================================================='
		print'error occured during loading bronze layer	'
		print'error message'+ error_message();
		print'error message'+ cast(error_number() as nvarchar);
		print'error message'+ cast(error_state() as nvarchar);
		print'==========================================================================================================='
		end catch 
end	
	--select COUNT(*) from [bronze].[erp_px_cat_g1v2]				-- 37
