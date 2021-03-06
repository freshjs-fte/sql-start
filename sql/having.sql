DROP TABLE phones;
/*  */
CREATE TABLE phones (
    id serial PRIMARY KEY,
    model varchar(64) NOT NULL CHECK(model != ''),
    brand varchar(64) NOT NULL CHECK(brand != ''),
    price numeric(8, 2) NOT NULL CHECK (price >= 100),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 1),
    UNIQUE (brand, model)
);
/*  */
INSERT INTO phones (brand, model, price, stock_quantity)
VALUES 
('Xiomi1', '1 model 122', 775, 200),
('Samsung', '1 model 25', 18313, 283),
    ('Iphone', '1 model 2', 3453, 547),
    ('Nokia', '1 model 3', 634, 949),
    ('Samsung', '1 model 4', 4567, 364),
    ('Xiaomi', '1 model 5', 9000, 629),
    ('ZTE', '1 model 6', 100, 677),
    ('Siemens', '1 model 7', 4500, 989),
    ('Iphone', '1 model 8', 3245, 250),
    ('Nokia', '1 model 9', 124, 1000),
    ('Samsung', '1 model 10', 4574, 567),
    ('Iphone', '1 model 11', 9000, 4774),
    ('Xiomi', '1 model 12', 775, 200),
    ('Huawei', '1 model 13', 4500, 568),
    ('ZTE', '1 model 14', 5687, 567),
    ('Nokia', '1 model 15', 662, 446),
    ('Samsung', '1 model 16', 5464, 283),
    ('Siemens', '1 model 17', 2346, 629),
    ('Xiaomi', '1 model 18', 346, 949),
    ('Samsung', '1 model 19', 8466, 346),
    ('Iphone', '1 model 20', 2357, 250),
    ('ZTE', '1 model 21', 775, 1000),
    ('Huawei', '1 model 22', 2344, 345),
    ('Iphone', '1 model 23', 4867, 989),
    ('Siemens', '1 model 24', 363, 1754);
/* Найти бренды которых осталось меньше 300 шт на складе */
SELECT *
FROM phones
WHERE stock_quantity < 300
ORDER BY stock_quantity ASC;
/* найти бренды c кол-вом на складе меньше 300 */
SELECT 
    sum("stock_quantity"),
    brand
FROM phones
GROUP BY brand
HAVING sum("stock_quantity") < 300;

/* 
  - бренды у которых кол-во телефонов больше 5 к
 */

SELECT sum("stock_quantity"), brand FROM phones
GROUP BY brand
HAVING sum("stock_quantity") > 5000;

/* 
    бренды у которых средняя стоимость меньше 1000
 */
SELECT avg("price") FROM phones
HAVING avg("price") > 1;
