desc emp;

-- ch_dept is the constraint name 
alter table emp add constraint ch_dept check( dept_id > 0 );
select * from emp;

-- trying to insert invalid value
insert into emp values (103, 0, 104, 'HARI', 'T','d@gm',87436238, 10000);
truncate table emp;
delete from emp where eid = 100;
rollback;