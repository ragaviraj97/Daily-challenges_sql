
-- 1CREATE DATABASE

CREATE DATABASE StudentsDB;
USE StudentsDB;

-- CREATE TABLES

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Duration VARCHAR(20)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- INSERT SAMPLE DATA

INSERT INTO Students VALUES
(1, 'Aarav', 21, 'Chennai'),
(2, 'Meera', 22, 'Bangalore'),
(3, 'Karthik', 23, 'Hyderabad'),
(4, 'Divya', 21, 'Delhi');

INSERT INTO Courses VALUES
(101, 'Data Analytics', '3 Months'),
(102, 'Python Programming', '2 Months'),
(103, 'SQL Basics', '1 Month');

INSERT INTO Enrollments VALUES
(1001, 1, 101, '2025-05-10'),
(1002, 2, 102, '2025-06-01'),
(1003, 3, 103, '2025-06-15');
select * from students;
select * from Courses;
select * from Enrollments;
-- 1.inner join --
SELECT  * FROM Students s
INNER JOIN Enrollments e 
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON c.CourseID = e.CourseID;
    
-- 2.LEFT AND RIGHT JOIN --
SELECT * FROM Students s
LEFT JOIN Enrollments e
 ON s.StudentID = e.StudentID
LEFT JOIN Courses c
  ON c.CourseID = e.CourseID;
  
  SELECT * FROM Students s
RIGHT JOIN Enrollments e
    ON s.StudentID = e.StudentID
RIGHT JOIN Courses c
    ON e.CourseID = c.CourseID;
    
-- – ROUND() --
SELECT ROUND(123.4567, 2) AS Rounded_Value;   

-- ABS() & MOD() --
SELECT ABS(-15) AS Absolute_Value,
    MOD(25, 4) AS Remainder;
    

-- CONCAT() --
USE StudentsDB;

SELECT CONCAT(StudentName, ' from ', City, '.') AS Full_Description FROM Students;

-- length() --

select StudentName,length(StudentName) as Name_Length from Students;
select * from Courses;

-- REPLACE --
select CourseName,REPLACE(CourseName,'SQL','Database')as updated_coursename from Courses;

-- SUBSTRING() --
select StudentName,substring(StudentName,1,3)as code_prefix from Students;

-- UPPER() & LOWER() --
select StudentName,upper(StudentName)as upper_studentname,lower(StudentName)as lower_studentname from Students;

-- DATE FUNCTIONS (NOW, DATEDIFF, DATE_ADD)--
select * from enrollments;

SELECT 
    StudentID,
    EnrollmentID,
    NOW() AS Current_DateTime,
    DATEDIFF('2025-06-01', '2025-05-10') AS Day_Difference,
    DATE_ADD(EnrollmentDate, INTERVAL 10 DAY) AS FollowUp_Date
FROM enrollments;




 
 
 