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
/* пересечение */
SELECT "value"
FROM a
INTERSECT
SELECT "v2"
FROM b;
/* декартово */
SELECT "value", "v2"
FROM a, b
WHERE a.value = b.v2;
/*  */
SELECT "value"
FROM a, b
UNION
SELECT "v2"
FROM b;




/* Джоин антипатерн, не использовать */
SELECT * FROM a, b
WHERE a.value = b.v2;

/* Бaзовый JOIN - связь таблиц не обязательна */
SELECT * FROM a
   JOIN b ON a.value = b.v2;
   /* FK -> PK */

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
    JOIN orders ON users.id = orders.user_id
WHERE orders.id = 80;

/* Кол-во товаров на складе для заказа с id 70 */
SELECT p.quantity, p.model
FROM phones as p
    JOIN phones_to_orders as pto ON p.id = pto."phoneId"
WHERE pto."orderId" = 70;
 











/* Кол-во позиций товара в определенном заказе ID 180 */
SELECT count(*) as "Models in order id 180"
FROM phones_to_orders as pto
WHERE "orderId" = 180;

/* Кол-во заказов каждого польз и его емейл */
SELECT email, count(orders."id") as "COUNT orders"
FROM users
    JOIN orders ON users.id = orders."userId"
GROUP BY email;

/* все заказы с определенной моделью телефона. 
Показать бренд и модель телефона */
SELECT pto."orderId", p.brand, p.model
FROM phones_to_orders as pto
    JOIN phones as p ON pto."phoneId" = p.id
WHERE p.model = '35 model 79';

/* 2 */
SELECT *
FROM phones_to_orders as pto
    JOIN phones as p ON pto."phoneId" = p.id
WHERE p.model = '35 model 79';
/* 3 */
SELECT pto."orderId", p.brand, p.model, pto.quantity
FROM phones_to_orders as pto
    JOIN phones as p ON pto."phoneId" = p.id
WHERE p.model = '35 model 79';

/* Извлечь самую популярную модель телефона */
SELECT p.model, sum(pto.quantity) as "Sum bought models"
FROM phones_to_orders as pto
   FULL OUTER JOIN phones as p ON pto."phoneId" = p.id
GROUP BY p.model
ORDER BY "Count orders" DESC
LIMIT 1;

SELECT "orderId", id, "phoneId"
FROM phones_to_orders as pto
   RIGHT OUTER JOIN phones as p ON pto."phoneId" = p.id
WHERE "orderId" IS NULL

INSERT INTO phones
(brand, model, price, quantity)
VALUES
('Asdfgg', 'model', 741258, 1);