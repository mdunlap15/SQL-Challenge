-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name, sex, salaries.salary as salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'


-- 3. List the manager of each department with the following information: department number, department name,
--    the manager's employee number, last name, first name.

SELECT employees.last_name, employees.first_name, departments.dept_no, departments.dept_name, dept_manager.emp_no
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no


-- 4. List the department of each employee with the following information: employee number, last name, first name,
--    and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp dm ON e.emp_no = dm.emp_no
LEFT JOIN departments d ON d.dept_no = dm.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT last_name, first_name, sex
FROM employees
WHERE first_name IN ('Hercules') AND last_name LIKE ('B%')
ORDER BY last_name

--
-- 6. List all employees in the Sales department, including their employee number,
--    last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON de.emp_no=e.emp_no
JOIN departments d ON d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no ASC

-- 7. List all employees in the Sales and Development departments, including their employee number,
--    last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON de.emp_no=e.emp_no
JOIN departments d ON d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no ASC

--
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
