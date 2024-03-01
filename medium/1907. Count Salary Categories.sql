-- Write your PostgreSQL query statement below
WITH categories AS
(
    SELECT 'Low Salary' AS cat 
    UNION
    SELECT 'Average Salary' AS cat
    UNION
    SELECT 'High Salary' AS cat

)
, salary_categories AS
(
    SELECT
    CASE WHEN income < 20000 THEN 'Low Salary' WHEN income >=20000 AND income<=50000 THEN 'Average Salary' ELSE 'High Salary' END AS category
    FROM accounts
)
SELECT 
  c.cat AS category
, COUNT(sc.category) AS accounts_count
FROM categories c LEFT JOIN salary_categories sc
ON c.cat = sc.category
GROUP BY 1
