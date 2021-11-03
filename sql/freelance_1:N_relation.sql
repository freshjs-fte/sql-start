/* 
    1 Создать таблицы пользователей, заказов
    2 Заказы имеют заголовок, описание, емейл автора, 
    рейтинг автора, 
    дата создания, дата обновления,
    3 Ограничения:
        Не пустые поля.
        Уникальный ид
        Длины строк по назначению.
        Рейтинг автора от 1.0 до 5.0
        Дата создания и обновления дефолтные на сейчас.
        Уникальное сочетание емейла и заголовка
*/
DROP TABLE "users";

CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "first_name" varchar(128) NOT NULL,
    "last_name" varchar(128) NOT NULL,
    "rating" decimal(2, 1) NOT NULL DEFAULT 1.0,
    "email" varchar(128) NOT NULL UNIQUE
);

DROP TABLE orders;

CREATE TABLE "orders" (
    "id" serial PRIMARY KEY,
    "author_id" bigint NOT NULL,
    create_date timestamp NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY ("author_id") REFERENCES "users"("id")
);
