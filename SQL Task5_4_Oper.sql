/*(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
Месяцы заданы в виде списка английских названий (may, august)*/
USE vk;
SELECT * FROM human;
SELECT name, 
IF (mounth = 'may' OR mounth = 'august', mounth,'другой месяц рождения') AS 'ДР МАЙ и АВГУСТ'
FROM human;






