-- Write your PostgreSQL query statement below
WITH conditions AS (
    SELECT 
      tiv_2016
    , COUNT(*) OVER (PARTITION BY tiv_2015) AS count_tiv_2015
    , COUNT(*) OVER (PARTITION BY lat,lon) AS count_location
    FROM insurance
)

SELECT 
  ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM conditions
WHERE count_tiv_2015>1 AND count_location=1
