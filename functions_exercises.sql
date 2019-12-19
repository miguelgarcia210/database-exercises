USE employees;
/*
Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column in your results.

For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use now() or curdate())
 */

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name, first_name; -- 709 rows
SELECT * FROM employees WHERE last_name LIKE 'e%'; -- 7,330 rows
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'; -- 135,214 rows
SELECT * FROM employees WHERE birth_date LIKE '%12-25'; -- 842 rows
SELECT * FROM employees WHERE last_name LIKE '%q%'; -- 1,873 rows


SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'; -- 709 rows
SELECT * FROM employees WHERE first_name IN ('Irena','Vidya','Maya') AND gender = 'M'; -- 441 rows
SELECT * FROM employees WHERE last_name LIKE 'e%' OR last_name LIKE '%e' ORDER BY emp_no DESC; -- 30,723 rows
SELECT CONCAT(first_name, ' ', last_name) FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e' ORDER BY emp_no DESC; -- 899 rows
SELECT DATEDIFF(NOW(),hire_date) FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%12-25' ORDER BY birth_date, hire_date DESC; -- 362 rows
SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'; -- 547 rows