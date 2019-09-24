# operations 
# Union
# union all 
# minus

select region_id, region_name from regions 
union 
select country_id, region_id from countries; 

select employee_id
from employees 
where department_id = 60
union 
select manager_id
from employees
where department_id = 60;

select employee_id
from employees 
where department_id = 60
union 
select manager_id
from employees
where department_id = 60;


select D.* 
from employees e, departments d
where e.employee_id = d.manager_id
and
first_name like 'STEVEN';

SELECT 
    *
FROM
    employees
WHERE
    salary > (SELECT 
            min(salary)
        FROM
            EMPLOYEES
        WHERE
            first_name LIKE 'steven');