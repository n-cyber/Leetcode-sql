-- Write your PostgreSQL query statement below
WITH product_first_purchase AS(
SELECT 
  product_id
, MIN(year) AS first_purchase_year
FROM Sales 
GROUP BY 1
)
SELECT
  s.product_id
, year AS first_year
, quantity
, price
FROM Sales s 
INNER JOIN product_first_purchase fpc
ON s.product_id = fpc.product_id AND s.year = fpc.first_purchase_year
