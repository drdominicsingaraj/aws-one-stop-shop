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


