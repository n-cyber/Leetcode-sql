-- Write your PostgreSQL query statement below
SELECT 
  class 
FROM Courses
GROUP BY 1
HAVING COUNT(student)>=5
