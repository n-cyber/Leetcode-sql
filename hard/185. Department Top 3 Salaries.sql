-- Write your PostgreSQL query statement below
WITH top_3_department_salaries AS (
SELECT 
  name
, departmentId
, salary
, DENSE_RANK() OVER (PARTITION BY departmentid ORDER BY salary DESC) AS top_salaries
FROM Employee
)
SELECT
  d.name AS Department 
, s.name AS Employee
, s.salary AS Salary
FROM top_3_department_salaries s INNER JOIN Department d
  ON s.departmentId = d.id 
  AND top_salaries <= 3


