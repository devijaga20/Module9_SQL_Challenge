--1)List the employee number, last name, first name, sex, and salary of each employee.

--EMPLOYEES table : emp_no, last_name, first_name, sex
-- SALARIES table: emp_no, salary

SELECT  e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM EMPLOYEES e
JOIN SALARIES s 
ON e.emp_no = s.emp_no;

--2)List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name AS "First Name",
	   last_name AS "Last Name",
	   TO_DATE(hire_date, 'MM/DD/YYYY') as "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM TO_DATE(hire_date, 'MM/DD/YYYY')) = 1986
ORDER BY hire_date;

--3)List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.


-- DEPARTMENTS table : dept_no, dept_name 
--DEPT_MANAGER table : dept_no, emp_no
-- EMPLOYEES table : emp_no, last_name, first_name 

SELECT 
    d.dept_no, 
    d.dept_name, 
    e.emp_no, 
    e.last_name, 
    e.first_name
FROM 
    DEPARTMENTS d
JOIN 
    DEPT_MANAGER dm 
ON 
    d.dept_no = dm.dept_no
JOIN 
    EMPLOYEES e 
ON 
    dm.emp_no = e.emp_no;

--4)List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    de.dept_no, 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    d.dept_name
FROM 
    DEPT_EMP de
JOIN 
    EMPLOYEES e 
ON 
    de.emp_no = e.emp_no
JOIN 
    DEPARTMENTS d 
ON 
    de.dept_no = d.dept_no;

--5)List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT 
    first_name, 
    last_name, 
    sex
FROM 
    EMPLOYEES
WHERE 
    first_name = 'Hercules'
    AND last_name LIKE 'B%';

--6)List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name
FROM 
    DEPT_EMP de
JOIN 
    EMPLOYEES e 
ON 
    de.emp_no = e.emp_no
JOIN 
    DEPARTMENTS d 
ON 
    de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';

--7)List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    d.dept_name
FROM 
    DEPT_EMP de
JOIN 
    EMPLOYEES e 
ON 
    de.emp_no = e.emp_no
JOIN 
    DEPARTMENTS d 
ON 
    de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');

--8)List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT 
    last_name, 
    COUNT(*) AS frequency
FROM 
    EMPLOYEES
GROUP BY 
    last_name
ORDER BY 
    frequency DESC;
