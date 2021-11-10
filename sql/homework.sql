CREATE TABLE customers (
    id
);
-- ^
CREATE TABLE contracts(
    id
    customer_id
); 



CREATE TABLE products(
    id
);
-- ^
CREATE TABLE orders(
    id
    product_id
);
-- ^
CREATE TABLE shipments(
    id
    order_id
);
