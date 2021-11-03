/* Найти самого старого польз */
SELECT extract(
        'year'
        from age("birthday")
    ) AS "Age",
    id
FROM users
WHERE extract(
        'year'
        from age("birthday")
    ) >= 1
ORDER BY "birthday" DESC
LIMIT 1;
/* найти ид самого младшего пользователя */
/* найти минимальный возраст по группе пола */
SELECT min(
        extract(
            'year'
            from age("birthday")
        )
    ) AS "Age",
    "isMale"
FROM users
GROUP BY "isMale";
/* 
 Агрегатные функции
 min
 max
 avg - среднее арифметическое
 count - подсчет
 
 Комбинирование с where и group by
 */
/* 
 средний рост среди мужчин
 */
SELECT avg("height") AS "Average height"
FROM users
GROUP BY "isMale";
/* 
 максимальный рост мужчин и женщин
 */
SELECT max("height") AS "Max height"
FROM users
GROUP BY "isMale";
/* 
 минимальный, максимальный и средний рост мужчин и женщин
 */
SELECT max("height") AS "Max height",
    min("height") AS "Min height",
    avg("height") AS "Average height"
FROM users
GROUP BY "isMale"
HAVING ;
/* 
 количество людей с определенным именем
 */
SELECT count("height")
FROM users
WHERE "firstName" = 'Leo';
/* 
 количество людей в возрасте от 20 до 30 лет
 */
SELECT count(*)
FROM users
WHERE date_part('year', age("birthday")) BETWEEN 20 AND 30;
/* 
 кол-во людей родившихся 1 января 1970 года
 */
 SELECT count(*)
FROM users
WHERE "birthday" = '1970-01-01';
