/*Подсчитать общее количество лайков,
которые получили пользователи младше 11 лет.*/
 
SELECT COUNT(*) as likes,filename
FROM likes,media
WHERE media_id = media.id AND media_id IN (
  SELECT user_id 
  FROM profiles
  WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 11)
GROUP BY media_id; 
 
			
	