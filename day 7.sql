USE employee;
-- DAY7 --
-- CTE --
-- The Finance team wants to view the top 3 highest-paid employees for recognition awards --
WITH TopSalaries AS (
    SELECT 
      employee_name,
        Salary,
        ROW_NUMBER() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM employees
)

SELECT 
    employee_name,
    Salary,
    SalaryRank
FROM TopSalaries
WHERE SalaryRank <= 3;

-- CTE (Average Salary per Department) --
-- Management wants to see the average salary for each department to analyze pay structure --

WITH DeptAvg AS (
    SELECT 
        department_id,
        round(AVG(salary),2) AS AvgSalary
    FROM employees
    GROUP BY department_id
)

SELECT 
    d.department_name AS DeptName,
    da.AvgSalary
FROM departments d
LEFT JOIN DeptAvg da
ON d.department_id = da.department_id;

-- SUBQUERY with Aggregate Comparison --
-- Find employees whose salaries are greater than any employee in the HR department. --
SELECT 
    employee_name AS EmpName,
    salary AS Salary
FROM employees
WHERE salary > ANY (
        SELECT salary
        FROM employees
        WHERE department_id = (
            SELECT department_id
            FROM departments
            WHERE department_name = 'HR'
        )
);

-- UDF + Stored Procedure Combined --
-- After giving salary hikes, HR wants to check each employee’s updated salary and their bonus (10%). --
SELECT 
    employee_name AS EmpName,
    salary AS Updated_Salary,
    GetBonus(salary) AS Annual_Bonus
FROM employees;   
   
-- CTE with Filter --
-- Finance wants to know which departments have an average salary above ₹65,000 --
WITH DeptAvg AS (
    SELECT 
        department_id,
        round(AVG(salary),2) AS AvgSalary
    FROM employees
    GROUP BY department_id
)

SELECT 
    d.department_name AS DeptName,
    da.AvgSalary
FROM departments d
JOIN DeptAvg da
ON d.department_id = da.department_id
WHERE da.AvgSalary > 65000;

-- NESTED SUBQUERY --
-- The director wants to find employees who have the highest salary in each department --
SELECT 
    e.employee_name AS EmpName,
    d.department_name AS DeptName,
    e.salary AS Salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary = (
        SELECT MAX(e2.salary)
        FROM employees e2
        WHERE e2.department_id = e.department_id
);
    



