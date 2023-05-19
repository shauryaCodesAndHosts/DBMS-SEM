DECLARE
   x NUMBER := 10;
BEGIN
   -- Conditional statement (IF-THEN-ELSE)
   IF x > 0 THEN
      DBMS_OUTPUT.PUT_LINE('x is positive');
   ELSIF x < 0 THEN
      DBMS_OUTPUT.PUT_LINE('x is negative');
   ELSE
      DBMS_OUTPUT.PUT_LINE('x is zero');
   END IF;

   -- Iterative statement (FOR LOOP)
   FOR i IN 1..5 LOOP
      DBMS_OUTPUT.PUT_LINE('Iteration: ' || i);
   END LOOP;
END;
/

CREATE VIEW EmployeesView AS
SELECT employee_id, first_name, last_name, department_id
FROM employees;

-- Example of set operators
SELECT first_name FROM EmployeesView
WHERE department_id = 10
UNION
SELECT first_name FROM EmployeesView
WHERE department_id = 20;

SELECT first_name FROM EmployeesView
WHERE department_id = 10
INTERSECT
SELECT first_name FROM EmployeesView
WHERE department_id = 30;

SELECT first_name FROM EmployeesView
WHERE department_id = 10
MINUS
SELECT first_name FROM EmployeesView
WHERE department_id = 20;





exp 10 

DECLARE
   x NUMBER := 10;
BEGIN
   -- Conditional statement (IF-THEN-ELSE)
   IF x > 0 THEN
      DBMS_OUTPUT.PUT_LINE('x is positive');
   ELSIF x < 0 THEN
      DBMS_OUTPUT.PUT_LINE('x is negative');
   ELSE
      DBMS_OUTPUT.PUT_LINE('x is zero');
   END IF;

   -- Iterative statement (FOR LOOP)
   FOR i IN 1..5 LOOP
      DBMS_OUTPUT.PUT_LINE('Iteration: ' || i);
   END LOOP;
END;
/



SELECT COUNT(name) FROM employee_table;

SELECT SUM(age) FROM employee_table;

SELECT AVG(age) FROM employee_table;

SELECT MAX(age) FROM employee;

SELECT MIN(age) FROM employee;



exp 12


CREATE TABLE Emp (
  Name VARCHAR(50),
  Empno INT,
  Ename VARCHAR(50),
  Job VARCHAR(50),
  Salary DECIMAL(10, 2),
  Deptno INT
);
CREATE VIEW ASP_Employees AS
SELECT *
FROM Emp
WHERE Job = 'ASP';
CREATE VIEW Employee_Details AS
SELECT Empno, Ename, Deptno
FROM Emp;
SELECT view_name
FROM user_views;
INSERT INTO ASP_Employees (Name, Empno, Ename, Job, Salary, Deptno)
VALUES ('John Doe', 1001, 'John', 'ASP', 5000, 10);
DROP VIEW ASP_Employees;


SELECT 
  TABLE_SCHEMA,
  TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS where TABLE_SCHEMA != 'sys';


exp11


CREATE TABLE customers (
  Id INT,
  Name VARCHAR(50),
  Age INT,
  Address VARCHAR(100),
  Salary DECIMAL(10, 2)
);
INSERT INTO customers (Id, Name, Age, Address, Salary)
VALUES
  (1, 'John', 25, 'New York', 5000),
  (2, 'Jane', 30, 'London', 6000),
  (3, 'Mike', 35, 'Paris', 4500),
  (4, 'Sarah', 28, 'Sydney', 5500),
  (5, 'David', 32, 'Tokyo', 4000);
SELECT Id
FROM customers
WHERE Salary > 4500;
UPDATE customers
SET Salary = Salary * 1.25
WHERE Age >= 27;
DELETE FROM customers
WHERE Age >= 30;
SELECT Id, Name
FROM customers
WHERE Address NOT IN ('Delhi', 'Mumbai');

exp 13 

CREATE OR REPLACE PROCEDURE calculate_salary (emp_id NUMBER) IS
  emp_salary NUMBER;
BEGIN
  -- Retrieve employee salary based on emp_id
  SELECT salary INTO emp_salary FROM employees WHERE employee_id = emp_id;

  -- Perform salary calculation or any other logic
  -- ...

  -- Display the calculated salary
  DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || emp_salary);
END;
/

CREATE OR REPLACE FUNCTION calculate_bonus (emp_id NUMBER) RETURN NUMBER IS
  emp_bonus NUMBER;
BEGIN
  -- Retrieve employee bonus based on emp_id
  SELECT bonus INTO emp_bonus FROM bonuses WHERE employee_id = emp_id;

  -- Perform bonus calculation or any other logic
  -- ...

  -- Return the calculated bonus
  RETURN emp_bonus;
END;
/

exp 14

1.	DECLARE
total_rows number(2);
BEGIN
UPDATE customers
SET salary = salary + 500;
IF sql%notfound THEN
dbms_output.put_line('no customers selected');
ELSIF sql%found THEN
total_rows := sql%rowcount;
dbms_output.put_line( total_rows || ' customers selected ');
END IF;
END;/
2.	DECLARE
c_id customers.id%type;
c_name customers.name%type;
c_addr customers.address%type;
CURSOR c_customers is
SELECT id, name, address FROM customers;
BEGIN
OPEN c_customers;
LOOP
FETCH c_customers into c_id, c_name, c_addr;
EXIT WHEN c_customers%notfound;
dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr);
END LOOP;
CLOSE c_customers;
END;
/


1.	DECLARE
c_id customers.id%type := 8;
c_name customers.name%type;
c_addr customers.address%type;
BEGIN
SELECT name, address INTO c_name, c_addr
FROM customers
WHERE id = c_id;
DBMS_OUTPUT.PUT_LINE ('Name: '|| c_name);
DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);
EXCEPTION
WHEN no_data_found THEN
dbms_output.put_line('No such customer!');
WHEN others THEN
dbms_output.put_line('Error!');
END; 
/





