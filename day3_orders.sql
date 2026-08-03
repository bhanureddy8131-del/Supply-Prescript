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