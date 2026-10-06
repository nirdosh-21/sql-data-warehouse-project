--stored procedure for loading data in bronze schema
--truncates tables before loading data in bronze schema and use bulf insert to load data
--exec bronze.load_bronze

create or alter procedure bronze.load_bronze as
begin
begin try
declare @start_time datetime,@end_time datetime
set @start_time=GETDATE()
print'loading crm tables'
print'truncating table bronze.crm_cust_info'
    truncate table bronze.crm_cust_info
print'inserting data into bronze.crm_cust_info'
    bulk insert bronze.crm_cust_info
    from 'C:\Users\nirdo\Downloads\sql-ultimate-course-main\sql-ultimate-course-main\datawarehouse project\source_crm\cust_info.csv'
    with (
          firstrow=2,
          fieldterminator=',',
          tablock
          );
set @end_time=GETDATE()
print'load time:' +cast(datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
set @start_time=GETDATE()
print'truncating table bronze.crm_prd_info'
    truncate table bronze.crm_prd_info
print'inserting data into bronze.crm_prd_info'
    bulk insert bronze.crm_prd_info
    from 'C:\Users\nirdo\Downloads\sql-ultimate-course-main\sql-ultimate-course-main\datawarehouse project\source_crm\prd_info.csv'
    with (
          firstrow=2,
          fieldterminator=',',
          tablock
          );
set @end_time=GETDATE()
print'load time:' +cast(datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
set @start_time=GETDATE()
print'truncating table bronze.crm_sales_details'
    truncate table bronze.crm_sales_details
print'inserting data into bronze.crm_sales_details'
    bulk insert bronze.crm_sales_details
    from 'C:\Users\nirdo\Downloads\sql-ultimate-course-main\sql-ultimate-course-main\datawarehouse project\source_crm\sales_details.csv'
    with (
          firstrow=2,
          fieldterminator=',',
          tablock
          );
set @end_time=GETDATE()
print'load time:' +cast(datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
set @start_time=GETDATE()
print'loading erp tables'
    truncate table bronze.erp_cust_az12
    bulk insert bronze.erp_cust_az12
    from 'C:\Users\nirdo\Downloads\sql-ultimate-course-main\sql-ultimate-course-main\datawarehouse project\source_erp\CUST_AZ12.csv'
    with (
          firstrow=2,
          fieldterminator=',',
          tablock
          );
set @end_time=GETDATE()
print'load time:' +cast(datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
set @start_time=GETDATE()
    truncate table bronze.erp_loc_a101
    bulk insert bronze.erp_loc_a101
    from 'C:\Users\nirdo\Downloads\sql-ultimate-course-main\sql-ultimate-course-main\datawarehouse project\source_erp\LOC_A101.csv'
    with (
          firstrow=2,
          fieldterminator=',',
          tablock
          );
set @end_time=GETDATE()
print'load time:' +cast(datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
set @start_time=GETDATE()
    truncate table bronze.erp_px_cat_g1v2
    bulk insert bronze.erp_px_cat_g1v2
    from 'C:\Users\nirdo\Downloads\sql-ultimate-course-main\sql-ultimate-course-main\datawarehouse project\source_erp\PX_CAT_G1V2.csv'
    with (
          firstrow=2,
          fieldterminator=',',
          tablock
          );
set @end_time=GETDATE()
print'load time:' +cast(datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
          end try
          begin catch
          print'error occured during loading bronze stage'
          print'error message '+error_message();
          print'error message '+cast(error_number() as nvarchar)
          print'error message '+cast(error_state() as nvarchar)
          end catch

end
