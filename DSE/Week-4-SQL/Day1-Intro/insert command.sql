insert into emp 
values (100, 90, 109, 'EDWIN', 'DANY','a@gm','909090900',10000), 
(101, 90, 109, 'HARRY', 'POTTER','b@gm','909090900',20000),
(102, 60, 101, 'EVA', 'MATE','c@gm','909090900',9000);

select * from emp;
-- first_name and last_name, 
    -- department_id and salary
select fname,lname, email, salary,manager_id from emp where manager_id in (120, 103, 109);

select * from emp where dept_id < manager_id;

