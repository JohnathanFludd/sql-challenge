-- DONE!!! 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no, last_name, first_name, sex, salaries.salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no;



-- DONE!!! 2. List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';


-- DONE!!! 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select dept_manager.emp_no, departments.dept_no,departments.dept_name, e.first_name, e.last_name
from departments 
inner join dept_manager
on departments.dept_no = dept_manager.dept_no
inner join employees as e
on (dept_manager.emp_no = e.emp_no);





--DONE  4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.first_name, e.last_name, e.emp_no, d.dept_name
from dept_emp
inner join departments as d
on dept_emp.dept_no = d.dept_no
inner join employees as e
on dept_emp.emp_no = e.emp_no;



-- DONE!!! 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- DONE!!! 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select dept_emp.emp_no, departments.dept_name,
employees.first_name, employees.last_name
from dept_emp
inner join departments
on dept_emp.dept_no = departments.dept_no
inner join employees
on dept_emp.emp_no = employees.emp_no
where departments.dept_name = 'Sales';


-- DONE!!! 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select d.dept_no, d.dept_name, dm.emp_no, e.first_name,e.last_name
from departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no
inner join employees as e
on e.emp_no = dm.emp_no
where d.dept_name = 'Sales'
or d.dept_name = 'Development';



-- DONE!!! 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select distinct(last_name), count(last_name) as last_count
from employees
group by last_name
order by last_count desc;

