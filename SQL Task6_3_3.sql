SELECT COUNT(*) AS likes -- считаем все лайки
FROM likes
WHERE media_id IN( --  2й  вложенный запрос, связка табл медиа по ключу media_id из табл like
     SELECT id  -- выводим инф столбца с id, id ключ в media для связки с табл like
     FROM media
       WHERE user_id IN ( -- 1й  вложенный запрос
          SELECT user_id  
          FROM profiles
            WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 11) -- фильтруем только польз меньше 11 лет
 );