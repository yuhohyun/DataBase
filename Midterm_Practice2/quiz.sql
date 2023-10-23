-- Q0
SELECT BDATE,
    ADDRESS
FROM EMPLOYEE
WHERE FNAME = 'John'
    AND MINIT = 'B'
    AND LNAME = 'Smith';

-- Q1
SELECT FNAME,
    LNAME,
    ADDRESS
FROM EMPLOYEE,
    DEPARTMENT
WHERE DNAME = 'Research'
    AND Dnumber = Dno;

-- Q1C
SELECT *
FROM EMPLOYEE
WHERE Dno = 5;

-- Q1D
SELECT *
FROM EMPLOYEE,
    DEPARTMENT
WHERE DNAME = 'Research'
    AND DNO = Dnumber;

-- Q2
SELECT Pnumber,
    Dnum,
    Lname,
    Address,
    BDATE
FROM PROJECT,
    DEPARTMENT,
    EMPLOYEE
WHERE DNum = Dnumber
    AND Mgr_ssn = Ssn
    AND Plocation = 'Stafford';

-- Q2A
SELECT Pnumber,
    Dnum,
    Lname,
    Address,
    BDATE
FROM (
        (
            PROJECT
            JOIN DEPARTMENT ON Dnum = Dnumber
        )
        JOIN EMPLOYEE ON Mgr_ssn = Ssn
    )
WHERE Plocation = 'Stafford';

-- Q3A
SELECT Fname,
    LNAME
FROM EMPLOYEE
WHERE NOT EXISTS (
        (
            SELECT Pnumber
            FROM PROJECT
            WHERE DNO = 5
        )
        EXCEPT(
                SELECT PNO
                FROM WORKS_ON
                WHERE SSN = ESSN
            )
    );

-- Q3B
SELECT FNAME,
    LNAME
FROM EMPLOYEE
WHERE NOT EXISTS(
        SELECT *
        FROM WORKS_ON AS B
        WHERE (
                B.PNO IN (
                    SELECT PNUMBER
                    FROM PROJECT
                    WHERE DNUM = 5
                )
                AND NOT EXISTS (
                    SELECT *
                    FROM WORKS_ON AS C
                    WHERE C.ESSN = SSN
                        AND C.PNO = B.PNO
                )
            )
    );

-- Q4A
(
    SELECT DISTINCT Pnumber
    FROM PROJECT,
        DEPARTMENT,
        EMPLOYEE
    WHERE DNum = Dnumber
        AND Mgr_ssn = Ssn
        AND LNAME = 'Smith'
)
UNION
(
    SELECT DISTINCT Pnumber
    FROM PROJECT,
        WORKS_ON,
        EMPLOYEE
    WHERE Pnumber = PNO
        AND ESSN = SSN
        AND LNAME = 'Smith'
);

-- Q5
SELECT LNAME,
    FNAME
FROM EMPLOYEE
WHERE (
        SELECT COUNT(*)
        FROM DEPENDENT
        WHERE SSN = ESSN
    ) >= 2;

-- Q7
SELECT FNAME,
    LNAME
FROM EMPLOYEE
WHERE EXISTS(
        SELECT *
        FROM DEPENDENT
        WHERE SSN = ESSN
    )
    AND EXISTS(
        SELECT *
        FROM DEPARTMENT
        WHERE SSN = MGR_SSN
    );

-- Q8
SELECT E.FNAME,
    E.LNAME,
    S.FNAME,
    S.LNAME
FROM EMPLOYEE E,
    EMPLOYEE S
WHERE E.Super_ssn = S.Ssn;

-- Q8A
SELECT E.LNAME AS EMPLOYEE_NAME,
    S.LNAME AS Supervisor_Name
FROM EMPLOYEE AS E,
    EMPLOYEE AS S
WHERE E.SUPER_SSN = S.SSN;

-- Q8B
SELECT E.Lname AS Employee_Name,
    S.Lname As Supervisor_Name
FROM Employee AS E
    LEFT OUTER JOIN EMPLOYEE AS S ON E.Super_ssn = S.Ssn;

-- Q9
SELECT SSN
FROM EMPLOYEE;

-- Q10
SELECT SSN,
    DNAME
FROM EMPLOYEE,
    DEPARTMENT;

-- Q10A
SELECT *
FROM EMPLOYEE,
    DEPARTMENT;

-- Q11
SELECT ALL SALARY
FROM EMPLOYEE;

-- Q11A
SELECT DISTINCT SALARY
FROM EMPLOYEE;

-- Q12
SELECT FNAME,
    LNAME
FROM EMPLOYEE
WHERE ADDRESS LIKE '%Houston, TX%';

-- Q12A
SELECT FNAME,
    LNAME
FROM EMPLOYEE
WHERE BDATE LIKE '__5________';

-- Q13
SELECT E.FNAME,
    E.LNAME,
    1.1 * E.SALARY AS INCREASED_SAL
FROM EMPLOYEE AS E,
    WORKS_ON AS W,
    PROJECT AS P
WHERE E.SSN = W.ESSN
    AND W.PNO = P.Pnumber
    AND P.PNAME = 'ProductX';

-- Q14
SELECT *
FROM EMPLOYEE
WHERE (
        SALARY BETWEEN 30000 AND 40000
    )
    AND DNO = 5;

-- Q15
SELECT DNAME,
    LNAME,
    FNAME,
    PNAME
FROM DEPARTMENT,
    EMPLOYEE,
    WORKS_ON,
    PROJECT
WHERE DNUMBER = DNO
    AND SSN = ESSN
    AND PNO = Pnumber
ORDER BY DNAME,
    LNAME,
    FNAME;

-- Q17
SELECT DISTINCT ESSN
FROM WORKS_ON
WHERE PNO IN (1, 2, 3);

-- Q19
SELECT SUM(SALARY),
    MAX(SALARY),
    MIN(SALARY),
    AVG(SALARY)
FROM EMPLOYEE;

-- Q20A
SELECT SUM(SALARY),
    MAX(SALARY),
    MIN(SALARY),
    AVG(SALARY)
FROM EMPLOYEE,
    DEPARTMENT
WHERE DNO = DNUMBER
    AND DNAME = 'Research';

-- Q20B
SELECT SUM(SALARY),
    MAX(SALARY),
    MIN(SALARY),
    AVG(SALARY)
FROM (
        EMPLOYEE
        JOIN DEPARTMENT ON DNO = DNUMBER
    )
WHERE DNAME = 'Research';

-- Q21
SELECT COUNT(*)
FROM EMPLOYEE;

-- Q22
SELECT COUNT(*)
FROM EMPLOYEE,
    DEPARTMENT
WHERE DNO = DNUMBER
    AND DNAME = 'Research';

-- Q23
SELECT COUNT(DISTINCT SALARY)
FROM EMPLOYEE;

-- Q24
SELECT DNO,
    COUNT(*),
    AVG(SALARY)
FROM EMPLOYEE
GROUP BY DNO;

-- Q25
SELECT PNUMBER,
    PNAME,
    COUNT(*)
FROM PROJECT,
    WORKS_ON
WHERE PNUMBER = PNO
GROUP BY PNUMBER,
    PNAME;

-- Q26
SELECT PNUMBER,
    PNAME,
    COUNT(*)
FROM PROJECT,
    WORKS_ON
WHERE PNUMBER = PNO
GROUP BY PNUMBER,
    PNAME
HAVING COUNT(*) >= 3;

-- Q27
SELECT DNUMBER,
    COUNT(*)
FROM DEPARTMENT,
    EMPLOYEE
WHERE DNUMBER = DNO
    AND SALARY > 40000
    AND DNO IN(
        SELECT Dno
        FROM EMPLOYEE
        GROUP BY DNO
        HAVING COUNT(*) > 5
    )
GROUP BY DNUMBER;

-- Q28
SELECT PNUMBER,
    PNAME,
    COUNT(*)
FROM PROJECT,
    WORKS_ON,
    EMPLOYEE
WHERE PNUMBER = PNO
    AND SSN = ESSN
    AND DNO = 5
GROUP BY PNUMBER,
    PNAME;

-- JOIN 연산(NATURAL JOIN)
SELECT *
FROM EMPLOYEE
    NATURAL JOIN DEPT_LOCATIONS;

-- 
SELECT *
FROM EMPLOYEE,
    DEPARTMENT;

--
SELECT *
FROM EMPLOYEE,
    DEPARTMENT
WHERE Dnumber = Dno;

--
SELECT *
FROM EMPLOYEE
    INNER JOIN DEPARTMENT ON employee.dno = department.Dnumber;
