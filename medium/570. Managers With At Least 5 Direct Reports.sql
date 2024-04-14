WITH manager_5 AS(
  SELECT 
    m.id
  , m.name
  FROM Employee e
  INNER JOIN Employee m
  ON  e.managerId = m.id
  GROUP BY 1,2
  HAVING COUNT(DISTINCT e.id) >= 5
)
SELECT 
  a.name
FROM manager_5 a
