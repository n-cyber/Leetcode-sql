-- Write your PostgreSQL query statement below
-- Rank() won't help because if there is no 2nd max salary, Null has to be returned
SELECT 
  MAX(e.salary) AS SecondHighestSalary
FROM employee e 
WHERE salary != (SELECT MAX(salary) FROM employee)
