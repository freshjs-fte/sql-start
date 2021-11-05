DROP TABLE users;
CREATE TABLE users (
    id serial PRIMARY KEY,
    "firstName" varchar(64) NOT NULL,
    "lastName" varchar(64) NOT NULL,
    email varchar(256) NOT NULL,
    "isMale" boolean NOT NULL,
    birthday date NOT NULL,
    "createdAt" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    height numeric(3, 2) NOT NULL,
    weight int
);
/*  */
DROP TABLE phones;
CREATE TABLE phones (
    id serial PRIMARY KEY,
    model varchar(64) NOT NULL CHECK(model != ''),
    brand varchar(64) NOT NULL CHECK(brand != ''),
    price numeric(8, 2) NOT NULL CHECK (price >= 100),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 1),
    UNIQUE (brand, model)
);
/* 1 user : N orders */
CREATE TABLE orders (
    id serial PRIMARY KEY,
    user_id int REFERENCES users(id)
    /* FK -> PK */
);
/* 1 phone : N orders */
/* 1 order : N phones */
CREATE TABLE phones_to_orders(
    order_id int REFERENCES orders(id),
    phone_id int REFERENCES phones(id),
    UNIQUE(order_id, phone_id)
);
