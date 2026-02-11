# DAY 1
# 🏥 Patients Database Management System (SQL CHALLENGES)

## 📌 Project Overview
This project demonstrates the creation and management of a simple **Patients Database** using MySQL.  
It covers essential SQL concepts including database creation, table creation, altering table structure, renaming tables, and inserting sample records.

---

## 🛠️ Features Implemented

- ✅ Create Database (`patients`)
- ✅ Create Table (`patient`)
- ✅ Add new column using `ALTER TABLE`
- ✅ Modify column constraints
- ✅ Rename table (`patient` → `patient_info`)
- ✅ Insert sample data
- ✅ Retrieve data using `SELECT`

---

## 🗄️ Database Schema

### 📋 Table: `patient_info`

| Column Name       | Data Type       | Description |
|------------------|----------------|-------------|
| patient_id      | INT (Primary Key) | Unique ID for each patient |
| patient_name    | VARCHAR(100) NOT NULL | Name of the patient |
| age             | INT | Age of the patient |
| gender          | CHAR(1) | Gender (M/F) |
| admission_date  | DATE | Date of hospital admission |
| doctor_assigned | VARCHAR(50) | Assigned doctor name |

---

## 💻 SQL Concepts Used

- DDL (Data Definition Language)
  - `CREATE DATABASE`
  - `CREATE TABLE`
  - `ALTER TABLE`
  - `RENAME TABLE`

- DML (Data Manipulation Language)
  - `INSERT INTO`
  - `SELECT`

---

## 🚀 How to Run the Project

1. Open MySQL Workbench / MySQL CLI
2. Copy the SQL script
3. Execute the script
4. Use:
   ```sql
   SELECT * FROM patient_info;
