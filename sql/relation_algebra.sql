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




















/*  */
INSERT INTO orders ("userId")
VALUES (4),
    (6),
    (1),
    (9);
/*  */
SELECT users."id",
    users."firstName",
    users."lastName",
    orders."id" AS "order id"
FROM users
    JOIN orders ON orders."userId" = users."id";