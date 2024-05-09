-- Write your PostgreSQL query statement below
SELECT 
  id
, CASE 
   WHEN p_id IS NULL THEN 'Root'
   WHEN Id IN (SELECT DISTINCT p_id FROM Tree) THEN 'Inner'
   ELSE 'Leaf'
  END AS type
FROM Tree
ORDER BY id
