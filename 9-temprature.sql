IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Weather]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Weather] (
id int,
recordDate date,
temperature INT
)

INSERT INTO Weather VALUES 
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30)

END

SELECT w2.id FROM Weather w1
JOIN Weather w2 on w2.recordDate = DATEADD(DAY, 1, w1.recordDate) AND w2.temperature > w1.temperature;