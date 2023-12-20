-- manufacturers table
CREATE TABLE manufacturers (
    manufacturer_id SERIAL PRIMARY KEY,
    manufacturer_name VARCHAR(100) NOT NULL
);

-- categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category_id INTEGER REFERENCES categories (category_id),
    manufacturer_id INTEGER REFERENCES manufacturers (manufacturer_id)
);

-- stores table
CREATE TABLE stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL
);

-- customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_fname VARCHAR(100) NOT NULL,
    customer_lname VARCHAR(100) NOT NULL
);

-- price_change table
CREATE TABLE price_change (
    product_id INTEGER NOT NULL,
    price_change_ts TIMESTAMP NOT NULL,
    new_price NUMERIC(9,2) NOT NULL,
    PRIMARY KEY (product_id, price_change_ts),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- deliveries table
CREATE TABLE deliveries (
    store_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    delivery_date TIMESTAMP NOT NULL,
    product_count INTEGER NOT NULL,
    PRIMARY KEY (store_id, product_id, delivery_date),
    FOREIGN KEY (store_id) REFERENCES stores (store_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- purchases table
CREATE TABLE purchases (
    purchase_id SERIAL PRIMARY KEY,
    store_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    purchase_date TIMESTAMP NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores (store_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- purchase_items table
CREATE TABLE purchase_items (
    purchase_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    product_count INTEGER NOT NULL,
    product_price NUMERIC(9,2) NOT NULL,
    PRIMARY KEY (purchase_id, product_id),
    FOREIGN KEY (purchase_id) REFERENCES purchases (purchase_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
