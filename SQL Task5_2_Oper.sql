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
DESCRIBE human;
INSERT INTO human
	(name,birthdate_at,created_at,updated_at)
VALUES
	('Рулон', '1982-12-23','20.10.2017 8:10','20.10.2017 8:10'),
	('Каблук', '1985-05-17','30.10.2000 15:15','30.10.2000 15:15');
SELECT * FROM human;

-- вариант1
ALTER TABLE human ADD new_created_at,new_update_at,
UPDATE human
	SET new_created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
	SET new_updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i'),
	MODIFY COLUMN created_at DATETIME,
	MODIFY COLUMN updated_at DATETIME;


ALTER TABLE human ADD new_created_at,new_update_at,
SELECT 
STR_TO_DATE(created_at, "%d.%m.%Y %k:%i") AS new_created_at,
STR_TO_DATE(updated_at, "%d.%m.%Y %k:%i") AS new_update_at,
CONVERT(new_created_at,DATETIME),
CONVERT(new_update_at,DATETIME);
#ALTER TABLE human
#MODIFY COLUMN created_at DATETIME,
#MODIFY COLUMN updated_at DATETIME;


