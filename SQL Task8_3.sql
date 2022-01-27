/*Определить кто больше поставил лайков (всего): мужчины или женщины*/
SELECT COUNT(*) AS 'В сухом остатке',
CASE (gender)
        WHEN 'm' THEN 'ЭМ'
        WHEN 'f' THEN 'ЖО'
       	END AS 'По первичному половому признаку'
FROM likes l
JOIN profiles p 
ON l.user_id = p.user_id 
GROUP BY gender;
