/*Создайте представление, которое выводит название name товарной позиции из таблицы products 
и соответствующее название каталога name из таблицы catalogs.*/

/*SELECT @price := MAX(price) FROM products;
SELECT * FROM products WHERE price = @price;

SET @last = NOW() - INTERVAL 7 DAY;
SELECT NOW(), @last;
SHOW VARIABLES;

CREATE TEMPORARY TABLE temp (id INT, name VARCHAR(255));
SHOW TABLES;
DESCRIBE temp;*/

USE shop;
DROP VIEW IF EXISTS name_items;
CREATE OR REPLACE VIEW  name_items
AS SELECT p.name AS 'Товар',c.name AS 'Каталог'
FROM products p 
RIGHT JOIN catalogs c 
ON p.catalog_id = c.id;

SELECT * FROM name_items;




