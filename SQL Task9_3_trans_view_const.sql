/*по желанию) Пусть имеется таблица с календарным полем created_at.
В ней размещены разряженые календарные записи
за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
Составьте запрос, который выводит полный список дат за август, 
выставляя в соседнем поле значение 1, 
если дата присутствует в исходном таблице и 0, если она отсутствует.*/

DROP TABLE IF EXISTS new_table;
CREATE TABLE new_table (
id SERIAL PRIMARY KEY,
numbers INT DEFAULT NULL,
created_at DATE,
UNIQUE (created_at)
);
INSERT INTO new_table (created_at)
VALUES ('2018-08-01'),('2016-08-04'),('2018-08-16'),('2018-08-17');
DESCRIBE new_table;
SELECT * FROM new_table ORDER BY ID;

DROP TABLE IF EXISTS mounth_august;
CREATE TEMPORARY TABLE mounth_august (days int) COMMENT = 'Создаем CTE';
INSERT INTO mounth_august VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10), 
(11), (12),(13),(14), (15), (16), (17), (18), (19), (20),
(21), (22), (23), (24), (25), (26), (27), (28), (29), (30), (31);

                            
SET @mounth = '2018-07-31';

SELECT @mounth + interval days day AS dates,
CASE WHEN new_table.created_at is NULL THEN 0 ELSE 1 END AS step FROM mounth_august
LEFT JOIN new_table ON @mounth + interval days day = new_table.created_at;

