/*Подсчитать общее количество лайков,
которые получили пользователи младше 11 лет.*/

 
SELECT COUNT(*) AS likes -- считаем все лайки
FROM likes
WHERE media_id IN( --  2й  вложенный запрос, связка табл медиа по ключу media_id из табл like
 	  SELECT id  -- выводим инф столбца с id, id ключ в media для связки с табл like
 	  FROM media
 			WHERE id IN ( -- 1й  вложенный запрос
  				SELECT photo_id  -- связка табл media _id ключ id  и табл profiles  по ключ photo_id
  				FROM profiles
  					WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 11) -- фильтруем только польз меньше 11 лет
 ); 
  				
 