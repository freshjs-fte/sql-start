
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