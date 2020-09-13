--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT * FROM departments;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees AS employees LEFT JOIN salaries AS salaries
ON employees.emp_no=salaries.emp_no
ORDER BY employees.emp_no;

--2. List employees who were hired in 1986.
SELECT first_name,last_name,hire_date FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT manager.dept_no, department.dept_name, manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager AS manager
INNER JOIN departments AS department
	ON manager.dept_no=department.dept_no
LEFT JOIN employees AS employees
	ON manager.emp_no=employees.emp_no;
	
--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
	ON e.emp_no=de.emp_no
INNER JOIN departments AS d
	ON de.dept_no=d.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.gender FROM employees AS e
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
	ON e.emp_no=de.emp_no
INNER JOIN departments AS d
	ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales';

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
	ON e.emp_no=de.emp_no
INNER JOIN departments AS d
	ON de.dept_no=d.dept_no
WHERE d.dept_name in ('Sales','Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;