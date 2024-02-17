IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Views]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Views](
article_id int,
author_id int,
viewer_id int,
view_date date
)

INSERT INTO Views VALUES 
(1,3,5,'2019-08-01'),
(1,3,6,'2019-08-02'),
(2,7,7,'2019-08-01'),
(2,7,6,'2019-08-02'),
(4,7,1,'2019-07-22'),
(3,4,4,'2019-07-21'),
(3,4,4,'2019-08-01')

END

SELECT DISTINCT author_id as "id" FROM Views WHERE author_id = viewer_id ORDER BY author_id asc;