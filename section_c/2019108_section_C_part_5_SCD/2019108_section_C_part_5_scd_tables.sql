USE dw_cw_db
GO

-- tables
-- Table: DIM_Customer SCD 1
CREATE TABLE DIM_Customer_scd_1 (
    customer_id int  NOT NULL IDENTITY,
    customer_alt_id nvarchar(100)  NOT NULL,
    name nvarchar(100)  NOT NULL,
    address nvarchar(100)  NOT NULL,
    state nvarchar(50)  NOT NULL,
    city nvarchar(50)  NOT NULL,
    country nvarchar(50)  NOT NULL,
    segment_name nvarchar(50)  NOT NULL,
    CONSTRAINT DIM_Customer_pk_scd_1 PRIMARY KEY  (customer_id)
);

-- Table: DIM_Customer SCD 1
CREATE TABLE DIM_Customer_scd_2 (
    customer_id int  NOT NULL IDENTITY,
    customer_alt_id nvarchar(100)  NOT NULL,
    name nvarchar(100)  NOT NULL,
    address nvarchar(100)  NOT NULL,
    state nvarchar(50)  NOT NULL,
    city nvarchar(50)  NOT NULL,
    country nvarchar(50)  NOT NULL,
    segment_name nvarchar(50)  NOT NULL,
	startdate date NULL,
	enddate date NULL
    CONSTRAINT DIM_Customer_pk_scd_2 PRIMARY KEY  (customer_id)
);

-- Table: DIM_Customer SCD 3
CREATE TABLE DIM_Customer_scd_3 (
    customer_id int  NOT NULL IDENTITY,
    customer_alt_id nvarchar(100)  NOT NULL,
    name nvarchar(100)  NOT NULL,
    address nvarchar(100)  NOT NULL,
    state nvarchar(50)  NOT NULL,
    city nvarchar(50)  NOT NULL,
    country nvarchar(50)  NOT NULL,
    segment_name nvarchar(50)  NOT NULL,
	current_city  nvarchar(50) NULL
    CONSTRAINT DIM_Customer_pk_scd_3 PRIMARY KEY  (customer_id)
);

-- DROP Table DIM_Customer_scd_1
-- DROP Table DIM_Customer_scd_2
-- DROP Table DIM_Customer_scd_3

SELECT * FROM DIM_Customer_scd_1
SELECT * FROM DIM_Customer_scd_2
SELECT * FROM DIM_Customer_scd_3