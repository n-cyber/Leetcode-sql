SELECT 
  visited_on
, SUM(SUM(amount)) OVER ( ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount
, ROUND(AVG(SUM(amount))OVER ( ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount
FROM customer
GROUP BY 1
OFFSET 6
