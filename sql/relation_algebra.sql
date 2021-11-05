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
/*  */
INSERT INTO users (
    "firstName",
    "lastName",
    email,
    "isMale",
    birthday,
    height
  )
VALUES (
    'Valeriy',
    'Fotin',
    'fedor1.fotin@example.com',
    true,
    '2001.01.05',
    1.65
  ),
  (
    'Viktor',
    'Fotin',
    'fedor2.fotin@example.com',
    true,
    '2001.01.05',
    1.65
  );


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

/* найдите колво заказов пользователей */
/* LEFT JOIN */
SELECT u.id "User id", o.id "Order id", o."userId"
FROM users u 
    LEFT JOIN orders o ON u.id = o."userId"
WHERE o.id IS NULL
GROUP BY u.id, o.id
ORDER BY o.id; /* PK <- FK */


/* найти id телефонов конкретного заказа с id 40 */
SELECT p.id "Phone ID", p.model, pto."orderId" "Order ID"
FROM phones p
    JOIN phones_to_orders pto ON p.id = pto."phoneId"
WHERE pto."orderId" = 40;

/* найти email юзера конкретного заказа с id 80 */
SELECT users.email
FROM users
    JOIN orders ON users.id =
WHERE orders.id = 80;

/* Кол-во товаров на складе для заказа с id 70 */
