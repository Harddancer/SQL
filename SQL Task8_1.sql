/*Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека,
который больше всех общался с выбранным пользователем (написал ему сообщений).*/
/* Наш user_id = 1*/

USE vk;
SELECT u.firstname AS 'Имя', 
       u.lastname AS 'Фамилия',
       COUNT(*) AS 'Кол' 
  FROM messages m   
       JOIN users u 
       ON m.from_user_id = u.id
       JOIN friend_requests fr 
       ON (u.id = fr.initiator_user_id OR u.id = fr.target_user_id)
       WHERE fr.status = 'approved' AND m.to_user_id = 1   
 GROUP BY m.from_user_id 
 ORDER BY COUNT(*) DESC 
 LIMIT 1;
