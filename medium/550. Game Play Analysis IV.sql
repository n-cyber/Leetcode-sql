-- Write your PostgreSQL query statement below
WITH player_detail AS(
  SELECT 
    a.player_id
  , a.event_date
  , ROW_NUMBER() OVER (PARTITION BY a.player_id ORDER BY a.event_date) AS login_day
  , LAG(a.event_date) OVER (PARTITION BY a.player_id ORDER BY a.event_date) AS prev_login_date
  FROM Activity a
)
SELECT 
  ROUND(CAST(COUNT(DISTINCT CASE WHEN pd.login_day = 2 AND pd.event_date - pd.prev_login_date =1 THEN pd.player_id END) AS DECIMAL)/ CAST(COUNT(DISTINCT pd.player_id) AS DECIMAL),2) AS fraction
FROM player_detail pd
