-- Write your PostgreSQL query statement below
SELECT
  m.employee_id
, m.name 
, COUNT(e.employee_id) AS reports_count
, ROUND(AVG(e.age)) AS average_age
FROM employees e INNER JOIN employees m
ON e.reports_to = m.employee_id
GROUP BY 1,2
ORDER BY 1 
