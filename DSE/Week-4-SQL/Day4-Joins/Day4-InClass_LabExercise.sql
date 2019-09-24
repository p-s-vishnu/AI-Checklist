USE hr;
/*	1.	Write a query to display emp_name, state, age of an employee whose dept_id = 1(Use:Sub-query).	*/
SELECT concat(first_name, ' ', last_name) AS "full_name", state_province
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
WHERE employee_id IN (
		SELECT employee_id FROM employees
        WHERE department_id = 10);

/*	2.	Write a query to display the dept_id, maximum salary, provided show the departments
		whose maximum salary is less than the average salary.(USE:SUB-QUERY)	*/
# It is not possible to have max value of a group to be less than avg value
SELECT department_id, max(salary) AS "maximum_salary"
FROM employees
WHERE department_id IN(
		SELECT department_id
		FROM employees
		WHERE department_id IS NOT NULL
		GROUP BY department_id HAVING max(salary)<avg(salary));

/*	3.	Write a query to display emp_id,dept_id of the employees whose salary is higher than emp_id = 02. (USE:SUB-QUERY)	*/
SELECT employee_id, department_id
FROM employees
WHERE salary > (
		SELECT salary FROM employees
        WHERE employee_id = 102);

/*	4.	Write a query to display emp_id,salary of the employees whose salary ranges from minimum salary to 35000. (USE:SUB-QUERY)	*/
SELECT employee_id, salary
FROM employees
WHERE salary BETWEEN (SELECT min(salary) FROM employees) AND 35000;

USE day3_inclass;
/*	5.	Write a query to display the cust_id,first_name,last_name,sales_id who have not purchased any product or made any sales.
		(1 ROW) (USE:SUB-QUERY)	*/
SELECT * FROM customer
WHERE cust_id IN (
		SELECT cust_id FROM customer
		WHERE sales_id IS NULL);

/*	6.	Write a query to display cust_id,first_name,last_name Of the customers whose second letter start with ‘a’. (USE:SUB-QUERY).	*/
SELECT cust_id, first_name, last_name FROM customer
WHERE cust_id IN (
		SELECT cust_id FROM customer
        WHERE first_name LIKE '_a%');

/*	7.	Write a query to display the product_name,product_id, Price, provided show the second highest priced product. (USE:SUB-QUERY).	*/
SELECT * FROM product
WHERE price = (
		SELECT distinct price
		FROM product
		ORDER BY price DESC
		LIMIT 1,1);
        
/*	8.	Write a Query to display the product_id,product_name and list which of the other products were  bought apart from ‘P01’.
		(Use Exists)(2 ROWS)(USE:SUB-QUERY)	*/
SELECT product_id, product_name
FROM product po
WHERE product_id <> "P01"
AND EXISTS (
		SELECT * FROM sales si
        WHERE po.product_id = si.product_id);
        
/*	9.	Write a query to display the product_id,product_name,order_quantity and list which of the other products were bought
		apart from ‘P01’ provided their total order_quantity bought is greater than 75.
		(1 ROWS)(USE:SUB-QUERY)	*/
SELECT po.product_id, product_name, order_quantity
FROM product po
INNER JOIN orders oo ON po.product_id = oo.product_id
AND po.product_id <> "P01"
AND 75 < (
		SELECT sum(order_quantity) FROM orders oi
        WHERE po.product_id = oi.product_id);
        
/*	10.	Write a query to display product_id,product_name,total_quantity(sum(order_quantity), Provided find the most and least sold products (quantity-wise).
		(2 ROWS)(USE:SUB-QUERY).	*/
SELECT po.product_id, product_name, sum(order_quantity) AS "total_quantity"
FROM product po
INNER JOIN orders oo ON po.product_id = oo.product_id
GROUP BY po.product_id, product_name
HAVING sum(order_quantity) = (
		SELECT sum(order_quantity)
        FROM orders oi
        GROUP BY product_id
        ORDER BY 1 DESC
        LIMIT 1)
OR sum(order_quantity) = (
		SELECT sum(order_quantity)
        FROM orders oi
        GROUP BY product_id
        ORDER BY 1
        LIMIT 1);