USE employees;

 SELECT title FROM titles GROUP BY title; -- 7 rows

/*
 Find your query for employees whose last names start and end with 'E'. Update the query to find just the unique last names that start and end with 'E' using GROUP BY. The results should be:
 */

SELECT last_name FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e' GROUP BY last_name; -- 5 rows

/*
 Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.
 */

SELECT first_name, last_name FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e' GROUP BY last_name, first_name; -- 846 rows

-- Find the unique last names with a 'q' but not 'qu'. Your results should be:
SELECT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name; -- 3 rows

-- Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
SELECT last_name, COUNT(*) FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY COUNT(*); -- 3 rows

-- Update your query for 'Irena', 'Vidya', or 'Maya'. Use count(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT COUNT(*), gender FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') GROUP BY gender; -- 2 rows

-- BONUSES
# what are the names of the 10 most recently hired females in the company? the first 10? (no group by needed)
SELECT first_name, last_name FROM employees
WHERE gender = 'F'
ORDER BY hire_date DESC
LIMIT 10;
# what are the top three most common job titles?
SELECT title, COUNT(*) FROM titles
GROUP BY title
ORDER BY COUNT(*) DESC
LIMIT 3;
# what is the most common 'from date' for job titles? for staff only?
SELECT from_date, COUNT(*) FROM titles
GROUP BY from_date
ORDER BY COUNT(*) DESC;

SELECT from_date, COUNT(*) FROM titles
WHERE title = 'staff'
GROUP BY from_date
ORDER BY COUNT(*) DESC;
# what is the highest employee number for an engineer?
SELECT MAX(emp_no) FROM titles
WHERE title = 'engineer';
# what is the most common birthday?
SELECT birth_date, COUNT(birth_date) AS birthdates FROM employees -- MOST common birth date
GROUP BY birth_date
ORDER BY `birthdates` DESC
LIMIT 1;

SELECT DATE_FORMAT(birth_date, '%d'), COUNT(DATE_FORMAT(birth_date, '%d')) AS birthdays FROM employees -- MOST common birth day
GROUP BY birth_date
ORDER BY 'birthdays' DESC
LIMIT 1;

# what is the most common female birthday? male?
SELECT birth_date, COUNT(birth_date) AS birthdates FROM employees -- MOST common birth date
WHERE gender = 'F'
GROUP BY birth_date
ORDER BY `birthdates` DESC
LIMIT 1;

SELECT birth_date, COUNT(birth_date) AS birthdates FROM employees -- MOST common birth date
WHERE gender = 'M'
GROUP BY birth_date
ORDER BY `birthdates` DESC
LIMIT 1;
# what is the most common hire date for female and male employees?
SELECT hire_date AS 'Common hire date (F)' FROM employees
WHERE gender = 'F'
GROUP BY hire_date
ORDER BY COUNT(hire_date) DESC
LIMIT 1;

SELECT hire_date AS 'Common hire date (M)' FROM employees
WHERE gender = 'M'
GROUP BY hire_date
ORDER BY COUNT(hire_date) DESC
LIMIT 1;
# what is the longest last name of someone born on March 8, 1952?
SELECT last_name FROM employees
WHERE birth_date LIKE '1952-03-08'
GROUP BY last_name
ORDER BY char_length(last_name) DESC
LIMIT 1;
# what is the lowest employee number for the first senior engineers in the company?
SELECT emp_no FROM titles
WHERE title LIKE 'senior%engineer'
ORDER BY from_date, emp_no
LIMIT 1;