/*  */
CREATE TABLE users (
    id serial PRIMARY KEY,
    "firstName" varchar(64) NOT NULL,
    "lastName" varchar(64) NOT NULL,
    email varchar(64) NOT NULL,
    "isMale" boolean NOT NULL,
    birthday date NOT NULL,
    "createdAt" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    height numeric() NOT NULL
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
SELECT *
FROM "users"
WHERE height > 1.5
    AND height < 1.8
    AND age("birthday") > '20 years'
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
/* Найти всех кто родились в сентябре */
