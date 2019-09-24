use hr;

# 
select year(hire_date), count(*)
from employees
group by year(hire_date)
having count(employee_id) > 10
order by hire_date;

select employee_id, count(job_id)
from job_history
group by employee_id
having count(job_id) > 1;

select *
from job_history
order by job_id;

# Joins 
select * from regions;
select * from departments;
select * from regions, departments
order by 1;

select * from regions natural join countries;

# Cartesian product if no common columns
select * from regions;
select * from departments;
select * from regions natural join departments;


# Multiple primary key

select * from employees inner join departments;
select * from departments inner join employees;

select * from employees e inner join departments d
where e.employee_id = d.manager_id;

select * from countries natural join locations natural join departments;
select * from countries inner join locations inner join departments;