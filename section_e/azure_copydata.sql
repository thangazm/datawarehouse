-- create table source product_sales
CREATE TABLE product_sales
(
	product_cat nvarchar(20) NOT NULL,
	product_type nvarchar(20) NOT NULL,
	product nvarchar(20) NOT NULL,
	sale bigint NOT NULL
)

-- insert into product_sales
INSERT INTO product_sales VALUES('comics', 'books', 'marvel',250000)
INSERT INTO product_sales VALUES('comics', 'toys', 'marvel',250000)
INSERT INTO product_sales VALUES('comics', 'novels', 'DC',250000)
INSERT INTO product_sales VALUES('Toys', 'plastics', 'ninja',8500)
INSERT INTO product_sales VALUES('Toys', 'plastics', 'turtles',6000)
INSERT INTO product_sales VALUES('Toys', 'wood', 'star-wars',2000)

-- create destinantion table
CREATE TABLE dest_product_sales
(
	product_cat nvarchar(20) NOT NULL,
	product_type nvarchar(20) NOT NULL,
	product nvarchar(20) NOT NULL,
	sale bigint NOT NULL
)

SELECT * FROM dest_product_sales
