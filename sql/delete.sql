DELETE FROM users
WHERE "id" = 314;
/* 
 Удалить 2 записи, 
 те кто ростом ниже 160 сm, 
 с возвратом значений
 (подзапрос)
 */
DELETE FROM users
WHERE height > 1.60
    AND id BETWEEN 80 AND 82 -- нужно знать ид
RETURNING *;
/*  */
DELETE FROM users
WHERE id IN (
        SELECT id
        FROM users
        WHERE height > 1.55
        LIMIT 2 -- подзапрос решает задачу
    )
RETURNING *;