/*Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/
USE vk;
SELECT
	DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthdate_at, 6, 5))) AS week_day_BORN,
    COUNT(*) AS days_count
FROM
    human
GROUP BY 
    week_day_BORN;