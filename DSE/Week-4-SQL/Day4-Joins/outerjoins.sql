use hr;

select * from departments d natural join employees e; -- 32 

select * from departments d inner join employees e on d.department_id = e.department_id; -- 106
select * from departments d inner join employees e on d.department_id = e.department_id and d.manager_id = e.employee_id; -- 11
select * from departments d inner join employees e on d.department_id = e.department_id or d.manager_id = e.employee_id; -- 106


select * 
from locations l left outer join departments d on  l.location_id = d.location_id
order by city;

# Cross product is a set operation
select * from countries,regions; 

select * from 
employees e inner join jobs j on
e.salary between j.min_salary and j.max_salary
where j.job_id = 'AC_MGR';
select * from departments;

select distinct * 
from employees e
where e.employee_id not in ( select distinct d.manager_id from departments d)
;

select distinct manager_id
from employees 
where manager_id is not null;


select distinct e.first_name, e.last_name
from employees e inner join employees e1 on e.employee_id = e1.manager_id;

select distinct e.first_name, e.last_name
from employees e, employees a
where e.employee_id = a.manager_id;

select distinct j.*
from jobs j inner join jobs m on j.min_salary > m.max_salary;

select job_title, avg(salary)
from jobs j natural join employees e
group by j.job_title;

select job_title,first_name, max_salary - min_salary
from jobs natural join employees;

select * from employees e left outer join departments d on d.manager_id = e.employee_id;