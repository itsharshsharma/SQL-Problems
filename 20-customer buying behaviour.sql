IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[p_Customer]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[p_Customer](
customer_id int,
product_id int,
)

INSERT INTO p_Customer VALUES 
(1,5),
(2,6),
(3,5),
(3,6),
(1,6)

END

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[p_product]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[p_product](
product_id int
)

INSERT INTO p_product VALUES 
(5),
(6)

END

select p_Customer.customer_id
from p_Customer, p_product
GROUP BY p_Customer.customer_id
HAVING COUNT(DISTINCT p_Customer.product_id) = COUNT(DISTINCT p_product.product_id);