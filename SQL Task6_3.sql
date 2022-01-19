
SELECT
CASE gender
         WHEN 'm' THEN 'ЭМ'
         WHEN 'f' THEN 'ЖО'
    END AS 'ЭМ ИЛИ ЖО', COUNT(*)
FROM profiles
WHERE user_id IN (
	SELECT user_id
	FROM likes
)
group by gender;