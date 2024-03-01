WITH id_diff AS
(   
    SELECT
      id
    , visit_date
    , people
    , id - ROW_NUMBER() OVER (ORDER BY id) AS cons_id_greater_than_100
    FROM stadium
    WHERE people>=100 
)
SELECT 
  id
, visit_date
, people 
FROM
    (SELECT 
    i.id
    , i.visit_date
    , people
    , COUNT(cons_id_greater_than_100) OVER (PARTITION BY cons_id_greater_than_100) AS id_more_than_3_cons
    FROM id_diff i
    )a
WHERE id_more_than_3_cons>=3

