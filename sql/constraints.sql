DROP TABLE "users";
/*  */
CREATE TABLE "users" (
    "id" serial PRIMARY KEY,
    "first_name" varchar(64) NOT NULL,
    "last_name" varchar(64) NOT NULL,
    "email" varchar(64) NOT NULL,
    "birth_date" date NOT NULL,
    "is_male" boolean NOT NULL,
    "height" numeric(3, 2) NOT NULL,
-- 
    UNIQUE("email"),
    CONSTRAINT "users_first_name_length3" CHECK(char_length("first_name") >= 3),
    CONSTRAINT "users_last_name_length3" CHECK(char_length("last_name") >= 3),

    CONSTRAINT "users_email_length6" CHECK(char_length("email") >= 6),
    CONSTRAINT "users_email_regex" CHECK("email" ~* '^[\w.]{3,}@[\w.]{3,}\.com$'),

    CONSTRAINT "users_birth_date_gr1930" CHECK("birth_date" >= '1930.01.01'),
    CONSTRAINT "users_birth_date_ls_curr" CHECK("birth_date" < current_date)
);
/*  */
INSERT INTO users
("first_name", "last_name", "email", birth_date, is_male, height)
VALUES (
        'John',
        'Doe',
        'asd@1asd.com',
        '2021.01.01',
        TRUE,
        1.99
    ),
    (
        'John',
        'Doe',
        'asd@asd.com',
        '2021.10.01',
        TRUE,
        0.2
    ),
    (
        'John',
        'Doe',
        'qwe@qwe.com',
        '2021.01.01',
        TRUE,
        9.9
    );
