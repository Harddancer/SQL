

-- Написать скрипт, удаляющий сообщения «из будущего» 
-- (дата больше сегодняшней).
USE vk;
INSERT messages
(from_user_id, to_user_id, body, created_at)
VALUES(101,101,'Из будущего', '2156-12-23 23:23:23');
-- Удаление
DELETE FROM messages
WHERE created_at > now();
