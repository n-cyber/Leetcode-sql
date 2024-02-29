-- Write your PostgreSQL query statement below
-- SELECT
--   s.user_id 
-- , CAST(COUNT(CASE WHEN c.action = 'confirmed' THEN c.action ELSE NULL END)::float/COUNT(*) AS DECIMAL(10,2)) AS confirmation_rate
-- FROM Signups s
-- LEFT JOIN Confirmations c
-- ON s.user_id = c.user_id
-- GROUP BY 1

SELECT
  s.user_id 
, CAST(AVG( CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) AS DECIMAL(10,2)) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY 1
