use supply_prescript;
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