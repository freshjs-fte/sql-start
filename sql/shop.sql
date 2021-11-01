DROP TABLE users;
/*  */
CREATE TABLE users (
    id serial PRIMARY KEY,
    email varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    CONSTRAINT users_email_length6) CHECK(char_length(email) >= 6
);
/*  */
DROP TABLE orders;
/*  */
CREATE TABLE orders (
    id serial PRIMARY KEY,
    user_id int,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
/*  */
DROP TABLE products;
/*  */
CREATE TABLE products (
    id serial PRIMARY KEY,
    product_no int NOT NULL UNIQUE,
    prod_name varchar(255) NOT NULL,
    price numeric(20, 2) NOT NULL,
    stock_quantity int NOT NULL
);
/*  */
/* N : N */
DROP TABLE products_to_order;
CREATE TABLE products_to_order (
    order_id int,
    prod_id int,
    quantity int NOT NULL DEFAULT 1,
    added_time timestamp NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (prod_id) REFERENCES products(id)
);
/*  */
INSERT INTO users (email, last_name)
VALUES ('test', 'testovich'),
    ('ivan', 'ivanov');
/*  */
INSERT INTO products (product_no, prod_name, price, stock_quantity)
VALUES (123, 'Iphone', 234, 1000),
    (234, 'Nokia', 234, 1000),
    (345, 'Xiomi', 234, 1000);
/*  */
INSERT INTO orders (user_id)
VALUES (1),
    (2);
/*  */
INSERT INTO products_to_order (order_id, prod_id)
VALUES (1, 1),
    (1, 3),
    (2, 2),
    (2, 2);