

-- Первые пять пользователей пометить как удаленные
USE vk;
SELECT * 
FROM users
WHERE is_deleted = 1
ORDER BY is_deleted 
LIMIT 5;
