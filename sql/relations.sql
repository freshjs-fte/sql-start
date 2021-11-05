
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

CREATE TABLE phones (
    id serial PRIMARY KEY,
    model varchar(64) NOT NULL CHECK(model != ''),
    brand varchar(64) NOT NULL CHECK(brand != ''),
    price numeric(8, 2) NOT NULL CHECK (price >= 100),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 1),
    UNIQUE (brand, model)
);
