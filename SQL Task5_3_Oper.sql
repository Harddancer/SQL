/*В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
 Однако нулевые запасы должны выводиться в конце, после всех */

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

ALTER TABLE human ADD COLUMN value bigint(20) unsigned DEFAULT '0';

UPDATE human 
SET value = '23'
WHERE name = 'Рулон';
UPDATE human
SET value = '11'
WHERE name = 'Каблук';

INSERT INTO human
	(name,birthdate_at,created_at,updated_at,value)
VALUES
('Тимур', '1966-11-23',NOW(),NOW(),'34'),
('Казбек', '1977-09-17',NOW(),NOW(),'55'),
('Ибрагим', '1877-09-17',NOW(),NOW(),'0'),
('Прокофий', '1877-09-17',NOW(),NOW(),'0');
SELECT * FROM human;

SELECT name,value 
FROM human
ORDER BY CASE WHEN value ='0' THEN 1 ELSE 0 END, value;






