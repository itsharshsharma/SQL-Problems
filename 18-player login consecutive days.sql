--Table: Activity

--+--------------+---------+
--| Column Name  | Type    |
--+--------------+---------+
--| player_id    | int     |
--| device_id    | int     |
--| event_date   | date    |
--| games_played | int     |
--+--------------+---------+
--(player_id, event_date) is the primary key (combination of columns with unique values) of this table.
--This table shows the activity of players of some games.
--Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out
--on someday using some device.

 

--Write a solution to report the fraction of players that logged in again on the day after the day they
--first logged in, rounded to 2 decimal places. In other words, you need to count the number of players
--that logged in for at least two consecutive days starting from their first login date, then divide that
--number by the total number of players.

SELECT 
ROUND((SUM(
    CASE WHEN DATEDIFF(B.event_date, A.event_date) = 1 AND A.nrow = 1 AND B.nrow = 2 THEN 1
    ELSE 0 END
) / COUNT(DISTINCT A.player_id)),2) AS fraction
FROM
(select ROW_NUMBER() OVER(PARTITION BY player_id order by event_date) AS nrow,
player_id, event_date
from Activity
order by player_id, event_date) A
INNER JOIN 
(select ROW_NUMBER() OVER(PARTITION BY player_id order by event_date) AS nrow,
player_id, event_date
from Activity
order by player_id, event_date) B on B.player_id = A.player_id;