-- Write your PostgreSQL query statement below
WITH employee_department_count AS
( 
SELECT
  employee_id
, COUNT(department_id) AS department_count
FROM employee
GROUP BY 1
)
SELECT 
  e.employee_id
, e.department_id
FROM employee e INNER JOIN employee_department_count edc
ON e.employee_id = edc.employee_id
WHERE edc.department_count =1 OR e.primary_flag = 'Y'
