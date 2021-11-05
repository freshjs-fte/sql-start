/*  */
CREATE TABLE users (
    id serial PRIMARY KEY,
    "firstName" varchar(64) NOT NULL,
    "lastName" varchar(64) NOT NULL,
    email varchar(64) NOT NULL,
    "isMale" boolean NOT NULL,
    birthday date NOT NULL,
    "createdAt" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    height numeric(3, 2) NOT NULL
    weight int
);
/* добавьте нового пользователя */
INSERT INTO users (
        "firstName",
        "lastName",
        "email",
        "isMale",
        "birthday",
        "height"
    )
VALUES (
        'Fedor',
        'Fedorov',
        'admin@gmail.com',
        true,
        '1940.01.01',
        1.5
    );
/* 
 column BETWEEN a AND b
 column IN (cell1, cell2)
 date_part('part', timestamp) / extract(part from timestamp)
 SELECT * FROM table LIMIT n;
 Подзапрос как условие
 */
 /* DML CRUD rows - insert, select, update, delete */
SELECT *
FROM users
WHERE age("birthday") BETWEEN '40 years' AND '50 years'
LIMIT 50 OFFSET 50 * 2;

SELECT *
FROM users
WHERE weight IS NOT NULL;

UPDATE users
SET weight = 100
WHERE id % 2 = 1
RETURNING *;

INSERT INTO users
(
    "firstName",
    "lastName",
    email,
    "isMale",
    birthday,
    height,
    weight
)
VALUES (
    'Fedor',
    'Testov',
    'mail@mail.mail',
    true,
    '2020.01.01',20
    1.7,
    NULL
);

/* найти родившихся в январе или августе или декабре */
SELECT
concat("firstName", ' ', "lastName") AS full_name
FROM users
WHERE 
date_part('month', "birthday") IN (1, 8, 12);
