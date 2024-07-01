-- get the list of departments 
SELECT * FROM departments;

-- Retrieve the department ID and name for all departments
SELECT dept_no,dept_name FROM departments;

-- Retrieve the department ID and name for a specific department (e.g., 5)
SELECT dept_no,
       dept_name
FROM departments
WHERE dept_no = 'd009';

--Retrieve the department ID and name for a specific department (e.g., 'Customer Service')
SELECT dept_no 'Department Number',
       dept_name 'Department Name'
FROM departments
WHERE dept_name = 'Customer Service';

-- Retrieve top 10 records from employees table
SELECT * FROM employees
LIMIT 10;   

--Let's discuss it later after group by session
-- Get the count of employees in each department
SELECT dept_no,COUNT(*) 'Number of Employees'
FROM dept_emp
GROUP BY dept_no;

-- Get the count of employees from employees table
SELECT COUNT(*) 'Number of Employees'
FROM employees;

-- Retrieve top 5 employee records
SELECT * FROM employees
LIMIT 5;

-- Retrieve first name, last name from employees table
SELECT first_name,
       last_name
FROM employees
LIMIT 5;

-- Retrieve first name, last name and concatenate them using concat function using the data from employees table
SELECT first_name,
       last_name,
       CONCAT(first_name,' ',last_name) 'Full Name'
FROM employees
LIMIT 5; 

-- Get the first name and last name in upper case
SELECT UPPER(first_name) 'First Name',
       LOWER(last_name) 'Last Name'
FROM employees
LIMIT 5;

-- Functions : Count, Upper, Lower, Concat

-- Get sample 10 records from salaries table
SELECT * FROM salaries
LIMIT 10;

-- Get the maximum salary from salaries table
SELECT MAX(salary) 'Maximum Salary'
FROM salaries;

-- Get the maximum, minimum and average salary from salaries table
SELECT MAX(salary) 'Maximum Salary',
       MIN(salary) 'Minimum Salary',
       AVG(salary) 'Average Salary'
FROM salaries;

-- Get the number of records from titles table
SELECT COUNT(*) 'Number of Titles'
FROM titles;

-- Get sample 5 records from titles table
SELECT title FROM titles
LIMIT 25;

-- Get the list of titles without duplicates
SELECT DISTINCT title FROM titles;    

-- List of sql functions
-- Aggregate functions (COUNT, SUM, AVG, MIN, MAX)
-- String functions (UPPER, LOWER, CONCAT, SUBSTRING, TRIM, etc.)
-- Date and time functions (NOW, CURDATE, CURTIME, EXTRACT, etc.) 

-- Get the current date and time
SELECT NOW() 'Current Date and Time';

-- Get the current date, time, date and time, date which is 50 years from now()
SELECT NOW() 'Current Date and Time',
       CURDATE() 'Current Date',
       CURTIME() 'Current Time',
       EXTRACT(YEAR FROM NOW()) + 50 'Date 50 Years from Now';

-- Generate a report with employee number, first name, last name and salary
SELECT e.emp_no 'Employee Number',
       e.first_name 'First Name',
       e.last_name 'Last Name',
       s.salary 'Salary'
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
LIMIT 10;

-- Get the schema of employees table
DESCRIBE employees;

-- Data Integrity like Default, check constraints   

DESCRIBE titles;

INSERT INTO titles (emp_no, title, from_date)
VALUES (
    10001,'AI Specialist','2023-06-26'
  );

INSERT INTO titles (emp_no, title, from_date)
VALUES (
    10002,'AI Specialist II','2023-06-26'
  );

-- Create a stored procedure to insert data into the 'titles' table

CREATE PROCEDURE insert_title(
  IN p_emp_no INT,
  IN p_title VARCHAR(50),
  IN p_from_date DATE
)
BEGIN
  insert into titles (emp_no, title, from_date)   VALUES (p_emp_no, p_title, p_from_date);
END;

-- Using the above stored procedure, insert data into the 'titles' table

CALL insert_title(10003, 'AI Specialist 3', '2023-06-26');
CALL insert_title(10004, 'AI Specialist 4', '2023-06-26');
CALL insert_title(10005, 'AI Specialist 5', '2023-06-26');
CALL insert_title(10006, 'AI Specialist 6', '2023-06-26');
CALL insert_title(10007, 'AI Specialist 7', '2023-06-26');
CALL insert_title(10008, 'AI Specialist 8', '2023-06-26');
CALL insert_title(10009, 'AI Specialist 9', '2023-06-26');
CALL insert_title(10010, 'AI Specialist 21', '2023-06-26');
CALL insert_title(10011, 'AI Specialist 46', '2023-06-26');

-- Get the list of titles from the 'titles' table with titles like AI
SELECT * FROM titles WHERE title LIKE '%AI%'; 

-- Get the list of departments
SELECT * FROM departments;

-- get the marketing department details
SELECT * FROM  departments 
WHERE 
dept_name  =  'Marketing';

-- get the marketing department details with dept_no
SELECT * FROM  departments
WHERE
dept_no  =  'd001';

-- Get the list of records with following departments Marketing, Production, Finance
SELECT * FROM  departments
WHERE
dept_name IN ('marketing','Production','Finance');

-- Example for OR - Logical Operator for the same scenario
SELECT 
  * 
FROM 
  departments 
WHERE 
  (dept_name = 'marketing') 
  OR (dept_name = 'Production') 
  OR (dept_name = 'Finance')

-- Example for AND - Logical Operator for the same scenario

SELECT 
  * 
FROM 
  departments 
WHERE 
  (dept_name = 'marketing') 
  AND (dept_name = 'Production') 
  AND (dept_name = 'Finance')


-- Get the list of records other than the following departments Marketing, Production, Finance

SELECT * FROM  departments
WHERE
dept_name NOT IN ('marketing','Production','Finance');

-- Get the maximum, minimum and average salary for employees in the 'Finance' department
SELECT
  MAX(salary) 'Maximum Salary',
  MIN(salary) 'Minimum Salary',
  AVG(salary) 'Average Salary'
FROM
  salaries


-- Retrieve the salary records with salary lesser than average salary
SELECT count(*) FROM salaries
WHERE salary < 63811;

-- Retrieve the salary records with salary more than average salary
SELECT count(*) FROM salaries
WHERE salary > 63811;

-- Get all the salary records with salary in the range of 40000 and 60000
SELECT * FROM salaries
WHERE salary BETWEEN 40000 AND 60000;

-- Get all the salary records with salary not in the range of 40000 and 60000
SELECT * FROM salaries
WHERE salary NOT BETWEEN 40000 AND 60000;

-- Get the records with salary equal to 158220
SELECT * FROM salaries
WHERE salary = 158220;

select * from employees
where emp_no=43624;

-- get the record with emp_no 43624
SELECT * FROM employees
WHERE emp_no = 43624;

-- get the record with emp_no 43624 from salaries
SELECT * FROM salaries
WHERE emp_no = 43624;

-- generate a report with employee number equals 43624, first name, last name and salary 
SELECT e.emp_no 'Employee Number',
       e.first_name 'First Name',
       e.last_name 'Last Name',
       s.salary 'Salary',
       s.from_date 'From Date',
       s.to_date 'To Date'
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = 43624;


INSERT INTO employees (
    emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
  )
VALUES (
    555505,
    '1886-03-26',
    'Amir',
    'Hussain',
    'M',
    '2024-03-26'
  );

select * from employees
where emp_no=555505;

--Add a multiple line comment
/*

https://www.w3schools.com/mysql/mysql_check.asp

MySQL DEFAULT Constraint
------------------------
The DEFAULT constraint is used to set a default value for a column.

The default value will be added to all new records, if no other value is specified.

MySQL CHECK Constraint
----------------------
The CHECK constraint is used to limit the value range that can be placed in a column.

If you define a CHECK constraint on a column it will allow only certain values for this column.

If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.
*/


-- generate a report with employee number equals 43624, first name, last name and salary using Inner Join
SELECT e.emp_no 'Employee Number',
       e.first_name 'First Name',
       e.last_name 'Last Name',
       s.salary 'Salary',
       s.from_date 'From Date',
       s.to_date 'To Date'
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = 555505;

-- Result : No data

-- generate a report with employee number equals 43624, first name, last name and salary using Inner Join
SELECT e.emp_no 'Employee Number',
       e.first_name 'First Name',
       e.last_name 'Last Name',
       s.salary 'Salary',
       s.from_date 'From Date',
       s.to_date 'To Date'
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no in (555505,43624,100001);

-- ANSI SQL

DESCRIBE salaries;

--Store the results of query in a temporary table

CREATE TABLE emp_temp AS
SELECT *
FROM employees
WHERE emp_no in (555505,
                 43624,
                 100001);

select * from emp_temp;

CREATE TABLE salaries_temp AS
SELECT *
FROM salaries
WHERE emp_no in (555505,
                 43624,
                 100001);

select * from salaries_temp;

-- delete a table named employees_temporary
DROP TABLE emp_temporary;

select * from emp_temp;
select * from salaries_temp;

-- get the employee record with number 2147483647
SELECT * FROM employees WHERE emp_no = 2147483647;

-- Generate report with the combination of data from emp_temp and salaries_temp using right join

select * from emp_temp; 
-- 43624, 100001, 555505

select distinct emp_no from salaries_temp;
-- 43624, 100001, 2147483647

-- Left table - emp_temp and right table - salaries_temp

-- Join emp_temp with salary_temp using right join 
SELECT s.emp_no, e.birth_date, e.first_name, e.last_name, s.salary, s.from_date, s.to_date 
FROM emp_temp e
RIGHT JOIN salaries_temp s
ON e.emp_no = s.emp_no

select * from emp_temp;

create table emp_temp_2
as
select * from emp_temp;

select * from emp_temp_2;

-- Two tables emp_temp and emp_temp_2 with same data

-- union data from two tables

select * from emp_temp
union
select * from emp_temp_2;

select * from emp_temp
union all
select * from emp_temp_2;

-- Full Outer Join

select s.emp_no, e.birth_date, e.first_name, e.last_name, s.salary, s.from_date, s.to_date  from emp_temp e
left join salaries_temp s
on e.emp_no = s.emp_no
union
select s.emp_no, e.birth_date, e.first_name, e.last_name, s.salary, s.from_date, s.to_date  from emp_temp e
right join salaries_temp s
on e.emp_no = s.emp_no

--------------------------- SORTING-----------------------------------------

-- Get the list of departments sorted by dept_no
SELECT * FROM departments
ORDER BY dept_no asc;

-- Get the list of departments sorted by dept_no descending order
SELECT * FROM departments
ORDER BY dept_no DESC;

--------------------------- SORTING-----------------------------------------

select * from departments where dept_no in ('d001', 'd002', 'd003');

select dept_no from departments where dept_name in ('Marketing', 'Finance', 'Human Resources');

-- 'd001','d002','d003'

select * from dept_emp where dept_no in ('d001', 'd002', 'd003');

SELECT *
FROM dept_emp
WHERE dept_no in
    (SELECT dept_no
     FROM departments
     WHERE dept_name in ('Marketing',
                         'Finance',
                         'Human Resources'));

-- For additional examples : https://www.sqltutorial.org/sql-subquery/

-- Get the number of employees in each department
SELECT COUNT(distinct emp_no) 'No of Employees' from employees;

-- Get the employees who are part of Marketing department
SELECT * FROM employees 
WHERE emp_no IN
    (SELECT emp_no
     FROM dept_emp
     WHERE dept_no =
         (SELECT dept_no
          FROM departments
          WHERE dept_name = 'Marketing'));


-- Get the employees who are part of Marketing department using joins
SELECT * FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing';

-- Get the number of employees in each department other than d007 and d004
SELECT dept_no,
       COUNT(DISTINCT emp_no) 'No of Employees'
FROM dept_emp
WHERE dept_no in ('d007',
                  'd004')
GROUP BY dept_no
HAVING COUNT(DISTINCT emp_no) > 50000;

-- Get the number of employees in each department and sort it by dept_no descending order
SELECT dept_no,
       COUNT(DISTINCT emp_no) 'No of Employees'
FROM dept_emp
GROUP BY dept_no
ORDER BY dept_no DESC;

-- Wild card search
-- % or _



SELECT upper(emp.first_name),
       upper(emp.last_name),
       concat(first_name,' ',last_name) as 'Full Name',
       de.dept_no as 'Department Number',
       d.dept_name 'Department Name',
       SUBSTRING(first_name,1,4)
FROM employees emp
JOIN dept_emp de ON emp.emp_no=de.emp_no
JOIN departments d ON de.dept_no=d.dept_no
WHERE emp.first_name='Georgi'
  AND emp.last_name like'B%'
  AND d.dept_name='Sales';

-- substring syntax
-- SUBSTRING(string, start, length)

SELECT SUBSTRING("SQL Tutorial", 1, 3) AS ExtractString;


SELECT upper(emp.first_name),
       upper(emp.last_name),
       concat(first_name,' ',last_name) as 'Full Name',
       length(last_name),
       de.dept_no as 'Department Number',
       d.dept_name 'Department Name',
       SUBSTRING(first_name,1,4)
FROM employees emp
JOIN dept_emp de ON emp.emp_no=de.emp_no
JOIN departments d ON de.dept_no=d.dept_no
WHERE emp.first_name='Georgi'
  AND d.dept_name='Sales';



