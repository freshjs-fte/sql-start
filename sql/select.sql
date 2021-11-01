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
/* Найти польз которые родились после 2000 года */


/* Нати польз у которых 
 полное имя (имя + фамилия) больше 15 символов
 функция для строк
  */
SELECT * FROM "users"
WHERE char_length("first_name" || ' ' || "last_name") > 15;
/*  */
SELECT * FROM "users"
WHERE LENGTH( concat("first_name", ' ', "last_name") ) > 15;
/* 
 найти всех пользователей с возрастом больше 18 лет
 функция для дат
 */
SELECT * FROM "users"
WHERE "birthdate" < '2003.11.01';
/*  */
SELECT * FROM "users"
WHERE "birthdate" + interval '18 years' < current_date;
/*  */
SELECT * FROM "users"
WHERE age("birthdate") > interval '18 years';


