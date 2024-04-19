-- Write your PostgreSQL query statement below
WITH employee_department_count AS
(
    SELECT 
      employee_id 
    , COUNT(department_id) AS cnt
    FROM Employee
    GROUP BY 1
)
SELECT
  e.employee_id
, e.department_id
FROM Employee e 
LEFT JOIN employee_department_count ec ON e.employee_id = ec.employee_id
WHERE ec.cnt = 1 OR e.primary_flag = 'Y'

