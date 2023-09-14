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
    employee AS e
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
    works_with AS w ON c.client_id = w.client_id AND e.emp_id = w.emp_id
WHERE
    c.client_name = 'FedEx'
    AND e.salary >= 60000;

SELECT 
    SUM(salary) AS "total_salary",
    MAX(salary) AS "max_salary",
    MIN(salary) AS "min_salary",
    AVG(salary) AS "avg_salary"
FROM 
    employee;

SELECT 
    COUNT(*) AS "total_employees"
FROM
    employee;

SELECT
    b.branch_name AS "Branch_name",
    COUNT(e.emp_id) AS "employees_in_branch"
FROM
    branch AS b
LEFT JOIN
    employee AS e ON b.branch_id = e.branch_id
GROUP BY
    b.branch_name;
