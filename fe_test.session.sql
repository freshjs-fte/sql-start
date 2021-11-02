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
/* удалите нового пользователя */
DELETE FROM users
WHERE "id" = 314;
/* RETURNING */
/* создайте строку и обновите один из ее атрибутов (рост) */
/* Добавить колонку адрес, добавьте нового пользователя */
/* 
 Найдите всех пользователей возрастом до 40 лет 
 глава 9.9
 */
SELECT *,
    age("birthday")
FROM "users"
WHERE age("birthday") < '40 years';
/* Найти всех мужчин, рост больше 170 cm  */
SELECT *
FROM "users"
WHERE "isMale" = true
    AND "height" > 1.7;
/* Найти всех у кого длина ПОЛНОГО имени больше 12 символов */
SELECT *
FROM "users"
WHERE length(concat("firstName", ' ', "lastName")) > 12;
/* 
 Выборка первых 3 записи 
 с ростом от 150 до 180 и возрастом 20+
 */
SELECT *,
    age("birthday")
FROM "users"
WHERE age("birthday") < '25 years'
LIMIT 3;
/*  */
SELECT *
FROM (
        SELECT *
        FROM "users"
        WHERE height > 1.5
            AND height < 1.8
    )
WHERE age("birthday") > '20 years'
LIMIT 3;
/* 
 Удалить первых 2 записи, 
 те кто ростом ниже 160 сm, 
 с возвратом значений
 (подзапрос)
 */
DELETE FROM users
WHERE height > 1.60
    AND id BETWEEN 80 AND 90
RETURNING *;
/*  */
DELETE FROM users
WHERE id IN (
        SELECT id
        FROM users
        WHERE height > 1.55
        LIMIT 2
    )
RETURNING *;
/* 
 Обновите поле address на значение 'Sobornyi 33' 
 только тем у кого возраст больше __ 
 ограничить 5 записями
 и вернуть значения
 */
/* 
 Обновить 5 записей, кто возрастом от 10 до 20 лет, установить рост 150
 */
UPDATE table_name
SET column1 = value1,
    column2 = value2
WHERE id IN (
        SELECT *
        FROM users
        WHERE age("birthday") BETWEEN '10 years' AND '20 years'
        LIMIT 1
    );
/* Найти всех кто родились в сентябре */
SELECT *
FROM users
WHERE date_part('month', "birthday") = 9;
SELECT *
FROM users
WHERE extract(
        month
        from "birthday"
    ) = 9;
/* 
 Обновить строки кто родился в январе
 установить почту на mail@mail.mail
 */
UPDATE users
SET email = 'mail@mail.mail'
WHERE id IN (
        SELECT id
        FROM users
        WHERE extract(
                month
                from "birthday"
            ) = 1
        LIMIT 3
    )
    RETURNING *;
/* 
 column BETWEEN a AND b
 column IN (cell1, cell2)
 date_part('part', timestamp) / extract(part from timestamp)
 SELECT * FROM table LIMIT n;
 Подзапрос как условие
 */