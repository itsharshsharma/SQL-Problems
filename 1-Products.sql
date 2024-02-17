IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Products](
    product_id INT PRIMARY KEY,
    low_fats CHAR(1),
    recyclable CHAR(1)
)

INSERT INTO Products VALUES 
(0,'Y','N'),
(1,'Y','Y'),
(2,'N','Y'),
(3,'Y','Y'),
(4,'N','N')

END

SELECT product_id FROM Products where low_fats = 'Y' and recyclable = 'Y'