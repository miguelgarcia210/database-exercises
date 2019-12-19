USE employees;

/*
 Modify your first query to order by first name. The first result should be Irena Reutenauer and the last result should be Vidya Simmen.
Update the query to order by first name and then last name. The first result should now be Irena Acton and the last should be Vidya Zweizig.
Change the order by clause so that you order by last name before first name. Your first result should still be Irena Acton but now the last result should be Maya Zyda.
Update your queries for employees with 'E' in their last name to sort the results by their employee number. Your results should not change!
Now reverse the sort order for both queries.
Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.
 */

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name, first_name; -- 709 rows
SELECT * FROM employees WHERE last_name LIKE 'e%'; -- 7,330 rows
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'; -- 135,214 rows
SELECT * FROM employees WHERE birth_date LIKE '%12-25'; -- 842 rows
SELECT * FROM employees WHERE last_name LIKE '%q%'; -- 1,873 rows


SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'; -- 709 rows
SELECT * FROM employees WHERE first_name IN ('Irena','Vidya','Maya') AND gender = 'M'; -- 441 rows
SELECT * FROM employees WHERE last_name LIKE 'e%' OR last_name LIKE '%e' ORDER BY emp_no DESC; -- 30,723 rows
SELECT * FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e' ORDER BY emp_no DESC; -- 899 rows
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%12-25' ORDER BY birth_date, hire_date DESC; -- 362 rows
SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'; -- 547 rows
