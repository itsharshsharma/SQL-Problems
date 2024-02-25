IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[con_Users]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[con_Users] (
user_id int,
user_name VARCHAR(50)
)

INSERT INTO con_Users VALUES 
(6,'Alice'),
(2,'Bob'),
(7,'Alex')

END

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Register]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Register] (
contest_id int,
user_id INT
)

INSERT INTO Register VALUES 
(215,6),
(209,2),
(208,2),
(210,6),
(208,6),
(209,7),
(209,6),
(215,7),
(208,7),
(210,2),
(207,2),
(210,7)
END

SELECT contest_id,
ROUND(100* ((count(DISTINCT Register.user_id)*1.0) / COUNT(DISTINCT con_Users.user_id)),2) AS percentage
FROM con_Users, Register GROUP BY contest_id
ORDER BY percentage desc, contest_id asc;

/*
SELECT Register.contest_id,
ROUND(100* ((count(DISTINCT Register.user_id)*1.0) / COUNT(DISTINCT Users.user_id)),2) AS percentage
FROM Users, Register GROUP BY Register.contest_id
ORDER BY percentage desc, Register.contest_id asc;
*/

SELECT Register.contest_id, COUNT(DISTINCT Register.user_id), COUNT(DISTINCT con_Users.user_id)
FROM con_Users
CROSS JOIN Register
GROUP BY Register.contest_id
ORDER BY Register.contest_id asc;