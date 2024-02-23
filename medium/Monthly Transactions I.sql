-- Write your PostgreSQL query statement below
SELECT
  r.contest_id
, ROUND((COUNT(r.user_id)*100.00)/(SELECT COUNT(user_id) FROM users),2) AS percentage
FROM  register r 
GROUP BY 1
ORDER BY 2 DESC, 1 ASC
