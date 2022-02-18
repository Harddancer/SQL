/*по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы,
 оставляя только 5 самых свежих записей.*/

-- триггер на INSERT  
USE shop;

DELIMITER //
DROP TRIGGER IF EXISTS inputs// 
CREATE TRIGGER inputs BEFORE INSERT ON shop.test_table 
FOR EACH ROW
BEGIN 
SET NEW.`input` = NOW();
END//
DELIMITER ;

-- вставка значений
INSERT  INTO test_table
VALUES ('2022-02-03',NULL),('2022-02-04',NULL),('2024-2-04',NULL),
	   ('2025-02-03',NULL),('2026-02-04',NULL),('2024-2-04',NULL);
/*SELECT  * FROM test_table tt ;
DESCRIBE test_table;*/

-- динамический запрос с парметром и  с переменной
PREPARE new_row FROM "SELECT created_at, input FROM test_table  WHERE input LIMIT ?";
SET @line = (SELECT COUNT(*)-5 FROM test_table);
EXECUTE new_row USING @line;
SELECT * FROM test_table;





