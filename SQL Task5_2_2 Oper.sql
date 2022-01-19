/*Таблица users была неудачно спроектирована. --
--Записи created_at и updated_at были заданы типом VARCHAR --
--и в них долгое время помещались значения в формате 20.10.2017 8:10.--
--Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.*/
USE vk;
DROP TABLE IF EXISTS human; 
CREATE TABLE human(
id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
name text(20) NOT NULL,
birthdate_at DATE,
created_at VARCHAR(50),
updated_at VARCHAR(50),
PRIMARY KEY (`id`)
) COMMENT = 'Создаем таблицу human  для 5 урока, тестовая';

INSERT INTO human
	(name,birthdate_at,created_at,updated_at)
VALUES
	('Рулон', '1982-12-23','20.10.2017 8:10','20.10.2017 8:10'),
	('Каблук', '1985-05-17','30.10.2000 15:15','30.10.2000 15:15');


-- вариант2
UPDATE human
SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');
ALTER TABLE human
	MODIFY COLUMN created_at DATETIME,
	MODIFY COLUMN updated_at DATETIME;
SELECT * FROM human;


	




