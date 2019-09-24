use orders;

#1
select customer_id,order_id,ORDER_DATE,ORDER_SHIPMENT_DATE
from order_header
where ORDER_SHIPMENT_DATE is not null
order by customer_id, ORDER_DATE desc;

#2
select * from order_header
where order_status = 'Shipped' and payment_mode in ('Credit Card','Net Banking') and payment_date > '2013-01-01';

select * from order_header
where order_status = 'Shipped' and payment_date > '2013-01-01'and (payment_mode = 'Credit Card' or payment_mode ='Net Banking');

#3 
select concat(customer_fname,' ',customer_lname,' (',CUSTOMER_USERNAME,') created on ',CUSTOMER_CREATION_DATE,
'. Contact Phone:',CUSTOMER_PHONE,' E-mail:',CUSTOMER_EMAIL) as detail
from online_customer
where customer_email like '%gmail%' and customer_phone like '%77%';

#4
use hr;
select country_id,count(city)
from locations
where country_id not in ('US','UK')
group by country_id
having count(city)>1
order by country_id desc;

use orders;
select state, count(city)
from address
where state not in ('US','UK')
group by state
having count(city)>1
order by state desc;

#5
select oc.customer_id, oc.customer_fname, oc.customer_email,
ifnull(oi.order_id,0) "order id", ifnull(p.PRODUCT_DESC,0) product_desc,ifnull(oi.product_quantity,0) as product_quantity
,oi.product_quantity * p.product_price as 'Subtotal'
from online_customer as oc left join order_header oh on oh.customer_id = oc.customer_id 
left join order_items oi on oi.order_id = oh.order_id 
left join product p on p.product_id = oi.product_id
;

 -- desc online_customer,order_header,order_items,product;







