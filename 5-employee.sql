IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Employees](
id int,
name VARCHAR(50)
)

INSERT INTO Employees VALUES 
(1,'Alice'),
(7,'Bob'),
(11,'Meir'),
(90,'Winston'),
(3,'Jonathon')

END

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeUNI]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[EmployeeUNI](
id int,
unique_id int
)

INSERT INTO EmployeeUNI VALUES 
(3,1),
(11,2),
(90,3)

END


SELECT EmployeeUNI.unique_id, Employees.name FROM Employees
LEFT OUTER JOIN EmployeeUNI on EmployeeUNI.id = Employees.id;