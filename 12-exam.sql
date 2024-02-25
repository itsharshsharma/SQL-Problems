IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Students] (
student_id int,
student_name VARCHAR(50)
)

INSERT INTO Students VALUES 
(1,'Alice'),
(2,'Bob'),
(13,'John'),
(6,'Alex')

END

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Subjects]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Subjects] (
subject_name VARCHAR(50)
)

INSERT INTO Subjects VALUES 
('Math'),('Physics'),('Programming')

END

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Examinations]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Examinations] (
student_id INT,
subject_name VARCHAR(50)
)

INSERT INTO Examinations VALUES 
(1,'Math'),
(1,'Physics'),
(1,'Programming'),
(2,'Programming'),
(1,'Physics'),
(1,'Math'),
(13,'Math'),
(13,'Programming'),
(13,'Physics'),
(2,'Math'),
(1,'Math')

END

Select A.*, COUNT(Examinations.subject_name) AS 'attended_exams' from Examinations
RIGHT JOIN 
(SELECT *
FROM Students
CROSS JOIN Subjects
GROUP BY Students.student_id, Students.student_name, Subjects.subject_name)
A on A.student_id = Examinations.student_id AND A.subject_name = Examinations.subject_name
GROUP BY A.student_id, A.student_name, A.subject_name;