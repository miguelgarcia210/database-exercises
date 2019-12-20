USE employees;

/*
 Using the example in the Associative Table Joins section as a guide,
 write a query that shows each department along with the name of the current manager for that department.
 */

SELECT d.dept_no AS dpt_num, d.dept_name AS department, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e -- starting @ employees table
JOIN dept_manager AS dman ON dman.emp_no =  e.emp_no -- JOIN table and describe how they're linked
JOIN departments AS d ON d.dept_no = dman.dept_no -- ^
WHERE dman.to_date > CURRENT_DATE -- set condition to non-existent date to retrieve the current manager
ORDER BY dpt_num; -- order by department number then by the from date

-- Find the name of all departments currently managed by women.
SELECT d.dept_no AS dpt_num, d.dept_name AS dpt, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS dman ON dman.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = dman.dept_no
WHERE dman.to_date > CURRENT_DATE AND e.gender LIKE 'f%'
ORDER BY dpt_num;

-- Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS Title, COUNT(*) AS Count
FROM titles AS t
JOIN dept_emp AS demp ON demp.emp_no = t.emp_no
JOIN departments AS d ON d.dept_no = demp.dept_no
WHERE demp.to_date > current_date
AND t.to_date > current_date
AND d.dept_name LIKE '%customer service%'
GROUP BY t.title
ORDER BY Count;

-- Find the current salary of all current managers.
SELECT d.dept_name AS Department, CONCAT(e.first_name, ' ', e.last_name) AS Name, s.salary AS Salary
FROM salaries AS s
JOIN employees AS e ON e.emp_no = s.emp_no
JOIN dept_manager AS dman ON dman.emp_no = e.emp_no -- bridge the gap
JOIN departments AS d ON d.dept_no = dman.dept_no
WHERE s.to_date > CURRENT_DATE
AND dman.to_date > CURRENT_DATE
ORDER BY Department;

-- Bonus Find the names of all current employees, their department name, and their current manager's name.
SELECT
       CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name',
       d.dept_name AS 'Department Name',
       CONCAT(m.first_name, ' ' , m.last_name) AS 'Manager Name'
FROM employees AS e
JOIN dept_emp AS demp ON demp.emp_no = e.emp_no
    -- look at diagram to see how to connect to dept manager
JOIN departments AS d ON d.dept_no = demp.dept_no
JOIN dept_manager AS dman ON dman.dept_no = d.dept_no
JOIN employees AS m ON m.emp_no = dman.emp_no
WHERE demp.to_date > CURRENT_DATE
AND dman.to_date > CURRENT_DATE
ORDER BY d.dept_name;


select * from dept_manager; -- just to see table
select * from titles;
select * from employees;
select * from departments;
select * from salaries;
select * from dept_emp;