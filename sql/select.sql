/* все колонки */
SELECT *
FROM "users";
/* выбранные колонки */
SELECT "first_name",
    "last_name"
FROM "users";
/* выбранные колонки с условием - gender */
SELECT "first_name",
    "last_name"
FROM "users"
WHERE "gender" = 'female';
/* 
 Найдите людей с именем меньше 6 символов
 функция для строк
 */
SELECT *
FROM "users"
WHERE LENGTH("first_name") < 6;
/* Найти польз которые родились после 2000 года */
SELECT *
FROM "users"
WHERE "birthdate" > '2000.01.01';
/* Нати польз у которых 
 полное имя (имя + фамилия) больше 15 символов
 функция для строк
 */
SELECT *
FROM "users"
WHERE char_length("first_name" || ' ' || "last_name") > 15;
/*  */
SELECT *
FROM "users"
WHERE LENGTH(concat("first_name", ' ', "last_name")) > 15;
/* 
 найти всех пользователей с возрастом больше 18 лет
 функция для дат
 */
SELECT *
FROM "users"
WHERE "birthdate" < '2003.11.01';
/*  */
SELECT *
FROM "users"
WHERE "birthdate" + interval '18 years' < current_date;
/*  */
SELECT *
FROM "users"
WHERE age("birthdate") > interval '18 years';
/* 
 Найдите всех пользователей возрастом до 40 лет 
 глава 9.9
 */
SELECT *,
    age("birthdate")
FROM "users"
WHERE age("birthdate") < '40 years';
/* Найти всех мужчин, рост больше 170 cm  */
SELECT *
FROM "users"
WHERE "is_male" = true
    AND "height" > 1.7;
/* Найти всех у кого длина ПОЛНОГО имени больше 12 символов */
SELECT *
FROM "users"
WHERE length(concat("firstName", ' ', "lastName")) > 12;
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
/*  */
/* 
 
 Подзапросы
 
 */
/* Переименовать колонку в результате */
SELECT Birthday
FROM (
        SELECT birthdate AS "Birthday"
        FROM users
    ) AS birthdays
WHERE "birthdays"."Birthday" > '2000.01.01';
/* 
 Поиск по дате регистрации
 Фильтрация после 2010 года
 */
/* По дате рождения найти пользователей возрастом между 18 и 24 годами */
SELECT *
FROM (
        SELECT *
        FROM "users"
        WHERE age("birthdate") > '18 years'
    ) AS "over18"
WHERE age("birthdate") < '24 years';
/* По полному имени найти польз с длиной полн. им. больше 7 символов */
/* По gender найти пользователей женского пола и с определенной фамилией */
/*  */
SELECT *
FROM (
        SELECT *
        FROM "users"
        WHERE height > 1.5
            AND height < 1.8
    )
WHERE age("birthdate") > '20 years';
/* 
 
 Лимиты
 
 */
/* 
 Выборка первых 3 записи 
 с ростом от 150 до 180 и возрастом 20+
 */
SELECT *,
    age("birthdate")
FROM "users"
WHERE age("birthdate") < '25 years'
LIMIT 3;