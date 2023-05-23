
/* Insert values to customer table */
INSERT INTO customer_t (customer_last_name,customer_middle_name,customer_first_name,birthday,gender,street,city,state,zipcode,customer_email)
VALUES ('Burks','hans','debra','1999-01-02','male','9273 thomes ave','san francisco','CA','94117','burkshans@gmail.com'),
('Kasha','Pals','todd','1985-11-21','male','769 west road','seattle','WA','98101','kptodd@gmail.com'),
('Tameka','dounce','fisher','2002-06-12','male','107 river drive','new york city','NY','10005','tamekafisher258@yahoo.com'),
('Lyndsey','lee','bean','1982-01-15','female','15 brown street','salt lake city','UT','84109','leebean0115@gmail.com'),
('pamela','wooden','newman','1989-08-20','female','8550 spurce drive','boston','MA','22108','pamela1989@outlook.com'),
('Jacquline','ricey','duncan','1998-09-13','female','476 cheastnut ave','campell','CA','95008','kricey0913@qq.com'),
('Alfreds','futterkiste','moreal','1978-11-26','male','476 cheastnut ave','Fomey','TX','97516','alfredm1126d@yahoo.com'),
('ana','taqueria','newton','1999-06-27','female','3550 golden gate ave','san jose','CA','95126','ananewtono2036@hotmail.com');

SELECT* FROM customer_T;

/* Insert values to order table */
INSERT INTO order_t (subtotal,order_date)
VALUES  (833,'2022-10-25'),
(108,'2022-10-26'),
(700,'2022-10-26'),
(1274,'2022-10-27'),
(280,'2022-10-28'),
(80,'2022-10-28'),
(258,'2022-11-02'),
(392,'2022-11-02'),
(610,'2022-11-03');



/* Insert values to payemnt table */
INSERT INTO payment_t (payment_amount,payment_date,payment_type,customer_id,order_id)
VALUES (833,'2022-10-26','DC',2,1),
(108,'2022-10-26','CC',3,2),
(700,'2022-10-26','CC',6,3),
(1274,'2022-10-27','DC',8,4),
(280,'2022-10-28','CC',6,5),
(80,'2022-10-28','DC',5,6),
(258,'2022-11-02','CC',4,7),
(392,'2022-11-02','DC',3,8),
(600,'2022-11-03','DC',2,9),
(10,'2022-11-04','DC',2,9);

/* Insert values to category table */
INSERT INTO category_t (category_name)
VALUES ('coat'),
('shoes'),
('bag'),
('accessories'),
('beachwear'),
('pants'),
('lingerie'),
('dress'),
('activewear'),
('suits');


/* Insert values to product table */
INSERT INTO product_t (product_name,product_price,category_id)
VALUES ('moonboot',175,2),
('browns base layer ski top',149,9),
('browsn base layer ski leggins',120,9),
('Guccy single breasted tailored coat',108,1),
('medium carolyn tote bag',350,3),
('down feather 4bar overcoat',395,1),
('medusa greek key bar',140,7),
('halterneck evening dress',1274,8),
('marina jumpsuit',120,10),
('strapless swimsut',69,5),
('logo-patch padded zip-up vest',450,9),
('interlock print silk scarf',95,4),
('duchesse cargo trouser',76,6),
('slouchy 105mm leather boots',780,3),
('bon bon crystal bucket',469,4),
('cat eye fram sunglasses',196,5),
('barocco-panel logo devore robe',80,7),
('Bea single-breasted boxy blazer',258,10),
('Parka II oversized ski jacket',610,9);

/* Insert values to order_detail_t table */
INSERT INTO order_detail_t (order_quantity,order_product_price,product_id,order_id)
VALUES (1,175,1,1),
(2,149,2,1),
(3,120,3,1),
(1,108,4,2),
(2,350,5,3),
(1,1274,8,4),
(2,140,7,5),
(1,80,17,6),
(1,258,18,7),
(2,196,16,8),
(1,610,19,9);

/* Insert values to shipper_t table */
INSERT INTO shipper_t (shipper_name,shipper_phone_number)
VALUES ('fastly','800-288-2828'),
('speedy','258-2583-522'),
('Rapid Crew','147-025-3691'),
('Maersk','963-145-2035'),
('Flashy','415-203-9652'),
('cosco','825-914-8635');

/* Insert values to shipment table */

INSERT INTO shipment_t (tracking_no,shipment_date,shipper_id,customer_id,order_id)
VALUES (1000001,'2022-10-28',1,2,1);
INSERT INTO shipment_t (shipment_date,shipper_id,customer_id,order_id)
VALUES ('2022-11-4',3,8,2),
 ('2022-11-5',6,7,3),
('2022-10-28',4,3,4),
('2022-11-4',2,4,9),
('2022-11-4',5,6,8),
 ('2022-11-4',3,1,7);
 
 /* Insert values to supplier table */
INSERT INTO supplier_t (supplier_name,supplier_phone_number,supplier_address,supplier_email)
VALUES ('AIM garments','259-025-1472','25 Maple Street Carmel, IN','aim25@gmail.com'),
('Aplex Mills','417-325-1025','660 Oak Street Cary, NC','aplex@yahoo.com'),
('Hollingsworth','102-022-1458','660 golden gate Street Fairlawn, OH','hollingsworth@outlook.com'),
('Tabb','810-025-3252','1520 Main street Southfield, MI','tabbthebest@gmail.com'),
('Emco','926-596-1466','580 16th Ave Great Neck, NY','emco2528@yahoo.com'),
('Saint Gobain','597-225-2678','652 milkway Rd Gaffney, SC','sg5285@gmail.com');

SELECT * FROM supplier_T;


 /* Insert values to supplier table */
INSERT INTO supply_list_t (product_id,supplier_id,supply_quantity,supply_date)
VALUES (1,2,10,'2022-05-06'),
(2,3,20,'2022-06-04'),	
(3,4,15,'2022-05-06'),	
(4,3,80,'2022-06-12'),	
(5,6,10,'2022-05-12'),	
(6,1,22,'2022-07-16'),	
(7,5,16,'2022-08-06'),	
(8,2,32,'2022-09-06'),	
(16,5,6,'2022-10-06'),	
(17,6,9,'2022-07-12'),	
(18,4,20,'2022-07-22'),	
(19,3,15,'2022-05-18');
 

SELECT * FROM order_detail_T;



 






