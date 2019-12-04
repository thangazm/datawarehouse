
USE dw_cw_db
GO

-- tables
-- Table: Customer
CREATE TABLE Customer (
    customer_id nvarchar(100)  NOT NULL,
    name nvarchar(100)  NOT NULL,
    address nvarchar(100)  NOT NULL,
    state nvarchar(50)  NOT NULL,
    city nvarchar(50)  NOT NULL,
    country nvarchar(50)  NOT NULL,
    segment_seg_id nvarchar(50)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY  (customer_id)
);

-- Table: Customer_segment
CREATE TABLE Customer_segment (
    seg_id nvarchar(50)  NOT NULL,
    segment_name nvarchar(50)  NOT NULL,
    CONSTRAINT Customer_segment_pk PRIMARY KEY  (seg_id)
);

-- Table: Order_detail
CREATE TABLE Order_detail (
    order_id nvarchar(100)  NOT NULL,
    quantity int  NOT NULL,
    unit_price float(20)  NOT NULL,
    product_id int  NOT NULL
);

-- Table: Order_header
CREATE TABLE Order_header (
    order_id nvarchar(100)  NOT NULL,
    date date  NOT NULL,
    customer_id nvarchar(100)  NOT NULL,
    CONSTRAINT Order_header_pk PRIMARY KEY  (order_id)
);

-- Table: Prod_cat
CREATE TABLE Prod_cat (
    prod_cat nvarchar(50)  NOT NULL,
    description nvarchar(100)  NOT NULL,
    CONSTRAINT Prod_cat_pk PRIMARY KEY  (prod_cat)
);

-- Table: Product
CREATE TABLE Product (
    product_id int  NOT NULL,
    description nvarchar(100)  NOT NULL,
    UOM int  NOT NULL,
    qty_in_hand int  NOT NULL,
    prod_type nvarchar(50)  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (product_id)
);

-- Table: Product_type
CREATE TABLE Product_type (
    prod_type nvarchar(50)  NOT NULL,
    description nvarchar(100)  NOT NULL,
    prod_cat nvarchar(50)  NOT NULL,
    CONSTRAINT Product_type_pk PRIMARY KEY  (prod_type)
);

-- foreign keys
-- Reference: Customer_customer_segment (table: Customer)
ALTER TABLE Customer ADD CONSTRAINT Customer_customer_segment
    FOREIGN KEY (segment_seg_id)
    REFERENCES Customer_segment (seg_id);

-- Reference: Order_detail_Order_header (table: Order_detail)
ALTER TABLE Order_detail ADD CONSTRAINT Order_detail_Order_header
    FOREIGN KEY (order_id)
    REFERENCES Order_header (order_id);

-- Reference: Order_detail_product (table: Order_detail)
ALTER TABLE Order_detail ADD CONSTRAINT Order_detail_product
    FOREIGN KEY (product_id)
    REFERENCES Product (product_id);

-- Reference: Order_header_Customer (table: Order_header)
ALTER TABLE Order_header ADD CONSTRAINT Order_header_Customer
    FOREIGN KEY (customer_id)
    REFERENCES Customer (customer_id);

-- Reference: Product_Product_type (table: Product)
ALTER TABLE Product ADD CONSTRAINT Product_Product_type
    FOREIGN KEY (prod_type)
    REFERENCES Product_type (prod_type);

-- Reference: Product_type_Prod_cat (table: Product_type)
ALTER TABLE Product_type ADD CONSTRAINT Product_type_Prod_cat
    FOREIGN KEY (prod_cat)
    REFERENCES Prod_cat (prod_cat);

