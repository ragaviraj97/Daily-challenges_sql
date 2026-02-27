# 📊 SQL – Stored Procedures, UDF & Subqueries (Company Database)

This project demonstrates advanced SQL concepts using a Company database.
It focuses on implementing business logic using functions, subqueries, and stored procedures.

---

## 🔹 Topics Covered
- User-Defined Function (UDF)
- Single-row Subquery
- Multi-row Subquery (IN)
- Stored Procedure
- CASE Statement
- Business Rule Implementation

---

## 1️⃣ User-Defined Function – GetBonus()

### 📌 Objective
Calculate 10% annual bonus from employee salary.

```sql
CREATE FUNCTION GetBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
RETURN salary * 0.10;

SELECT 
    EmpName, 
    Salary, 
    GetBonus(Salary) AS Annual_Bonus
FROM Employees;

---

2️⃣ Subquery – Employees Earning Above Average Salary
📌 Objective

Find employees whose salary is greater than the company’s average salary.
-- SQL --
SELECT 
    EmpName, 
    Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM Employees
);

3️⃣ Multi-row Subquery – Employees in Hyderabad & Pune
📌 Objective

Find employees working in departments located in Hyderabad or Pune.
--SQL --
SELECT 
    EmpName, 
    DeptID
FROM Employees
WHERE DeptID IN (
    SELECT d.DepartmentID
    FROM Departments d
    JOIN Locations l 
        ON d.LocationID = l.LocationID
    WHERE l.LocationName IN ('Hyderabad', 'Pune')
);

4️⃣ Stored Procedure – UpdateSalaryByPerformance()
📌 Salary Increment Policy

Rating 5 → 20% raise

Rating 4 → 10% raise

Rating 3 → 5% raise
-- SQL --
CREATE PROCEDURE UpdateSalaryByPerformance()
BEGIN
    UPDATE Employees
    SET Salary =
        CASE
            WHEN PerformanceRating = 5 THEN Salary * 1.20
            WHEN PerformanceRating = 4 THEN Salary * 1.10
            WHEN PerformanceRating = 3 THEN Salary * 1.05
            ELSE Salary
        END;
END;

CALL UpdateSalaryByPerformance();



🚀 Skills Demonstrated

SQL | Business Logic Implementation | HR Salary Analysis | Database Automation

👩‍💻 Ragavi R
Aspiring Data Analyst
