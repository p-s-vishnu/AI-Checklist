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







