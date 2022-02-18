Создайте SQL-запрос, который помещает в таблицу users миллион записей
DELIMITER ;;
CREATE PROCEDURE dowhile()
BEGIN
  DECLARE v1 INT DEFAULT 1;
  WHILE v1 <= 1000000 DO
    INSERT `table_name` VALUES (v1);
    SET v1 = v1 + 1;
  END WHILE;
END;;
DELIMITER ;