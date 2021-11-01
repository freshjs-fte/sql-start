/* 
 Создайте таблицу users с проверками (пример таблицы ниже)
 Вставьте 10-15 юзеров с разными именами фамилиями и датами
 Добавьте с помощью Alter столбец updated_at date NOT NULL DEFAULT current_date
 */
DROP TABLE "users";
/*  */
CREATE TABLE "users" (
    "id" serial PRIMARY KEY,
    "first_name" varchar(128) NOT NULL CHECK("first_name" != ''),
    "last_name" varchar(128) NOT NULL,
    "gender" varchar(64) NOT NULL,
    "birthdate" date NOT NULL,
    "registered_at" date NOT NULL DEFAULT current_date
);
/*  */
ALTER TABLE "users"
ADD "updated_at" date NOT NULL;
/* 
 ALTER TABLE "users"
 MODIFY COLUMN "updated_at" date NOT NULL CHECK("updated_at" >= "registered_at");
 */
/*  */
INSERT INTO "users" ("first_name", "last_name", "gender", "birthdate")
VALUES ('Test', 'Testov', 'gender', '2003.05.01'),
    ('Galina', 'Testova', 'female', '2016.10.11'),
    ('Viktor', 'Krustov', 'male', '1995.08.21'),
    ('Valentina', 'Grenof', 'female', '1998.09.21'),
    ('Boris', 'Bolang', 'male', '1987.09.04'),
    ('Sergiy', 'Nolan', 'male', '2010.06.05');
/*  */
/*  */
DROP TABLE "messages";
/*  */
CREATE TABLE "messages" (
    body varchar(3000) NOT NULL,
    user_id int REFERENCES "users"("id"),
    created_at timestamp NOT NULL,
    is_read boolean NOT NULL
);
/*  */
/* INSERT INTO "messages"
 VALUES (); */