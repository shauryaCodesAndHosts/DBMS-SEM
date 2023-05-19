EXP 1 :- 


CREATE TABLE EMPLOYEE (
    Emp_no INT,
    E_name VARCHAR(50),
    E_address VARCHAR(100),
    E_ph_no VARCHAR(15),
    Dept_no INT,
    Dept_name VARCHAR(50),
    Job_id CHAR(10),
    Salary DECIMAL(10, 2)
);
DESCRIBE EMPLOYEE;
ALTER TABLE EMPLOYEE ADD HIREDATE DATE;
ALTER TABLE EMPLOYEE MODIFY JOB_ID VARCHAR2(10);
ALTER TABLE EMPLOYEE DROP COLUMN E_name;
ALTER TABLE EMPLOYEE MODIFY Job_id VARCHAR2(20);


EXP 2:-  

CREATE TABLE EMPLOYEE (
    Emp_no INT,
    E_name VARCHAR(50),
    E_address VARCHAR(100),
    E_ph_no VARCHAR(15),
    Dept_no INT,
    Dept_name VARCHAR(50),
    Job_id CHAR(10),
    Salary DECIMAL(10, 2)
);
INSERT INTO EMPLOYEE (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Salary)
VALUES
    (1, 'John Doe', '123 Main St', '123-456-7890', 10, 'Department 1', 'JOB001', 50000),
    (2, 'Jane Smith', '456 Elm St', '987-654-3210', 20, 'Department 2', 'JOB002', 60000),
    (3, 'Michael Johnson', '789 Oak St', '555-123-4567', 10, 'Department 1', 'JOB003', 55000),
    (4, 'Emily Davis', '321 Pine St', '111-222-3333', 30, 'Department 3', 'JOB004', 70000),
    (5, 'Robert Wilson', '654 Maple St', '444-555-6666', 20, 'Department 2', 'JOB005', 65000);
SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE WHERE Dept_name = 'Department 1';
UPDATE EMPLOYEE SET E_address = 'Nagpur' WHERE Emp_no = 12;
UPDATE EMPLOYEE SET E_ph_no = NULL WHERE E_name = 'James';
SELECT * FROM EMPLOYEE WHERE Dept_name = 'SALES';

EXP 3:-  

CREATE TABLE EMPLOYEE (
    Emp_No INT,
    E_Name VARCHAR(50),
    Job_Type VARCHAR(50),
    Salary DECIMAL(10, 2),
    Dept_Name VARCHAR(50),
    Age INT,
    DOB DATE
);
INSERT INTO EMPLOYEE (Emp_No, E_Name, Job_Type, Salary, Dept_Name, Age, DOB)
VALUES
    (1, 'John Doe', 'Manager', 50000, 'Sales', 30, '1990-01-01'),
    (2, 'Jane Smith', 'Engineer', 60000, 'IT', 35, '1985-05-10'),
    (3, 'Michael Johnson', 'Analyst', 55000, 'Finance', 28, '1993-07-15'),
    (4, 'Emily Davis', 'Technician', 70000, 'Operations', 32, '1989-03-25'),
    (5, 'Robert Wilson', 'Developer', 65000, 'IT', 29, '1992-09-05');
SELECT * FROM EMPLOYEE;
SELECT DISTINCT E_Name FROM EMPLOYEE;
SELECT * FROM EMPLOYEE WHERE Salary = 25000;
SELECT E_Name FROM EMPLOYEE ORDER BY E_Name ASC;


EXP 4:-  


CREATE TABLE EMPLOYEE (
    Emp_No INT,
    E_Name VARCHAR(50),
    Job_Type VARCHAR(50),
    Salary DECIMAL(10, 2),
    Dept_Name VARCHAR(50),
    Age INT,
    DOB DATE
);
INSERT INTO EMPLOYEE (Emp_No, E_Name, Job_Type, Salary, Dept_Name, Age, DOB)
VALUES
    (1, 'John Doe', 'Manager', 50000, 'Sales', 30, '1990-01-01'),
    (2, 'Jane Smith', 'Engineer', 60000, 'IT', 35, '1985-05-10'),
    (3, 'Michael Johnson', 'Analyst', 55000, 'Finance', 28, '1993-07-15'),
    (4, 'Emily Davis', 'Technician', 70000, 'Operations', 32, '1989-03-25'),
    (5, 'Robert Wilson', 'Developer', 65000, 'IT', 29, '1992-09-05');
SELECT E_Name, Emp_No, Salary FROM EMPLOYEE WHERE E_Name LIKE 'A%';
SELECT E_Name, Emp_No, Salary FROM EMPLOYEE WHERE E_Name LIKE '%a';
SELECT E_Name, Salary FROM EMPLOYEE WHERE Salary LIKE '200%';
SELECT E_Name, Salary FROM EMPLOYEE WHERE Salary LIKE '%200%';



EXP 5:-

CREATE TABLE Customers (
    c_id INT NOT NULL,
    c_name VARCHAR(50),
    address VARCHAR(100),
    CONSTRAINT PK_Customers PRIMARY KEY (c_id)
);
CREATE TABLE Order (
    o_id INT PRIMARY KEY,
    o_name VARCHAR(50) UNIQUE,
    city VARCHAR(50)
);

CREATE TABLE Department (
    d_id INT PRIMARY KEY CHECK (d_id > 0),
    d_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);
CREATE TABLE Employee (
    e_id INT PRIMARY KEY,
    e_name VARCHAR(50),
    city VARCHAR(50),
    d_id INT,
    CONSTRAINT FK_Employee_Department FOREIGN KEY (d_id) REFERENCES Department (d_id)
);
ALTER TABLE Employee ADD CONSTRAINT CHK_Employee_empno CHECK (empno > 100);










