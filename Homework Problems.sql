
--  List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT E.emp_no, E.last_name, E.first_name, E.sex, S.salary
FROM "Employees" E JOIN "Salaries" S ON E.emp_no = S.emp_no;


--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT E.first_name, E.last_name,  E.hire_date
FROM "Employees" E 
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986';

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.

SELECT D.dept_no, D.dept_name, DM.emp_no, E.last_name, E.first_name
FROM "Department" D
JOIN "Dept_Manager" DM
ON DM.dept_no = D.dept_no
JOIN "Employees" E 
ON E.emp_no = DM.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT E.emp_no,E.last_name, E.first_name,D.dept_no
FROM "Employees" E
JOIN "Dept_Employees" DE
ON DE.emp_no = E.emp_no
JOIN "Department" D
ON D.dept_no = DE.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT E.first_name, E.last_name,E.sex
FROM "Employees" E
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT DE.emp_no, E.last_name, E.first_name, D.dept_name
FROM "Dept_Employees" DE
JOIN  "Employees" E
ON DE.emp_no = E.emp_no
JOIN "Department" D
ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.

SELECT DE.emp_no, E.last_name, E.first_name, D.dept_name
FROM "Dept_Employees" DE
JOIN  "Employees" E
ON DE.emp_no = E.emp_no
JOIN "Department" D
ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales' 
OR D.dept_name ='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees 
--share each last name.

SELECT last_name,
COUNT(last_name) AS "Frequency"
FROM "Employees" E
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;


