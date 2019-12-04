-- Adding data Customer and segment

USE [dw_cw_db]
GO

-- 1
INSERT INTO Customer VALUES
('CM-1000', 'Juan Carlos', '74A, texas, New Mexico', 'New Mexico', 'Texas', 'United States', 'SEG-1')

-- 2
INSERT INTO Customer VALUES
('CM-1001', 'Walter White', '3828 Piermont Dr NE Albuquerque, NM 87111', 'New Mexico', 'Albuquerque', 'United States', 'SEG-1')

-- 3
INSERT INTO Customer VALUES
('CM-1002', 'Princess Diana', 'New york', 'Central', 'Amazonia', 'United States', 'SEG-2')

-- 4
INSERT INTO Customer VALUES
('CM-1003', 'Bruce Wayne', '1007 Mountain Drive', 'Gotham city Central', 'Gotham', 'United States', 'SEG-1')

-- 5
INSERT INTO Customer VALUES
('CM-1004', 'Steven Rogers', '784 Los Angeles ', 'California', 'Downey', 'United States', 'SEG-1')

-- 6
INSERT INTO Customer VALUES
('CM-1005', 'Tchala', '56B, Nation of Wakanda', 'Wakanda', 'Wakanda', 'Africa', 'SEG-1')


-- Segments
INSERT INTO Customer_segment VALUES
('SEG-2', 'Female')

SELECT * FROM DIM_Customer