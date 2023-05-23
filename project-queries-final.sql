 /* 1.checking which customer has not placed orders */
 SELECT c.*
 FROM customer_t c LEFT JOIN  payment_t p
 ON c.customer_id = p.customer_id
 WHERE payment_id IS NULL;
 
 
 /* 2.checking the number of order of each state  */
 SELECT state,count(o.order_id) as number_of_order
 FROM customer_t c LEFT JOIN payment_t p
 ON c.customer_id = p.customer_id
LEFT JOIN order_t o
ON p.order_id = o.order_id
GROUP BY c.state;


 /*3.find the customer who lives in CA whose the amount of order is grater than 200 and who purchased product_id = 5 */
SELECT c.*
FROM customer_t c 
INNER JOIN payment_t t ON c.customer_id = t.customer_id
INNER JOIN order_t o ON t.order_id = o.order_id
INNER JOIN order_detail_t od ON o.order_id = od.order_id
WHERE c.state = 'CA' and O.subtotal > 200 and od.product_id =5;



 /* 4.list all the order information after 5% discount*/
 SELECT * , subtotal *0.95 AS discounted_price FROM order_T;

 
 /* 5.which supplier has not never supply product */
 SELECT *
 FROM supplier_t s LEFT JOIN supply_list_t sl
 ON s.supplier_id =sl.supplier_id
 WHERE sl.supplier_id IS NULL;

 
 
 /* View*/
 
 /*1. calculate the total amount of sales*/
 CREATE VIEW v_salesamount AS
 SELECT sum(subtotal) AS total_amount_of_sales
 FROM order_T;
 
 SELECT * FROM v_salesamount;

 
 /*2. get the top 3 highest revenue  of product */
 CREATE VIEW v_top3revenue AS
 SELECT product_T.product_id, product_T.product_name, sum(order_quantity * order_detail_T.order_product_price) AS product_revenue
 FROM order_detail_T INNER JOIN product_T
 ON order_detail_T.product_id = product_T.product_id
 GROUP BY order_detail_T.product_id
 ORDER BY  product_revenue DESC
 LIMIT 3;


 SELECT * FROM v_top3revenue;

 

 /*Procedure*/
 
  /*1. calculate the total amount of sales by state*/
DELIMITER $$
CREATE procedure storedproc_statesale(state_name VARCHAR(50))
BEGIN
SELECT c.state,
CASE 
WHEN sum(o.subtotal) IS NULL THEN  0
ELSE sum(o.subtotal)
END AS total_sales
FROM customer_t c LEFT JOIN payment_t p ON c.customer_id = p.customer_id
LEFT JOIN order_t o ON o.order_id = p.order_id
WHERE state_name = c.state;
END $$
DELIMITER ;

 CALL storedproc_statesale('CA');
 
   /*2. get the supplier info by entering specific product id*/
 DELIMITER $$
CREATE procedure storedproc_suppinfobyid(prod_id INT)
BEGIN
SELECT p.product_id,
CASE  WHEN s.supplier_name IS NULL THEN  'the product has not been supplied yet'
ELSE s.supplier_name 
END AS supplier_name,
s.supplier_id,s.supplier_address,s.supplier_phone_number,s.supplier_email
FROM product_t p LEFT JOIN supply_list_t sl
ON p.product_id = sl.product_id
LEFT JOIN supplier_t s ON sl.supplier_id = s.supplier_id
WHERE prod_id = p.product_id;
END $$
DELIMITER ;

 CALL storedproc_suppinfobyid(17);




 