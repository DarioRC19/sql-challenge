CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY ,	
	emp_title_id VARCHAR(5) NOT NULL,	
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex	VARCHAR(2) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(5) NOT NULL,
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary MONEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	employees.emp_no, 
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
JOIN salaries
	on employees.emp_no = salaries.emp_no;
	
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
	first_name,
	last_name,
	hire_date	
FROM employees
WHERE DATE_PART('year',hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
	departments.dept_name,
	dept_manager.dept_no, 
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name	
FROM dept_manager
JOIN  departments
	on dept_manager.dept_no = departments.dept_no
JOIN employees
	on dept_manager.emp_no = employees.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	departments.dept_name,
	dept_emp.emp_no,
	dept_emp.dept_no,
	employees.first_name,
	employees.last_name
FROM dept_emp
JOIN departments
	on dept_emp.dept_no = departments.dept_no
JOIN employees
	on dept_emp.emp_no = employees.emp_no;
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	departments.dept_name,
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_emp
JOIN departments
	on dept_emp.dept_no = departments.dept_no
JOIN employees
	on dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	departments.dept_name,
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_emp
JOIN departments
	on dept_emp.dept_no = departments.dept_no
JOIN employees
	on dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales' or dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	employees.last_name, COUNT(*)
FROM employees
GROUP BY last_name;



