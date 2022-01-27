/*Подсчитать общее количество лайков,
которые получили пользователи младше 11 лет.*/



SELECT COUNT(*) AS likes 
FROM likes l 
JOIN media m 
ON l.media_id = m.id
JOIN profiles p 
ON m.id = p.user_id 
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 11;

  				
 