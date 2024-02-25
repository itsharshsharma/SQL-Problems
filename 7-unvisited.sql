IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Visits]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Visits](
visit_id int,
customer_id INT
)

INSERT INTO Visits VALUES 
(1,23),
(2,9),
(4,30),
(5,54),
(6,96),
(7,54),
(8,54)

END

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Transactions]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Transactions](
transaction_id int,
visit_id int,
amount INT
)

INSERT INTO Transactions VALUES 
(2,5, 310),
(3,5, 300),
(9,5, 200),
(12,1, 910),
(13,2, 970)

END

SELECT Visits.customer_id, COUNT(Visits.visit_id) as "count_no_trans"
FROM Transactions
RIGHT OUTER JOIN Visits on Transactions.visit_id = Visits.visit_id
WHERE Transactions.transaction_id is NULL GROUP BY Visits.customer_id;