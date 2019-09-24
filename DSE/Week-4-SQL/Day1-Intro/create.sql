-- create database <db_name>; 
-- describe table
-- desc emp;

drop table emp;

create table emp
(
			eid integer,
            dept_id integer,
            manager_id integer,
            fname varchar(20),
            lname varchar(20),
            email varchar(30),
            ph integer,
            salary integer,
            constraint pk_emp primary key(eid)
);

select * from emp;