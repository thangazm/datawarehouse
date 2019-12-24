-- database
USE dw_cw_db
GO

-- create table product_sales
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

-- select all
SELECT * FROM product_sales

-- RollUP
SELECT product_cat, product_type, product, SUM(sale) AS total_sales
FROM product_sales
GROUP BY ROLLUP(product_cat, product_type, product)

-- CUBE
SELECT product_cat, product_type, product, SUM(sale) AS total_sales
FROM product_sales
GROUP BY CUBE(product_cat, product_type, product)