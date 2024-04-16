-- Write your PostgreSQL query statement below
SELECT 
  u.user_id AS buyer_id
, u.join_date
, COUNT(CASE WHEN to_char(o.order_date, 'YYYY') = '2019' THEN o.order_id ELSE NULL END) AS orders_in_2019
FROM Users u LEFT JOIN Orders o
  ON u.user_id = o.buyer_id
GROUP BY 1,2

