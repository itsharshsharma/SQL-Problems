IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'SQLProblems')
BEGIN
	CREATE DATABASE [SQLProblems]


END
GO
	USE [SQLProblems]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Tweets]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[Tweets](
tweet_id int PRIMARY KEY,
content VARCHAR(100)
)

INSERT INTO Tweets VALUES 
(1,'Vote for Biden'),
(2, 'Let us make America great again!')

END

SELECT tweet_id FROM Tweets WHERE LEN(content) > 15;