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
/*  */
ALTER TABLE uet."users"
ALTER COLUMN password SET NOT NULL;

/* Удаление ограничений */
ALTER TABLE uet."users"
DROP CONSTRAINT "users_password_check";
/*  */
ALTER TABLE uet."users"
ALTER COLUMN password DROP NOT NULL;

/* Изменение ограничений */
ALTER TABLE uet."users"
DROP CONSTRAINT "users_password_check";
/*  */
ALTER TABLE uet."users"
ADD CONSTRAINT "users_password_hash_check" CHECK(char_length("password") > 3);

/* Изменение занчения по умолчанию */
ALTER TABLE uet.employees
ALTER COLUMN "hire_date" SET DEFAULT current_date;
/*  */
ALTER TABLE uet.employees
ALTER COLUMN "hire_date" DROP DEFAULT;

/* Изменить тип данных колонки */
ALTER TABLE uet.users
ALTER COLUMN "password" TYPE text;

/* Переименовать колонку */
ALTER TABLE uet."users"
RENAME COLUMN "password" TO "password_hash";

/* tasks */
/* Измените значение по умолчанию у колонки salary = 1 */
ALTER TABLE uet.employees
ALTER COLUMN salary SET DEFAULT 1;
/* Переименуйте колонку full_name на user_id */
ALTER TABLE uet.employees
RENAME COLUMN "full_name" TO "user_id";
/* Смените тип данных колонки user_id на int */
ALTER TABLE uet.employees
ALTER COLUMN "user_id" TYPE int;
/* Добавить ограничение внешнего ключа для колонки user_id на таблицу users */
ALTER TABLE uet.employees
ADD FOREIGN KEY (user_id) REFERENCES users(id);

/* 


    Создайте таблицы
    users: login, email, password
    employees: salary, department, position, hire_date, full_name

    C ограничениями
 */

CREATE SCHEMA uet;

DROP TABLE uet.users;

CREATE TABLE uet.users (
    id serial PRIMARY KEY,
    "login" varchar(64) NOT NULL CHECK("login" != ''),
    email varchar(64) NOT NULL CHECK("email" != ''),
    "password" varchar(64) NOT NULL CHECK("password" != '')
);
/*  */
CREATE TABLE uet.employees (
    id serial PRIMARY KEY,
    salary numeric(11,2) NOT NULL,
    department varchar(64) CHECK("department" != ''),
    position varchar(64) CHECK("position" != ''),
    hire_date date NOT NULL CHECK("hire_date" <= current_date),
    full_name varchar(128) NOT NULL CHECK("full_name" != '')
);


/*  */
INSERT INTO uet.users (
    "login", 
    "password", 
    email
)
VALUES
('test1', 'ASDHJR%YCVB@#$%^#.$%&$%&', 'test1@gmail.com'),
('test2', 'ASDHJR%YCVB@#$%^#.$%&$%&', 'test2@gmail.com'),
('test3', 'ASDHJR%YCVB@#$%^#.$%&$%&', 'test3@gmail.com'),
('test4', 'ASDHJR%YCVB@#$%^#.$%&$%&', 'test4@gmail.com'),
('test5', 'ASDHJR%YCVB@#$%^#.$%&$%&', 'test5@gmail.com'),
('test6', 'ASDHJR%YCVB@#$%^#.$%&$%&', 'test6@gmail.com');

/* 
    Таблица users
    Добавьте колонку password_hash
    Удалите колонку password
    Добавьте ограничение
 */
ALTER TABLE uet.users
ADD COLUMN "password_hash" text;

ALTER TABLE uet.users
DROP COLUMN "passwordADD CONSTRAINT "password_hash_not_empty" CHECK("password_hash" != '');_hash";

ALTER TABLE uet.users
ADD CONSTRAINT "password_hash_not_empty" CHECK("password_hash" != '');








/*  */
INSERT INTO employees
(
    salary, 
    department, 
    position, 
    hire_date,
    full_name
)
VALUES
(, '', '', '', ''),
(, '', '', '', ''),
(, '', '', '', '');
