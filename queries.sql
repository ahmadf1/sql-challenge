SELECT *
FROM departments;

SELECT *
FROM dept_emp;

SELECT *
FROM dept_manager;

SELECT *
FROM employees;

SELECT *
FROM salaries;

SELECT *
FROM titles;

--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no;
--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT d.dept_no, d.dept_name, e.last_name, e.first_name, t.title
FROM departments AS d
JOIN dept_manager AS dm ON
dm.dept_no = d.dept_no
JOIN employees AS e ON
dm.emp_no = e.emp_no
JOIN titles AS t ON
t.title_id = e.emp_title_id
WHERE title='Manager';

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_manager AS dm ON
dm.dept_no = d.dept_no
JOIN employees AS e ON
dm.emp_no = e.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT e.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS dm ON
dm.dept_no = d.dept_no
JOIN employees AS e ON
dm.emp_no = e.emp_no
WHERE d.dept_name='Sales';
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_manager AS dm ON
dm.dept_no = d.dept_no
JOIN employees AS e ON
dm.emp_no = e.emp_no
WHERE d.dept_name='Sales'
OR d.dept_name='Development';
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;
