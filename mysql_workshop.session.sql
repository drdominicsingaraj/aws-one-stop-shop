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