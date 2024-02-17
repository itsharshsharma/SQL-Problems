IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Customer](
    id INT PRIMARY KEY,
    name VARCHAR(50),
    referee_id INT
)

INSERT INTO Customer VALUES 
(1,'Will',NULL),
(2,'Jane',NULL),
(3,'Alex',2),
(4,'Bill',NULL),
(5,'Zack',1),
(6,'Mark',2)

END

SELECT * FROM Customer
SELECT name FROM Customer where referee_id != 2 or referee_id is null;