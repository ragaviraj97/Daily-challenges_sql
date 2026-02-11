CREATE DATABASE patients;
USE patients;

CREATE TABLE patient (
    patient_id INT,
    patient_name VARCHAR(30),
    age INT,
    gender CHAR(1),
    admission_date DATE
);

ALTER TABLE patient 
ADD COLUMN doctor_assigned varchar(50);
ALTER TABLE patient
MODIFY patient_name VARCHAR(100) NOT NULL;
RENAME TABLE patient to patient_info;
INSERT INTO patient_info (patient_id, patient_name, age, gender, admission_date,doctor_assigned)
VALUES
(1, 'karthik', 40, 'm', '2024-02-01','keerthi'),
(2, 'priya', 35, 'f', '2024-03-03','sudha'),
(3, 'arun', 25, 'm', '2026-01-03','shruthi');
select* from patient;
DELETE FROM patient where patient_id=1;
TRUNCATE TABLE patient;
select * from patient;
DROP TABLE patient;
select * from patient;











