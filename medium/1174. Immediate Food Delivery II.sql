-- Write your PostgreSQL query statement below
WITH customer_first_purchase AS
(
    SELECT 
    customer_id 
    , MIN(order_date) AS first_purchase_date
    FROM delivery 
    GROUP BY 1
)
SELECT 
  ROUND(SUM(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END)*100.00/COUNT(d.customer_id),2) AS immediate_percentage
FROM delivery d 
INNER JOIN customer_first_purchase c
ON d.customer_id = c.customer_id
AND d.order_date = c.first_purchase_date

