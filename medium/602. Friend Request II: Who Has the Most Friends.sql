WITH CTE AS(
    SELECT
      requester_id AS id
    , COUNT(requester_id) AS num
    FROM requestaccepted
    GROUP BY 1
    UNION ALL
    SELECT
      accepter_id AS id
    , COUNT(accepter_id) AS num 
    FROM requestaccepted
    GROUP BY 1
)

SELECT 
  id
, SUM(num) AS num
FROM CTE
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
