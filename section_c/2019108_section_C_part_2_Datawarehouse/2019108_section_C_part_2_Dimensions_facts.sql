USE dw_cw_db
GO

-- tables
-- Table: DIM_Customer
CREATE TABLE DIM_Customer (
    customer_id int  NOT NULL IDENTITY,
    customer_alt_id nvarchar(100)  NOT NULL,
    name nvarchar(100)  NOT NULL,
    address nvarchar(100)  NOT NULL,
    state nvarchar(50)  NOT NULL,
    city nvarchar(50)  NOT NULL,
    country nvarchar(50)  NOT NULL,
    segment_name nvarchar(50)  NOT NULL,
    CONSTRAINT DIM_Customer_pk PRIMARY KEY  (customer_id)
);

-- Table: DIM_Date
CREATE TABLE DIM_Date (
    date_key int  NOT NULL IDENTITY,
    date date  NOT NULL,
    CONSTRAINT DIM_Date_pk PRIMARY KEY  (date_key)
);

-- Table: DIM_Product
CREATE TABLE DIM_Product (
    product_id int  NOT NULL IDENTITY,
    product_alt_id int  NOT NULL,
    description nvarchar(100)  NOT NULL,
    UOM float(20)  NOT NULL,
    qty_in_hand int  NOT NULL,
    product_type nvarchar(50)  NOT NULL,
	product_type_desc nvarchar(100)  NOT NULL,
    product_category nvarchar(50)  NOT NULL,
	product_category_desc nvarchar(100)  NOT NULL,
    CONSTRAINT DIM_Product_pk PRIMARY KEY  (product_id)
);

-- Table: Fact_Sales
CREATE TABLE Fact_Sales (
    transaction_id int  NOT NULL IDENTITY,
    product_id int  NOT NULL,
    customer_id int  NOT NULL,
    date_key int  NOT NULL,
    available_qty int  NOT NULL,
    sales_amount float(20)  NOT NULL,
    CONSTRAINT Fact_Sales_pk PRIMARY KEY  (transaction_id)
);

-- foreign keys
-- Reference: Fact_Sales_DIM_Customer (table: Fact_Sales)
ALTER TABLE Fact_Sales ADD CONSTRAINT Fact_Sales_DIM_Customer
    FOREIGN KEY (customer_id)
    REFERENCES DIM_Customer (customer_id);

-- Reference: Fact_Sales_DIM_Date (table: Fact_Sales)
ALTER TABLE Fact_Sales ADD CONSTRAINT Fact_Sales_DIM_Date
    FOREIGN KEY (date_key)
    REFERENCES DIM_Date (date_key);

-- Reference: Fact_Sales_DIM_Product (table: Fact_Sales)
ALTER TABLE Fact_Sales ADD CONSTRAINT Fact_Sales_DIM_Product
    FOREIGN KEY (product_id)
    REFERENCES DIM_Product (product_id);


