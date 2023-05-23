/* Create database*/

CREATE DATABASE modern_walk;

USE modern_walk;

/*Create customer table*/
CREATE TABLE customer_T
(customer_id int(11) not null auto_increment,
customer_last_name varchar(30) not null,
customer_middle_name varchar (30),
customer_first_name varchar (30) not null,
birthday date not null,
gender varchar (30) not null,
street varchar (30) not null,
city varchar(30) not null,
state varchar(30) not null,
zipcode int (11) not null,
customer_email varchar(50) not null,
CONSTRAINT customer_pk PRIMARY KEY (customer_id))
ENGINE=INNODB;

/*Create order table*/
CREATE TABLE order_T
(order_id int(11) not null auto_increment,
subtotal double not null,
order_date date not null,
CONSTRAINT order_pk PRIMARY KEY (order_id));



/*Create payment table*/
CREATE TABLE payment_T
(payment_id int(11) not null auto_increment,
payment_amount double not null,
payment_date date not null,
payment_type varchar(30) not null,
customer_id int(11) not null,
order_id int(11) not null,
CONSTRAINT payment_pk PRIMARY KEY (payment_id),
CONSTRAINT payment_fk1 FOREIGN KEY (customer_id)
REFERENCES customer_T (customer_id)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT payment_fk2 FOREIGN KEY (order_id)
REFERENCES order_T (order_id)
ON UPDATE CASCADE ON DELETE RESTRICT);

/*Create category table*/
CREATE TABLE category_T
(category_id int(11) not null auto_increment,
category_name varchar (50) not null,
CONSTRAINT category_pk PRIMARY KEY (category_id))
ENGINE=INNODB;

/*Create product table*/
CREATE TABLE product_T
(product_id int(11) not null auto_increment,
product_name varchar(50) not null,
product_price double not null,
category_id int(11) not null,
CONSTRAINT product_pk PRIMARY KEY (product_id),
CONSTRAINT product_fk FOREIGN KEY (category_id)
REFERENCES category_T (category_id)
ON UPDATE CASCADE ON DELETE RESTRICT);

/*Create order_detail table*/
CREATE TABLE order_detail_T
(detail_id int(11) not null auto_increment,
order_quantity int(11) not null,
order_product_price double not null,
product_id int(11) not null,
order_id int(11) not null,
CONSTRAINT order_detail_pk PRIMARY KEY (detail_id),
CONSTRAINT order_detail_fk1 FOREIGN KEY (product_id)
REFERENCES product_T (product_id) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT order_detail_fk2 FOREIGN KEY (order_id)
REFERENCES order_T (order_id)
ON UPDATE CASCADE ON DELETE RESTRICT);

/*Create shipper table*/
CREATE TABLE shipper_T
(shipper_id int(11) not null auto_increment,
shipper_name varchar (30) not null,
shipper_phone_number varchar(30) not null,
CONSTRAINT shipper_pk PRIMARY KEY (shipper_id));

/*Create shipment table*/
CREATE TABLE shipment_T
(tracking_no int(11) not null auto_increment,
shipment_date date not null,
shipper_id int(11) not null,
customer_id int(11) not null,
order_id int(11) not null,
CONSTRAINT shipment_pk PRIMARY KEY (tracking_no),
CONSTRAINT shipment_fk1 FOREIGN KEY (shipper_id)
REFERENCES shipper_T (shipper_id) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT shipment_fk2 FOREIGN KEY (customer_id)
REFERENCES customer_T (customer_id) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT shipment_fk3 FOREIGN KEY (order_id)
REFERENCES order_T (order_id) ON UPDATE CASCADE ON DELETE RESTRICT);

/*Create supplier table*/
CREATE TABLE supplier_T
(supplier_id int(11) not null auto_increment,
supplier_name varchar (50) not null,
supplier_phone_number varchar(30) not null,
supplier_address varchar(50) not null,
supplier_email varchar (50) not null,
CONSTRAINT supplier_pk PRIMARY KEY (supplier_id)); 

/*Create supply_list table*/
CREATE TABLE supply_list_T
(product_id int(11) not null,
supplier_id int(11) not null,
supply_quantity int(11) not null,
supply_date date not null,
CONSTRAINT supply_list_pk PRIMARY KEY (product_id, supplier_id),
CONSTRAINT supply_list_fk1 FOREIGN KEY (product_id)
REFERENCES product_T (product_id) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT supply_list_fk2 FOREIGN KEY (supplier_id)
REFERENCES supplier_T (supplier_id) ON UPDATE CASCADE ON DELETE RESTRICT);