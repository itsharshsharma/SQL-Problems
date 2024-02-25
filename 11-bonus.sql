IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[B_Employee]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[B_Employee] (
emp_id int,
name VARCHAR(50),
supervisor INT,
salary INT
)

INSERT INTO B_Employee VALUES 
(3,'Brad',null,4000),
(1,'John',3,1000),
(2,'Dan',3,2000),
(4,'Thomas',3,4000)

END

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Bonus]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Bonus] (
emp_id int,
bonus INT
)

INSERT INTO Bonus VALUES 
(2, 500),
(4, 2000)

END

SELECT B_Employee.name, Bonus.bonus FROM B_Employee
LEFT OUTER JOIN Bonus on Bonus.emp_id = B_Employee.emp_id
WHERE Bonus.bonus < 1000 OR Bonus.bonus is NULL;