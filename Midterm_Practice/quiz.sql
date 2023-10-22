-- QUIZ 2 
-- (1)
SELECT *
FROM t1,
    t2
where t1.id = t2.id;

SELECT *
FROM t1
    JOIN t2
WHERE t1.id = t2.id;

-- (2)
SELECT *
FROM t1
    NATURAL JOIN t2;

-- (3)
SELECT *
FROM t1
    LEFT JOIN t2 ON t1.id = t2.id;

-- (4)
SELECT *
FROM t1 NATURAL
    LEFT JOIN t2;

-- (5)
SELECT *
FROM t1
    RIGHT JOIN t2 ON t1.id = t2.id;

-- (6)
SELECT *
FROM t1 NATURAL
    RIGHT JOIN t2;

-- (7)
SELECT *
FROM t1
    LEFT JOIN t2 ON t1.id = t2.id
WHERE t1.id is not null;

-- (8)
SELECT *
FROM t1
    RIGHT JOIN t2 ON t1.id = t2.id
WHERE t1.id is not null;

-- (9)
(
    SELECT *
    FROM t1 NATURAL
        LEFT JOIN t2
)
UNION
(
    SELECT *
    FROM t1 NATURAL
        RIGHT JOIN t2
);