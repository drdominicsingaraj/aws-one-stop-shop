-- get the list of departments 
SELECT * FROM departments;

-- Retrieve the department ID and name for all departments
SELECT dept_no,dept_name FROM departments;

-- Retrieve the department ID and name for a specific department (e.g., 5)
SELECT dept_no,
       dept_name
FROM departments
WHERE dept_no = 'd009';

