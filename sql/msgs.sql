DROP TABLE "users";
/*  */
CREATE TABLE "users" (
    "id" serial NOT NULL UNIQUE,
    "first_name" varchar(128) NOT NULL CHECK("first_name" != ''),
    "last_name" varchar(128) NOT NULL,
    "gender" varchar(64) NOT NULL,
    "registered_at" date NOT NULL DEFAULT current_date
);
/*  */
INSERT INTO "users" ("first_name", "last_name", "gender")
VALUES ('Test', 'Testovich', ''),
    ('Genadiy', 'Testovich', 'false'),
    ('Viktor', 'Tustov', 'true');
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