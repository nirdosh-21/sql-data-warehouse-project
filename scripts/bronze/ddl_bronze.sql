--creates all tables for loading data
create table bronze.crm_cust_info(
	cst_id int,
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar(50),
	cst_material_status nvarchar(50),
	cst_gndr nvarchar(50),
	cst_create_date DATE

);
go
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num    nVARCHAR(50),
    sls_prd_key    nVARCHAR(50),
    sls_cust_id    INT,
    sls_order_dt   INT,
    sls_ship_dt    INT,
    sls_due_dt     INT,
    sls_sales      INT,
    sls_quantity   INT,
    sls_price      INT
);
go

CREATE TABLE bronze.crm_prd_info (
    prd_id         INT,
    prd_key        nVARCHAR(50),
    prd_nm         nVARCHAR(50),
    prd_cost       INT,
    prd_line       nVARCHAR(50),
    prd_start_dt   DATETIME,
    prd_end_dt     DATETIME
);
go
create table bronze.erp_loc_a101(
cid nvarchar(50),
cntry nvarchar(50)
);
go
create table bronze.erp_cust_az12(
cid nvarchar(50),
bdate DATE,
gen nvarchar(50)
);
go
create table bronze.erp_px_cat_g1v2(
id nvarchar(50),
cat nvarchar(50),
subcat nvarchar(50),
maintenance nvarchar(50)
);
