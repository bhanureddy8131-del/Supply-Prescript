create database supply_prescript;
select * from supply_prescript.datacosupplychaindataset;
describe datacosupplychaindataset;
use supply_prescript ;
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
CREATE TABLE products (
    product_card_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category_id INT,
    category_name VARCHAR(100),
    department_id INT,
    department_name VARCHAR(100),
    product_price DOUBLE
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date VARCHAR(50),
    order_city VARCHAR(100),
    order_state VARCHAR(100),
    order_country VARCHAR(100),
    market VARCHAR(100),
    sales DOUBLE,
    order_item_quantity INT,
    order_profit_per_order DOUBLE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE shipments (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    shipping_mode VARCHAR(50),
    delivery_status VARCHAR(50),
    late_delivery_risk INT,
    days_for_shipping_real INT,
    days_for_shipment_scheduled INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
CREATE TABLE predictions (
    prediction_id INT AUTO_INCREMENT PRIMARY KEY,
    shipment_id INT,
    predicted_delay_days INT,
    predicted_risk VARCHAR(50),
    prediction_date DATE,
    FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id)
);
CREATE TABLE decisions (
    decision_id INT AUTO_INCREMENT PRIMARY KEY,
    prediction_id INT,
    recommended_action VARCHAR(100),
    selected_action VARCHAR(100),
    decision_date DATE,
    FOREIGN KEY (prediction_id) REFERENCES predictions(prediction_id)
);
CREATE TABLE outcomes (
    outcome_id INT AUTO_INCREMENT PRIMARY KEY,
    decision_id INT,
    actual_delay_days INT,
    actual_cost DOUBLE,
    outcome_date DATE,
    FOREIGN KEY (decision_id) REFERENCES decisions(decision_id)
);
SHOW COLUMNS FROM datacosupplychaindataset;
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

select count(*) from customers ;
drop table products;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_card_id INT,
    product_name VARCHAR(200),
    category_id INT,
    category_name VARCHAR(100),
    department_id INT,
    department_name VARCHAR(100),
    product_price DOUBLE
);
INSERT INTO products
(product_card_id,
product_name,
category_id,
category_name,
department_id,
department_name,
product_price)

SELECT
`Product Card Id`,
`Product Name`,
`Product Category Id`,
`Category Name`,
`Department Id`,
`Department Name`,
`Product Price`
FROM datacosupplychaindataset;
select count(*) from products;

INSERT INTO orders
(order_id,
 customer_id,
 order_date,
 order_city,
 order_state,
 order_country,
 market,
 sales,
 order_item_quantity,
 order_profit_per_order)

SELECT DISTINCT
`Order Id`,
`Customer Id`,
`order date (DateOrders)`,
`Order City`,
`Order State`,
`Order Country`,
`Market`,
`Sales`,
`Order Item Quantity`,
`Order Profit Per Order`

FROM datacosupplychaindataset;
select count(*) from orders ;
describe shipments ;
INSERT INTO shipments
(order_id,
shipping_mode,
delivery_status,
late_delivery_risk,
days_for_shipping_real,
days_for_shipment_scheduled)

SELECT DISTINCT
`Order Id`,
`Shipping Mode`,
`Delivery Status`,
`Late_delivery_risk`,
`Days for shipping (real)`,
`Days for shipment (scheduled)`

FROM datacosupplychaindataset;
select count(*) from shipments ;
describe predictions ;

INSERT INTO predictions
(shipment_id,
predicted_delay_days,
predicted_risk,
prediction_date)

SELECT DISTINCT
1,
`Days for shipping (real)` - `Days for shipment (scheduled)`,
CASE
    WHEN `Late_delivery_risk` = 1 THEN 'High'
    ELSE 'Low'
END,
CURDATE()

FROM datacosupplychaindataset;
select count(8) from predictions ;
describe decisions ;
INSERT INTO decisions
(prediction_id,
recommended_action,
selected_action,
decision_date)

SELECT
prediction_id,
CASE
    WHEN predicted_risk = 'High' THEN 'Expedite Shipment'
    ELSE 'Normal Shipping'
END,
CASE
    WHEN predicted_risk = 'High' THEN 'Expedite Shipment'
    ELSE 'Normal Shipping'
END,
CURDATE()

FROM predictions;
select count(*) from decisions ;
describe outcomes ;
INSERT INTO outcomes
(decision_id,
actual_delay_days,
actual_cost,
outcome_date)

SELECT
decision_id,
2,
100.00,
CURDATE()

FROM decisions;
select count(*) from outcomes ;
