-- Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, название 
-- таблицы, идентификатор первичного ключа и содержимое поля name.--

-- Создам таблицу логов
DROP TABLE IF EXISTS logs_archive;
CREATE TABLE logs_archive(
 create_at DATETIME DEFAULT NOW(), 
 tables_name VARCHAR(30) NOT NULL, 
 table_id INT UNSIGNED NOT NULL, 
 value VARCHAR(30))ENGINE=ARCHIVE DEFAULT CHARSET=utf8;
USE shop;
-- таблица users -
DELIMITER //
DROP TRIGGER IF EXISTS shop.users_AFTER_INSERT //
DELIMITER ;
DROP TRIGGER IF EXISTS shop.creation_record_users;

DELIMITER //
CREATE DEFINER = root@localhost
TRIGGER creation_record_users 
AFTER INSERT ON users
FOR EACH ROW BEGIN
INSERT INTO shop.logs_archive (create_at,table_name, table_id, name_value)
VALUES (now(), 'shop.users', new.id, new.name);

END//
DELIMITER ;

-- таблица catalogs
DROP TRIGGER IF EXISTS shop.creation_record_catalogs;

DELIMITER //
USE shop//
CREATE DEFINER = CURRENT_USER
TRIGGER creation_record_catalogs
AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
INSERT INTO shop.logs_archive (create_at,table_name, table_id, name_value)
VALUES (now(), 'shop.catalogs', new.id, new.name);


END //
DELIMITER ;

-- таблица products

DROP TRIGGER IF EXISTS shop.creation_record_products;

DELIMITER //
USE shop //
CREATE DEFINER = CURRENT_USER
TRIGGER creation_record_products
AFTER INSERT ON products
FOR EACH ROW
BEGIN

INSERT INTO shop.logs_archive (create_at,table_name, table_id, name_value)
values (now(), 'shop.products', new.id, new.name);
END//
DELIMITER ;

