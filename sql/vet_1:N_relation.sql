DROP TABLE "masters";
/*  */
CREATE TABLE "masters" (
    "id" serial PRIMARY KEY,
    "first_name" varchar(255) NOT NULL,
    "last_name" varchar(255) NOT NULL,
    "contact" varchar(255) NOT NULL,
    UNIQUE ("contact"),
    CONSTRAINT "firstname_lastname_key" UNIQUE (first_name, last_name)
);
/*  */

INSERT INTO "masters" ("first_name", "last_name", "contact")
VALUES ('asd', 'qwe', '123123'),
    ('zxc', 'qwe', '1231234');
/*  */
/*  */
DROP TABLE "pets";
/*  */

CREATE TABLE "pets" (
    "id" serial PRIMARY KEY,
    "name" varchar(64) NOT NULL,
    "type" varchar(255) NOT NULL,
    "breed" varchar(255) NOT NULL,
    "master_id" int,
    FOREIGN KEY ("master_id") REFERENCES "masters"("id")
);
/*  */
INSERT INTO "pets" ("name", "type", "breed", "master_id")
VALUES ('tuzik', 'cat', 'siam', 1),
    ('sharik', 'dog', 'bigel', 2),
    ('sharik', 'homyak', 'normal', 2);
/*  */