DROP TABLE a;
DROP TABLE b;
CREATE TABLE a (
    id serial PRIMARY KEY,
    "value" varchar(3) NOT NULL
);
/*  */
CREATE TABLE b (
    id serial PRIMARY KEY,
    "v2" varchar(3) NOT NULL
);
/*  */
INSERT INTO a (value)
VALUES ('XYZ'),
    ('YZX'),
    ('YYY'),
    ('ZZZ');
/*  */
INSERT INTO b (v2)
VALUES ('YZX'),
    ('YYY');
/*  */
SELECT "id"
FROM users
INTERSECT
SELECT *
FROM orders;
/*  */
SELECT "value"
FROM a
EXCEPT
SELECT "v2"
FROM b;




/* Джоин антипатерн, не использовать */
SELECT * FROM a, b
WHERE a.value = b.v2;

/* Бaзовый JOIN - связь таблиц не обязательна */
SELECT * FROM a
    JOIN b ON a.value = b.v2;/* FK -> PK */

/* Кол-во заказов на каждого польз */
SELECT 
count(*) "Count orders", u.id "User ID", u.email
FROM orders o
  JOIN users u ON o."userId" = u.id
GROUP BY "User ID";


/* все заказы бренда Samsung */
SELECT pto."orderId", p.brand 
FROM phones_to_orders pto
    JOIN phones p ON pto."phoneId" = p.id
WHERE p.brand ~* 'SamsuNg';

/* кол-во моделей бренда Samsung в заказах  */
SELECT pto."orderId", p.brand, count(*) "Count models"
FROM phones_to_orders pto
    JOIN phones p ON pto."phoneId" = p.id
WHERE p.brand ~* 'SamsuNg'

GROUP BY pto."orderId", p.brand;