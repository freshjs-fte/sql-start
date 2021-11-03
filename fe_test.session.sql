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

/* RETURNING */
/* создайте строку и обновите один из ее атрибутов (рост) */
/* Добавить колонку адрес, добавьте нового пользователя */

/* 
 column BETWEEN a AND b
 column IN (cell1, cell2)
 date_part('part', timestamp) / extract(part from timestamp)
 SELECT * FROM table LIMIT n;
 Подзапрос как условие
 */