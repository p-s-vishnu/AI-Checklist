create table hired
(
		emp_id int,
        emp_name varchar(20),
        state varchar(2),
        primary key (emp_id)
);

insert into hired values(1,'Edwin','TN'),
(2,'Perk','OR'),
(3,'Abhi','AP'),
(4,'Arshad','KA');

create table salary(
	emp_id int primary key,
    dept_id int,
    salary float
);
insert into salary values
(1,1,25000),
(2,2,30000),
(3,1,50000),
(4,Null,Null);
select * from salary;

create table department
(
		dept_id int,
        emp_id int,
        foreign key(emp_id) references hired(emp_id)  
);
insert into department 
values (2,2),
(1,1),
(1,3);
select * from department;
 -- alter table salary add constraint foreigh key () references hired()
 
 -- Queries
 #1
 select dept_id, emp_name, state, salary
 from hired natural join salary
 where dept_id is not null;
 
 #2
 select emp_name,salary,dept_id
 from hired natural join salary;

#3 
select dept_id,emp_name,salary
from hired natural join salary;

#4
select distinct emp_id
from hired natural join department;

#5 
select *
from hired h left join department d on h.emp_id = d.emp_id;	

#6
select emp_id,emp_name,salary ,state 
from hired natural join salary
where salary > 20000 and state = 'AP';

#7 
select emp_id, emp_name , salary, state
from hired natural join salary
where salary between 10000 and 30000 and state in ('TN','OR');

## Create new tables

-- drop table product;
create table product (
	product_id varchar(3) primary key,
    product_name varchar(20),
    price float
);
insert into product values
('P01','BISCUITS',10),
('P02','CHOCOLATES',20),
('P03','BREAD',15),
('P04','BUTTER',30)
;
SELECT * FROM PRODUCT;

create table sales (
	sales_id int,
	product_id varchar(3) ,
    foreign key(product_id) references product(product_id)
);
insert into sales values
(2,'P02'),
(1,'P01'),
(1,'P03')
;

CREATE table orders(
	sales_id int,
    cust_id int,
    product_id varchar(3),
    order_quantity int,
    order_status varchar(20),
    foreign key(cust_id) references customer(product_id),
    foreign key(product_id) references product(product_id)
);