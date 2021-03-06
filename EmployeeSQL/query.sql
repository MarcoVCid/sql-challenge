/*
1. List the following details of each employee:
employee number, last name, first name, sex, and salary.
*/

SELECT e.employee_id, e.last_name, e.first_name, e.sex, s.salary
FROM employee as e
JOIN salary as s ON
e.employee_id = s.employee_id;


/*
2. List first name, last name, and hire date
for employees who were hired in 1986.
*/

SELECT first_name, last_name, hire_date
FROM employee
WHERE EXTRACT(year from hire_date) = 1986;


/*
3. List the manager of each department with the following information:
department number, department name, the manager's employee number,
last name, first name.
*/

SELECT m.dept_no, d.dept_name, m.employee_id, e.last_name, e.first_name
FROM dept_mgr as m
LEFT JOIN department as d ON
m.dept_no = d.dept_no
LEFT JOIN employee as e ON
m.employee_id = e.employee_id;


/*
4. List the department of each employee with the following information:
employee number, last name, first name, and department name.
*/

SELECT e.employee_id, e.last_name, e.first_name, d.dept_name
FROM employee as e
LEFT JOIN dept_emp as de ON
e.employee_id = de.employee_id
LEFT JOIN department as d ON
de.dept_no = d.dept_no;


/*
5. List first name, last name, and sex for employees whose first name is
"Hercules" and last names begin with "B."
*/

SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


/*
6. List all employees in the Sales department, including their employee number,
last name, first name, and department name.
*/

SELECT employee_id, last_name, first_name,
(SELECT department.dept_name
	FROM department
	WHERE department.dept_name = 'Sales')
FROM employee
WHERE employee_id IN
(
	SELECT employee_id
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM department
		WHERE dept_name = 'Sales'
	)
);


/*
7. List all employees in the Sales and Development departments, including
their employee number,last name, first name, and department name.
*/

SELECT e.employee_id, e.last_name, e.first_name, d.dept_name
FROM employee AS e
LEFT JOIN dept_emp as de ON
e.employee_id = de.employee_id
LEFT JOIN department as d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';


/*
8. In descending order, list the frequency count of employee last names,
i.e., how many employees share each last name.
*/

SELECT last_name, COUNT(last_name) AS "Number of last names"
FROM employee
GROUP BY last_name
ORDER BY "Number of last names" DESC;