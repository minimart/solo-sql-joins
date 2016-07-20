--Get all customers and their addresses.
SELECT * FROM customers JOIN addresses ON customers.id = addresses.customer_id;

--Get all orders and their line items.
SELECT * FROM orders JOIN line_items ON line_items.order_id = orders.id;

--Which warehouses have cheetos?
SELECT * FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description LIKE 'cheeto%';

--Which warehouses have diet pepsi?
SELECT * FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description LIKE 'diet pepsi';

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT concat(customers.first_name, ' ', customers.last_name) AS name, count(orders.*) FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
GROUP BY customers.id;

--How many customers do we have?
SELECT count(id) FROM customers;

--How many products do we carry?
SELECT count(id) FROM products;

--What is the total available on-hand quantity of diet pepsi?

SELECT sum(wp.on_hand) FROM products AS p
JOIN warehouse_product AS wp ON p.id = wp.product_id
WHERE p.description = 'diet pepsi';