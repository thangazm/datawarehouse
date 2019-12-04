-- Add product data

USE dw_cw_db
GO

-- prod category

-- 1
INSERT INTO Prod_cat VALUES
('Barbie', 'All types of barbie dolls')

-- 2
INSERT INTO Prod_cat VALUES
('Marvel', 'All superheroes toys from marvel universe')

-- 3
INSERT INTO Prod_cat VALUES
('DC', 'All superheroes toys from DC universe')

SELECT * FROM Prod_cat

-- prod type

-- 1
INSERT INTO Product_type VALUES
('Pink', 'Pink types of barbies', 'Barbie')
-- 2
INSERT INTO Product_type VALUES
('Yello Texture', 'Yello Texture types of barbies', 'Barbie')
-- 3
INSERT INTO Product_type VALUES
('Batman', 'Gotham city Guardian', 'DC')
-- 4
INSERT INTO Product_type VALUES
('Flash', 'Lightning', 'DC')
-- 5
INSERT INTO Product_type VALUES
('Wonder Women', 'Hero from Amazonia', 'DC')
-- 6
INSERT INTO Product_type VALUES
('AquaMan', 'Guardian of the sea', 'DC')
-- 7
INSERT INTO Product_type VALUES
('Captain America', 'The captain', 'Marvel')
-- 8
INSERT INTO Product_type VALUES
('Black Panther', 'King of Wakanda', 'Marvel')
-- 9
INSERT INTO Product_type VALUES
('Iron Man', 'Man with metal heart', 'Marvel')

SELECT * FROM Product_type

-- product

--1
INSERT INTO Product VALUES
('POR-10', 'Captain America shield', 50, 100, 'Captain America')

--2
INSERT INTO Product VALUES
('POR-11', 'Captain America Helmat', 50, 23, 'Captain America')

-- 3
INSERT INTO Product VALUES
('POR-14', 'Iron man mask', 75, 130, 'Iron Man')

-- 4
INSERT INTO Product VALUES
('POR-16', 'Vibraniam suit', 25, 80, 'Black Panther')

SELECT * FROM Product