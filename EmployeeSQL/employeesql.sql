-- Creating all tables

DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS dept_mgr;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS title;

CREATE TABLE title(
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR NOT NULL
);

CREATE TABLE employee(
	employee_id INT PRIMARY KEY NOT NULL,
	title_id VARCHAR,
	FOREIGN KEY (title_id) REFERENCES title(title_id),
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

CREATE TABLE salary(
	employee_id INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
	salary FLOAT
);

CREATE TABLE department(
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR
);

CREATE TABLE dept_mgr(
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
	PRIMARY KEY (dept_no, employee_id)
);

CREATE TABLE dept_emp(
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	PRIMARY KEY (employee_id, dept_no)
);

-- Check if info was uploaded correctly
SELECT * FROM title;
SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM salary;
SELECT * FROM dept_emp;
SELECT * FROM dept_mgr;