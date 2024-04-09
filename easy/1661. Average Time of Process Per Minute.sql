-- Write your PostgreSQL query statement below
WITH machine_process_time AS 
(
    SELECT 
    machine_id
    , process_id
    , activity_type
    , timestamp - LAG(timestamp) OVER (PARTITION BY machine_id, process_id ORDER BY activity_type DESC) AS activity_time
    FROM activity
)

SELECT 
  machine_id
, ROUND(AVG(activity_time)::numeric,3) AS processing_time
FROM machine_process_time
GROUP BY 1
