DROP TABLE "userTasks";
/*  */
CREATE TABLE "userTasks" (
    "id" serial PRIMARY KEY,
    "description" VARCHAR(255) NOT NULL,
    "is_checked" boolean NOT NULL
);

/* Добавить колонку */
ALTER TABLE "userTasks"
ADD COLUMN "createdAt" timestamp NOT NULL CHECK("createdAt" <= current_timestamp);

/* Удалить колонку */
ALTER TABLE "userTasks"
DROP COLUMN "createdAt";

/* Добавить ограничение */
ALTER TABLE "userTasks"
ADD CONSTRAINT "description_not_empty" CHECK("description" != '');

INSERT INTO "userTasks"
(description, is_checked)
VALUES ('', false);

/* 


    Создайте таблицы
    users: login, email, password
    employees: salary, department, position, hire_date, full_name

    C ограничениями
 */

CREATE TABLE users (
    id serial PRIMARY KEY,
    "login" varchar(64) NOT NULL,
    "email" varchar(64) NOT NULL,
    "password" varchar(64) NOT NULL
);

CREATE TABLE employees (
    id serial PRIMARY KEY,
    salary numeric(11,2) NOT NULL,
    department varchar()
);

 INSERT 
