SELECT 
  DISTINCT a.product_id
, p.product_name
FROM 
(
  SELECT DISTINCT s.product_id
  FROM sales s
  WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
)a
LEFT JOIN
(
  SELECT DISTINCT s.product_id
  FROM sales s
  WHERE s.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
)b
ON a.product_id = b.product_id
LEFT JOIN product p
ON a.product_id = p.product_id
WHERE b.product_id IS NULL
