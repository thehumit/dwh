INSERT INTO manufacturers (manufacturer_name) VALUES ('Manufacturer 1');
INSERT INTO manufacturers (manufacturer_name) VALUES ('Manufacturer 2');
INSERT INTO manufacturers (manufacturer_name) VALUES ('Manufacturer 3');
INSERT INTO manufacturers (manufacturer_name) VALUES ('Manufacturer 4');
INSERT INTO manufacturers (manufacturer_name) VALUES ('Manufacturer 5');

INSERT INTO categories (category_name) VALUES ('Electronics');
INSERT INTO categories (category_name) VALUES ('Books');
INSERT INTO categories (category_name) VALUES ('Clothing');
INSERT INTO categories (category_name) VALUES ('Home Appliances');
INSERT INTO categories (category_name) VALUES ('Toys');

INSERT INTO products (product_name, category_id, manufacturer_id) VALUES ('Product 1', 1, 1);
INSERT INTO products (product_name, category_id, manufacturer_id) VALUES ('Product 2', 2, 2);
INSERT INTO products (product_name, category_id, manufacturer_id) VALUES ('Product 3', 3, 3);
INSERT INTO products (product_name, category_id, manufacturer_id) VALUES ('Product 4', 4, 4);
INSERT INTO products (product_name, category_id, manufacturer_id) VALUES ('Product 5', 5, 5);

INSERT INTO stores (store_name) VALUES ('Store 1');
INSERT INTO stores (store_name) VALUES ('Store 2');
INSERT INTO stores (store_name) VALUES ('Store 3');
INSERT INTO stores (store_name) VALUES ('Store 4');
INSERT INTO stores (store_name) VALUES ('Store 5');

INSERT INTO customers (customer_fname, customer_lname) VALUES ('John', 'Doe');
INSERT INTO customers (customer_fname, customer_lname) VALUES ('Jane', 'Smith');
INSERT INTO customers (customer_fname, customer_lname) VALUES ('Alice', 'Johnson');
INSERT INTO customers (customer_fname, customer_lname) VALUES ('Bob', 'Brown');
INSERT INTO customers (customer_fname, customer_lname) VALUES ('Carol', 'Davis');

INSERT INTO price_change (product_id, price_change_ts, new_price) VALUES (1, '2023-01-01 00:00:01', 19.99);
INSERT INTO price_change (product_id, price_change_ts, new_price) VALUES (2, '2023-01-02 00:00:01', 29.99);
INSERT INTO price_change (product_id, price_change_ts, new_price) VALUES (3, '2023-01-03 00:00:01', 39.99);
INSERT INTO price_change (product_id, price_change_ts, new_price) VALUES (4, '2023-01-04 00:00:01', 49.99);
INSERT INTO price_change (product_id, price_change_ts, new_price) VALUES (5, '2023-01-05 00:00:01', 59.99);

INSERT INTO deliveries (store_id, product_id, delivery_date, product_count) VALUES (1, 1, '2023-01-01 09:00:00', 100);
INSERT INTO deliveries (store_id, product_id, delivery_date, product_count) VALUES (2, 2, '2023-01-02 09:00:00', 150);
INSERT INTO deliveries (store_id, product_id, delivery_date, product_count) VALUES (3, 3, '2023-01-03 09:00:00', 200);
INSERT INTO deliveries (store_id, product_id, delivery_date, product_count) VALUES (4, 4, '2023-01-04 09:00:00', 250);
INSERT INTO deliveries (store_id, product_id, delivery_date, product_count) VALUES (5, 5, '2023-01-05 09:00:00', 300);

INSERT INTO purchases (store_id, customer_id, purchase_date) VALUES (1, 1, '2023-01-01 10:00:00');
INSERT INTO purchases (store_id, customer_id, purchase_date) VALUES (2, 2, '2023-01-02 11:00:00');
INSERT INTO purchases (store_id, customer_id, purchase_date) VALUES (3, 3, '2023-01-03 12:00:00');
INSERT INTO purchases (store_id, customer_id, purchase_date) VALUES (4, 4, '2023-01-04 13:00:00');
INSERT INTO purchases (store_id, customer_id, purchase_date) VALUES (5, 5, '2023-01-05 14:00:00');

INSERT INTO purchase_items (purchase_id, product_id, product_count, product_price) VALUES (1, 1, 2, 19.99);
INSERT INTO purchase_items (purchase_id, product_id, product_count, product_price) VALUES (2, 2, 1, 29.99);
INSERT INTO purchase_items (purchase_id, product_id, product_count, product_price) VALUES (3, 3, 4, 39.99);
INSERT INTO purchase_items (purchase_id, product_id, product_count, product_price) VALUES (4, 4, 3, 49.99);
INSERT INTO purchase_items (purchase_id, product_id, product_count, product_price) VALUES (5, 5, 5, 59.99);
