IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Activity]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Activity] (
machine_id int,
process_id int,
activity_type VARCHAR(50),
timestamp float
)

INSERT INTO Activity VALUES 
(0,0,'start',0.712),
(0,0,'end'  ,1.520),
(0,1,'start',3.140),
(0,1,'end'  ,4.120),
(1,0,'start',0.550),
(1,0,'end'  ,1.550),
(1,1,'start',0.430),
(1,1,'end'  ,1.420),
(2,0,'start',4.100),
(2,0,'end'  ,4.512),
(2,1,'start',2.500),
(2,1,'end'  ,5.000)
END

SELECT a1.machine_id, ROUND((SUM(a2.timestamp)- SUM(a1.timestamp)) / COUNT(a2.process_id), 3) FROM Activity a1
INNER JOIN Activity a2 on a2.machine_id = a1.machine_id and a2.process_id = a1.process_id and a2.activity_type = 'end' and a1.activity_type = 'start'
GROUP BY a1.machine_id;