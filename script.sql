-- DESIGN AND CREATE A RELATIONAL NORMALISED DATABASE CALLED 'CUSTOMERS'
CREATE DATABASE CUSTOMERS;
USE CUSTOMERS;
-- SET REASONABLE PRIMARY KEYS TO THE TABLES 
-- SET NOT NULL CONSTRAINTS ON THE COLUMNS YOU THINK MUST HAVE VALUES
CREATE TABLE CUSTOMER(
  customer_id INTEGER PRIMARY KEY, 
  first_name VARCHAR(30), 
  last_name VARCHAR(30) NOT NULL
);
CREATE TABLE address (
  address_id INTEGER PRIMARY KEY, 
  building_number VARCHAR(55) NOT NULL, 
  street VARCHAR(55) NOT NULL, 
  city VARCHAR(55), 
  post_code VARCHAR(55) NOT NULL, 
  country VARCHAR(55)
);
CREATE TABLE email_address (
  email_address_id INTEGER NOT NULL, 
  email_address_customer_id INTEGER, 
  email_address VARCHAR(55) NOT NULL, 
  CONSTRAINT PK_email_address PRIMARY KEY (email_address_id)
);
CREATE TABLE phone_number (
  phone_number_id INTEGER PRIMARY KEY, 
  phone_number_customer_id INTEGER NOT NULL, 
  phone_number VARCHAR(55) NOT NULL
);
CREATE TABLE orders (
  order_id INTEGER NOT NULL, 
  orders_customer_id INTEGER NOT NULL, 
  order_date DATE NOT NULL, 
  CONSTRAINT PK_order_id PRIMARY KEY (order_id)
);
-- ALTER TABLE 'ORDERS' TO ADD A FOREIGN KEY REFERENCING 'CUSTOMER' TABLE
ALTER TABLE 
  orders 
ADD 
  CONSTRAINT fk_orders_customer_id FOREIGN KEY (orders_customer_id) REFERENCES customer (customer_id);
-- ADD SOME DATA INTO THE 'CUSTOMERS' DATABASE
INSERT INTO customer (
  customer_id, first_name, last_name
) 
VALUES 
  (1, 'John', 'Doe'), 
  (2, 'Jane', 'Doe');
INSERT INTO address (
  address_id, building_number, street, 
  city, post_code, country
) 
VALUES 
  (
    1, '20A', 'Sunflower Street', 'London', 
    'W6 4TH', 'England'
  ), 
  (
    2, '14', 'Waterloo Drive', 'Brighton', 
    'B14 2TH', 'England'
  );
INSERT INTO email_address (
  email_address_id, email_address_customer_id, 
  email_address
) 
VALUES 
  (1, 1, 'hello@johndoe.com'), 
  (2, 2, 'hello@janedoe.com');
INSERT INTO phone_number (
  phone_number_id, phone_number_customer_id, 
  phone_number
) 
VALUES 
  (01611234567, 1, 1), 
  (01511234567, 2, 2);
-- ALTER TABLES EMAIL_ADDRESS AND PHONE_NUMBER TO ADD FOREIGN KEYS
ALTER TABLE 
  email_address 
ADD 
  CONSTRAINT fk_email_address_customer_id FOREIGN KEY (email_address_customer_id) REFERENCES customer (customer_id);
ALTER TABLE 
  phone_number 
ADD 
  CONSTRAINT fk_phone_number_customer_id FOREIGN KEY (phone_number_customer_id) REFERENCES customer (customer_id);
-- REMOVE THE TABLE CALLED ORDERS FROM THE DATABASE
DROP 
  TABLE orders;
