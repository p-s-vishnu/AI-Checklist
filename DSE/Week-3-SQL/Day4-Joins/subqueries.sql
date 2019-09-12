select concat(first_name, ' ' ,last_name) name, salary 
from employees
where salary = (
	select min(salary) from employees
);

select department_id
from departments;

select *
from departments
where department_id not in (select distinct department_id from employees where datediff(curdate(), hire_date)/365 < 20);


select datediff(curdate(), hire_date)/365
from employees;

# All
select * from employees
where salary > all(select salary from employees where first_name like 'steven');

# Any 
select * 
from employees
where salary > any (select salary from employees where first_name like 'steven');

# multi column
select *
from employees
where (job_id, department_id) in (select job_id,department_id 
from employees where employee_id = 123);	

select first_name,department_id,salary,commission_pct
from employees
where (salary,commission_pct) in (select salary,commission_pct
from employees
where department_id = 30
);

select avg(commission_pct)
from employees;

select sum(commission_pct is null)
from employees;
select avg(ifnull(commission_pct,0))
from employees;


-- where manager_id is not null;

select avg(salary)
from employees;

select *, avg(salary) over(partition by job_id) 'test'
from employees;

# rollup
select department_id, sum(salary)
from employees
where department_id is not null 
group by department_id with rollup;

select department_id, avg(salary)
from employees
where department_id is not null
group by department_id with rollup;

select department_id, job_id,
sum(salary),
grouping(department_id),
grouping(job_id)
from employees
where department_id is not null
group by department_id, job_id with rollup;

# rank
select employee_id,salary,rank() over(order by salary desc)
from employees
;

# dense rank
select employee_id,salary, dense_rank() over(order by salary)
from employees;

select employee_id,department_id, salary, dense_rank() over(partition by department_id order by salary) emp_rank
from employees;


select employee_id, rank() over(order by hire_date)
from employees;

select employee_id, salary,LEAD(salary) over(order by salary)
from employees;

select employee_id, hire_date, lead(hire_date) over()
from employees;

select employee_id, hire_date, lag(hire_date) over()
from employees;