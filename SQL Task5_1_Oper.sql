---Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
---Заполните их текущими датой и временем.
USE vk;
DROP TABLE IF EXISTS human; 
CREATE TABLE human(
id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
name text(20) NOT NULL,
birthdate_at DATE,
created_at datetime DEFAULT current_timestamp(),
updated_at datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
PRIMARY KEY (`id`)
) COMMENT = 'Создаем таблицу human  для 5 урока, тестовая';
DESCRIBE human;
INSERT INTO human
	(name,birthdate_at)
VALUES
	('Рулон', '1982-12-23'),
	('Каблук', '1985-05-17');
SELECT * FROM human;
INSERT INTO human
SET name = 'Омар',
	birthdate_at = '2007-03-11';
SELECT * FROM human;


