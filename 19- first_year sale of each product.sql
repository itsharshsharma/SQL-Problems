IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Sales](
sale_id int,
product_id int,
year int,
quantity INT,
price INT
)

INSERT INTO Sales VALUES 
(1989,30,1853,14,8883),
(1990,24,2199,88,9614),
(1991,75,2049,24,7116),
(1992,5,2010,84,2819),
(1993,58,1943,39,8057),
(1994,76,1830,84,7682),
(1995,4,1964,81,7138),
(1996,28,1931,71,1749),
(1997,10,2048,93,5022),
(1998,25,2189,10,1170),
(1999,35,2155,9,1167),
(2000,10,1837,44,8974)

END

SELECT product_id,year AS first_year,quantity,price FROM
(SELECT RANK() OVER(PARTITION BY product_id ORDER BY year) AS nrow,
product_id, year, quantity, price
FROM Sales) S
WHERE S.nrow = 1;