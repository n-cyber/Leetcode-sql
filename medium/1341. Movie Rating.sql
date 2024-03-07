-- Write your PostgreSQL query statement below
WITH result AS (
    (SELECT 
    u.name AS results
    , COUNT(mv.user_id) AS val
    FROM movierating mv 
    INNER JOIN users u
    ON mv.user_id = u.user_id
    GROUP BY 1
    ORDER BY 2 DESC, 1 ASC
    LIMIT 1)
    UNION 
    (SELECT 
    m.title AS results
    , AVG(mv.rating) AS val
    FROM movierating mv 
    INNER JOIN movies m
    ON mv.movie_id = m.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY 1
    ORDER BY 2 DESC,1 ASC
    LIMIT 1)
)
SELECT results FROM result
