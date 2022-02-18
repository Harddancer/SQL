use CDN;
/* Вывести админов  и какое оборудование закупили*/

SELECT a.user_name AS 'Имя админа',es.price,es.model
FROM admin a 
JOIN equpment_store es 
ON a.id = es.admin_id
ORDER BY price DESC;

-- вложенный запрос 4 часа с ним сидел))
SELECT 
            user_name AS 'Имя админа',
           (SELECT price 
            FROM equpment_store WHERE equpment_store.admin_id = admin.id) AS 'Цена',
           (SELECT model 
            FROM equpment_store WHERE equpment_store.admin_id = admin.id) AS 'Модель'        
FROM admin
ORDER BY Цена DESC;

SELECT * FROM admin;
SELECT * FROM equpment_store;

/* Вывести админов у кого vlan  в диапазоне 300-500.*/
SELECT id,user_name,vlan_number,term_mashcin 
FROM admin
WHERE vlan_number BETWEEN 300 AND 500
ORDER BY term_mashcin;

/* Вывести модель vrf,сегмент сети*/
SELECT en.model,se.vrf,se.segment 
FROM euipment_network en 
RIGHT JOIN service_euipment se 
ON en.id = se.id;

/*Вывести вендора, минимальную, максимальную и среднюю цену  каждого вендора */

SELECT vendor, MIN(price) AS Минимальная_цена, MAX(price) AS Максимальная_цена,AVG(price) AS Средняя_цена
FROM  equpment_store es 
GROUP BY vendor;

/*Вывести админов, фамилии кот начинаются на К или инициалы на Ж */
SELECT user_name, vlan_number
FROM admin
WHERE user_name  LIKE 'К%' OR user_name  LIKE '% Ж';

/*Вывести оборудование кот исп на сети и на поддержке, И еще не прошел срок EoL данного оборудования */
SELECT en.vendor,en.model ,se.serial_number,en.serial_number ,se.EoL 
FROM euipment_network en 
LEFT JOIN support_equipment se 
ON en.id = se.serial_number_id
WHERE se.EoL > NOW();


/*У какого поставщика самая большая разница между закзом и поставкой*/

SELECT vendor,order_time,ship_time, DATEDIFF(ship_time,order_time) AS Delta
FROM equpment_store es
ORDER BY Delta DESC LIMIT 1;

/* Вывести админов  и какое оборудование эксплуатируют и сколько единиц*/

SELECT en.model,COUNT(model)
FROM admin a 
JOIN euipment_network en 
ON a.id = en.id
GROUP BY en.model;

SELECT a.user_name,count(*)
FROM admin a 
JOIN euipment_network en 
ON a.id = en.id
GROUP BY a.user_name;





