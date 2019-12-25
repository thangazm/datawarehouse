-- database
USE dw_cw_db
GO

-- create table sales
CREATE TABLE sales
(
	product nvarchar(20) NOT NULL,
	date bigint NOT NULL,
	sale bigint NOT NULL
)

-- insert into sales
INSERT INTO sales VALUES('prod1',2017, 10000000)
INSERT INTO sales VALUES('prod1',2017, 10000000)


-- create trigger for dynamic years of sales
CREATE TRIGGER trg_view
ON dbo.sales
AFTER  INSERT,UPDATE,DELETE
AS
BEGIN
    DECLARE @columns AS NVARCHAR(MAX),  @query  AS NVARCHAR(MAX)

    SELECT @columns = STUFF((SELECT ',' + QUOTENAME(Date) 
						FROM dbo.sales
						GROUP BY date
						ORDER BY date
						FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)'),1,1,'')
	IF OBJECT_ID('mv_view1') IS NULL
		BEGIN
			set @query = 'CREATE VIEW mv_view1 WITH SCHEMABINDING AS  SELECT product,' + @columns + ' FROM
						(
							SELECT product, date, sale
							FROM dbo.sales
						) a
						PIVOT 
						(
							SUM(sale)
							FOR date IN (' + @columns + ')
						) b '
		END
	ELSE
		BEGIN
			set @query = 'ALTER VIEW mv_view1 WITH SCHEMABINDING AS  SELECT product,' + @columns + ' FROM
						(
							SELECT product, date, sale
							FROM dbo.sales
						) a
						PIVOT 
						(
							SUM(sale)
							FOR date IN (' + @columns + ')
						) b '
		END
    EXECUTE(@query)
END
GO

-- select meterialized view
SELECT * FROM mv_view1

-- drop trigger
-- DROP TRIGGER trg_view

-- drop view
-- DROP view mv_view1