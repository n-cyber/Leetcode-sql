SELECT 
  sp.name
FROM orders o INNER JOIN company c 
    ON o.com_id = c.com_id AND c.name = 'RED'
RIGHT JOIN salesperson sp ON sp.sales_id = o.sales_id
WHERE o.sales_id IS NULL
