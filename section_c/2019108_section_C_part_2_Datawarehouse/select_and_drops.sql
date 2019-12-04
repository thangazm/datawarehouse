USE dw_cw_db
GO


SELECT * FROM Product
SELECT * FROM Product_type
SELECT * FROM Prod_cat

SELECT * FROM Order_header
SELECT * FROM Order_detail

SELECT * FROM Customer
SELECT * FROM Customer_segment


-- DROP Tables


DROP Table Customer
DROP Table Customer_segment

DROP Table Product
DROP Table Product_type
DROP Table Prod_cat

DROP Table Order_header
DROP Table Order_detail

DROP Table Fact_Sales
DROP Table DIM_Customer
DROP Table DIM_Date
DROP Table DIM_Product



