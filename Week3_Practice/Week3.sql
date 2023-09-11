SELECT 
    e.first_name AS "first_name",
    e.last_name AS "last_name",
    e.salary AS "salary",
    (e.salary * 1.10) AS "increased_salary"
FROM 
    employee AS e
JOIN
    branch AS b ON e.branch_id = b.branch_id
WHERE
    b.branch_name = 'Corporate';

SELECT
    e.first_name AS "first_name",
    e.last_name AS "last_name",
    e.salary AS "salary"
FROM
    employee As e
WHERE
    e.sex = 'M'
    AND e.salary BETWEEN 60000 AND 80000;

SELECT
    e.first_name AS "first_name",
    e.last_name AS "last_name",
    e.branch_id AS "branch_id",
    e.salary AS "salary"
FROM 
    employee AS e
JOIN
    branch AS b ON e.branch_id = b.branch_id
ORDER BY
    branch_id DESC,
    salary ASC;

SELECT
    e.first_name AS "first_name",
    e.last_name AS "last_name",
    w.total_sales AS "total_sales"
FROM 
    employee AS e
JOIN
    client AS c ON e.branch_id = c.branch_id
JOIN
    works_with AS w ON e.emp_id = w.emp_id AND c.client_id = w.client_id
WHERE
    c.client_name = 'FedEx'
    AND w.total_sales >= 60000;