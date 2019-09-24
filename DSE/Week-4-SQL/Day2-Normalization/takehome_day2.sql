use hr;

# 1.	List all IT related departments where there are no managers .(2 rows)[
select * from departments where department_name like 'IT%' and manager_id is null;

# 2.	Print a bonafide certificate for an employee (say for emp. id 123) as below:
# "This is to certify that <full name> with employee id <emp. id> is working as <job id> in dept. <dept ID>.
select concat("This is to certify that ",first_name,"  with employee id ",
employee_id, " is working as ", job_id," in dept ",department_id) bonafinde
from employees
where employee_id = 123;

# 3.	Write a  query to display the  employee id, salary & salary range of employees as 
# 'Tier1', 'Tier2' or 'Tier3' as per the range <5000, 5000-10000, >10000 respectively,ordering the output by those tiers.
select employee_id,salary,
case
	when salary < 5000 then 'Tier1'
	when salary between 5000 and 10000 then 'Tier2'
	when salary > 10000 then 'Tier3'
end as tiers
from employees
order by tiers;

# 4.	Write a query to display the department-wise and job-id-wise    
# total  salaries of employees whose salary is more than 25000.(8 rows) 
select department_id,job_id,sum(salary)
from employees
group by department_id,job_id
having sum(salary) > 25000;

# 5.	Write a query to display names of employees whose first name as well as last name ends with vowels.  (vowels : aeiou )
select first_name, last_name
from employees
where first_name rlike '.*[aeiou]$';

# 6.	What is the average salary range (diff. between min & max salary) of all types 'Manager's and 'Clerk's.
select  avg(max_salary - min_salary) 'salary range'
from jobs
where job_id like ('%man') or job_id like ('%clerk')
group by substring(job_id,4);

# 7.	Show location id and cities of US or UK whose city name starts from 'S' but not from 'South'.
select location_id, city
from locations
where country_id rlike 'US|UK' and city like 's%' and city not like 'south%';

use orders;
# 8.	Write a query to display the all the records of customers whose creation date is before 
# ’12-Jan-2006’ and email address contains ‘gmail’ or ‘yahoo’ and user name starts with ‘dave’.
select *
from online_customer
where CUSTOMER_CREATION_DATE < '2006-01-12' and customer_email rlike '.*gmail|yahoo' and CUSTOMER_USERNAME like 'dave%';

# 9.	Write query to display the product id,product_description and 
# total worth(product_price * product_quantity available) of each product.
# (60 rows)[NOTE : PRODUCT TABLE]
select product_id,product_desc, PRODUCT_PRICE * PRODUCT_QUANTITY_AVAIL 'total worth' from product;

# 10.	Write a query to Display details of customer who have Gmail account and phone number consist of ‘77’ as below:
#  <Customer full name> (<customer user name>) created on <date>. Contact Phone: <Phone no.> E-mail: <E-mail id>.
# (6 rows)[NOTE : ONLINE_CUSTOMER TABLE]
select concat(customer_fname,' ',customer_lname,'(',
customer_username, ') created on ',customer_creation_date,'. Contact Phone: ',customer_phone,' E-mail:',customer_email ) message
from online_customer
where customer_email like '%gmail.com' and customer_phone like '%77%';

# 11.	Write a query to Show the count of cities in all countries other than US & UK, with more than 1 city, 
# in the descending  order of country id.
# (4 rows)[NOTE : LOCATION TABLE]
use hr;
select country_id,count(city) count 
from locations
where country_id not rlike 'US|UK'
group by country_id
having count(city) > 1
order by country_id;








 












