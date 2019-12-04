-- Add order data

USE dw_cw_db
GO

-- Order header

-- 1
INSERT INTO Order_header VALUES
('ORD-99', CURRENT_TIMESTAMP ,'CM-1000')

SELECT * FROM Order_header

SELECT * FROM Product

-- order detail

-- 1
INSERT INTO Order_detail VALUES
('ORD-99', 2, 1300, 'POR-16')

SELECT * FROM Order_detail
