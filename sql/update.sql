/* Обновление данных */
UPDATE "users"
SET "last_name" = 'Glomova'
WHERE "last_name" = 'Testova'
RETURNING *;
/* Обновите имена у польз с длиной имени меньше 5 символов */
UPDATE "users"
SET "first_name" = 'Jorge'
WHERE char_length("first_name") <= 5
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