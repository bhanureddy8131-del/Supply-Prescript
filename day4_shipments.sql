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