/*(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
 SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.*/
USE vk;
SELECT * 
FROM 
	human
WHERE 
	id IN (5,1,2)
ORDER BY  
	FIELD(id, 5, 1, 2);








