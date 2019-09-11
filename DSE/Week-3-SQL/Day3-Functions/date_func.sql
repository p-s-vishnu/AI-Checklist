use dse;

select month('2019-09-01');
select year('2019-09-01');
select year(curdate());
select curdate();
select truncate(curdate(),month);

select datediff(hire_date,'2019-09-01') from employees;