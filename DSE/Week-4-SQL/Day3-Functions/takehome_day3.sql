use orders;

#1
SELECT 
    product_class_code,
    product_id,
    product_desc,
    CASE
        WHEN product_class_code = 2050 THEN product_price + 2000
        WHEN product_class_code = 2051 THEN product_price + 500
        WHEN product_class_code = 2052 THEN product_price + 600
        ELSE product_price
    END AS product_price
FROM
    product
ORDER BY product_class_code;

#2
SELECT 
    p.product_desc, pc.product_class_desc, p.product_price
FROM
    product_class pc
        INNER JOIN
     product p ON p.product_class_code = pc.product_class_code
        INNER JOIN
    order_items o ON p.product_id = o.product_id
        INNER JOIN
    order_header oh ON o.order_id = oh.order_id
where order_status = 'Shipped';

#3
SELECT 
    oc.customer_id, CONCAT(CUSTOMER_FNAME,' ' ,CUSTOMER_LNAME) 'full_name', sum(product_quantity) 'total quantity'
FROM
    online_customer oc inner join order_header oh on oc.customer_id = oh.customer_id 
    inner join order_items oi on oh.ORDER_ID = oi.ORDER_ID
where 
	oi.order_id > 10060
	group by customer_id  
order by full_name;

#4 
# Write a query to display the customer_id,customer full name ,city,pincode,and 
# order details (order id,order date, product class desc, product desc, subtotal(product_quantity * product_price)) for orders shipped to 
# cities whose pin codes do not have any 0s in them. Sort the output on customer name, order date and subtotal.(52 ROWS) 
SELECT 
    oc.customer_id,
    CONCAT(CUSTOMER_FNAME, ' ', CUSTOMER_LNAME) 'full_name',
    ad.city,
    ad.pincode,
    oh.order_id,
    oh.order_date,
    p.product_desc,
    product_quantity * product_price 'subtotal'
FROM
    address ad
        INNER JOIN
    online_customer oc ON oc.address_id = ad.address_id
        INNER JOIN
    order_header oh ON oc.customer_id = oh.customer_id
        INNER JOIN
    order_items oi ON oi.order_id = oh.order_id
        INNER JOIN
    product p ON p.product_id = oi.product_id
        INNER JOIN
    product_class pc ON pc.product_class_code = p.product_class_code
WHERE
    ad.pincode NOT LIKE '%0%'
ORDER BY full_name , oh.order_date , subtotal
;

#5 
drop view if exists product_info;
drop view if exists order_info;

create view product_info as
select * 
from product p natural join product_class pc;
create view order_info as
select *
from order_items natural join order_header;

select distinct oc.customer_id,CONCAT(oc.CUSTOMER_FNAME, ' ', oc.CUSTOMER_LNAME) 'full_name',a.city,a.state
from online_customer oc inner join address a on a.address_id = oc.address_id
inner join order_info oi on oi.customer_id = oc.customer_id
inner join product_info pi on pi.product_id = oi.product_id
where state not like 'karnataka' and pi.product_class_desc not in ('Toys','Books');

#6
select customer_id,CONCAT(CUSTOMER_FNAME, ' ', CUSTOMER_LNAME) full_name,
order_id,sum(PRODUCT_QUANTITY)
from online_customer natural join order_info
group by order_id
having sum(product_quantity) > 10; 

#7
select CONCAT(oc.CUSTOMER_FNAME, ' ', oc.CUSTOMER_LNAME) full_name, sum(oi.product_quantity * p.product_price) as 'total order value'
from online_customer oc natural join order_info oi natural join product p
group by customer_id
having sum(oi.product_quantity * p.product_price) > 100000;

#8
select oi.order_id,CONCAT(oc.CUSTOMER_FNAME, ' ', oc.CUSTOMER_LNAME) full_name, sum(oi.product_quantity)  as 'total quantity of products'
from online_customer oc natural join order_info oi natural join product p
where oi.order_id > 10060
group by oi.order_id;

#9
select product_class_desc, product_id, product_desc, product_quantity_avail,
case
	when product_class_desc in ('Electronics','Computer') and product_quantity_avail < 10 then 'Low quantity'
	when product_class_desc in ('Electronics','Computer') and product_quantity_avail between 10 and 30 then 'In stock'
	when product_class_desc in ('Electronics','Computer') and product_quantity_avail > 30 then 'Enough quantity'
	when product_class_desc in ('Stationery','Clothes') and product_quantity_avail < 20 then 'Low quantity'
	when product_class_desc in ('Stationery','Clothes') and product_quantity_avail between 20 and 80 then 'In stock'
	when product_class_desc in ('Stationery','Clothes') and product_quantity_avail > 80 then 'Enough quantity'
	when product_class_desc not in ('Stationary','Clothes','Electronics','Computer') and product_quantity_avail < 15 then 'Low quantity'
	when product_class_desc not in ('Stationary','Clothes','Electronics','Computer') and product_quantity_avail between 15 and 50  then 'In stock'
	else 'Enough quantity'
end as 'Inventory status'
from product_info;