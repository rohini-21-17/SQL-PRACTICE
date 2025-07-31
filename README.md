# 📌 SQL Practice Project

This project is a **collection of SQL commands** to practice creating databases, tables, inserting data, and performing various SQL operations like **joins, group functions, subqueries, and string operations.**

---

## 📂 Database Details

### 🔹 Database Name
```sql
CREATE DATABASE practice;
USE practice;
```

---

### 🔹 Tables

#### 1️⃣ Employee
| Column Name    | Data Type     | Description                  |
|---------------|--------------|------------------------------|
| EMPLOYEE_ID   | INT (PK, AI)  | Unique employee ID           |
| FIRST_NAME    | VARCHAR(100)  | Employee's first name        |
| LAST_NAME     | VARCHAR(100)  | Employee's last name         |
| SALARY        | VARCHAR(100)  | Employee salary              |
| JOINING_DATE  | VARCHAR(100)  | Date of joining              |
| DEPARTMENT    | VARCHAR(100)  | Department name              |

#### 2️⃣ Incentives
| Column Name       | Data Type     | Description                            |
|------------------|--------------|----------------------------------------|
| EMPLOYEE_REF_ID  | INT (FK)      | References Employee(EMPLOYEE_ID)       |
| INCENTIVE_DATE   | VARCHAR(100)  | Date of incentive                     |
| INCENTIVE_AMOUNT | VARCHAR(100)  | Amount of incentive                   |

---

## 📌 Features Practiced

✅ Create & Drop **Database / Tables**  
✅ Insert Data into Tables  
✅ **SELECT Queries** – Filtering using `WHERE`, `IN`, `LIKE`, `BETWEEN`  
✅ **Sorting with ORDER BY**  
✅ **Aggregate Functions** – `SUM`, `AVG`, `COUNT`, `MAX`, `MIN`  
✅ **GROUP BY and HAVING**  
✅ **Joins** – `INNER JOIN`, `LEFT JOIN`  
✅ **String Functions** – `UPPER`, `LOWER`, `SUBSTRING`, `POSITION`, `REPLACE`, `LTRIM`, `RTRIM`, `LENGTH`, `CONCAT`  
✅ **Subqueries** (Max Incentive per Employee)  
✅ **Top-N Salaries & Nth Highest Salary**

---

## 📜 Steps to Run

### 1️⃣ Create Database & Use It
```sql
CREATE DATABASE practice;
USE practice;
```

### 2️⃣ Create Tables
```sql
CREATE TABLE Employee (
  EMPLOYEE_ID INT PRIMARY KEY AUTO_INCREMENT,
  FIRST_NAME VARCHAR(100),
  LAST_NAME VARCHAR(100),
  SALARY VARCHAR(100),
  JOINING_DATE VARCHAR(100),
  DEPARTMENT VARCHAR(100)
);

CREATE TABLE Incentives (
  EMPLOYEE_REF_ID INT,
  INCENTIVE_DATE VARCHAR(100),
  INCENTIVE_AMOUNT VARCHAR(100),
  FOREIGN KEY (EMPLOYEE_REF_ID) REFERENCES Employee(EMPLOYEE_ID)
);
```

### 3️⃣ Insert Sample Data
✅ Insert Employee records  
✅ Insert Incentive records  

*(Insert statements are already provided in the script.)*

---

## 📊 Example Queries

### 🔹 Basic Queries
```sql
SELECT * FROM Employee;  
SELECT FIRST_NAME, LAST_NAME FROM Employee;
```

### 🔹 String Functions
```sql
SELECT UPPER(FIRST_NAME) FROM Employee;
SELECT SUBSTRING(FIRST_NAME, 1, 3) FROM Employee;
```

### 🔹 Joins
```sql
SELECT e.FIRST_NAME, i.INCENTIVE_AMOUNT
FROM Employee e
INNER JOIN Incentives i
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;
```

### 🔹 Grouping
```sql
SELECT DEPARTMENT, SUM(SALARY)
FROM Employee
GROUP BY DEPARTMENT;
```

### 🔹 Subquery – Max Incentive
```sql
SELECT e.FIRST_NAME,
       (SELECT MAX(i.INCENTIVE_AMOUNT) 
        FROM Incentives i 
        WHERE i.EMPLOYEE_REF_ID = e.EMPLOYEE_ID)
FROM Employee e
WHERE e.EMPLOYEE_ID IN (SELECT EMPLOYEE_REF_ID FROM Incentives);
```

### 🔹 Top-N Salaries
```sql
SELECT SALARY FROM Employee ORDER BY SALARY DESC LIMIT 2;   -- Top 2 Salaries
SELECT SALARY FROM Employee ORDER BY SALARY DESC LIMIT 1 OFFSET 1; -- 2nd Highest Salary
```

---

## 📂 File Structure

| File Name     | Description |
|--------------|------------|
| `practice.sql` | Contains all table creation, insert, and query statements |
| `README.md`    | Documentation for the project |

---

## 📚 Concepts Covered

✅ **DDL** – `CREATE`, `DROP`  
✅ **DML** – `INSERT`  
✅ **DQL** – `SELECT`  
✅ **Joins** – `INNER`, `LEFT`  
✅ **Aggregate Functions**  
✅ **Subqueries**  
✅ **String & Date Functions**

---

### 🚀 How to Use

1️⃣ Open **MySQL CLI / Workbench / phpMyAdmin**  
2️⃣ Copy and paste the contents of `practice.sql`  
3️⃣ Execute queries to see results
