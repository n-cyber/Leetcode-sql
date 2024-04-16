SELECT 
  to_char(t.trans_date, 'YYYY-MM') AS month
, t.country
, COUNT(t.id) AS trans_count
, COUNT(CASE WHEN t.state = 'approved' THEN t.id ELSE NULL END) AS approved_count
, SUM(t.amount) AS trans_total_amount
, SUM(CASE WHEN t.state = 'approved' THEN t.amount ELSE 0 END) AS approved_total_amount
FROM transactions t
GROUP BY 1,2
