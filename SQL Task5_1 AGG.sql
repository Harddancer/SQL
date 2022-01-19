---Подсчитайте средний возраст пользователей в таблице users.
USE vk;
SELECT 
	(AVG(YEAR(CURRENT_DATE)-YEAR(birthdate_at)/ 365)) AS Middle
FROM human;








