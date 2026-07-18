create database supply_prescript;
USE supply_prescript;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_fname VARCHAR(100),
    customer_lname VARCHAR(100),
    customer_email VARCHAR(255),
    customer_city VARCHAR(100),
    customer_state VARCHAR(100),
    customer_country VARCHAR(100),
    customer_zipcode INT,
    customer_segment VARCHAR(100)
    );
    
    INSERT INTO customers
(customer_id, customer_fname, customer_lname, customer_email,
customer_city, customer_state, customer_country, customer_zipcode, customer_segment)

SELECT DISTINCT
`Customer Id`,
`Customer Fname`,
`Customer Lname`,
`Customer Email`,
`Customer City`,
`Customer State`,
`Customer Country`,
`Customer Zipcode`,
`Customer Segment`
FROM datacosupplychaindataset;

select * from customers ;
select count(*)from customers ;