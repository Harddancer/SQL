USE CDN;
-- представления , регион, модель, вендор, кол.
CREATE OR REPLACE ALGORITHM = MERGE VIEW sfera (Регион,Вендор,Модель,Количество)
AS SELECT rm.region,en.vendor,en.model,SUM(rm.counts_items)
FROM road_map rm 
JOIN euipment_network en 
ON rm.id = en.id
GROUP BY en.vendor,en.model,rm.region;
SELECT  * FROM sfera;

SELECT * FROM service_euipment se;
-- представления выбрать сегмент и сети в отд vlan 
CREATE OR REPLACE ALGORITHM = MERGE VIEW service (Сегмент,Cеть_IP)
AS SELECT segment,ip_network
FROM (SELECT segment,ip_network
	FROM service_euipment se 
    WHERE vlan_service != 11  AND vlan_service != 20 AND segment = 'B2C'
	UNION ALL
	SELECT segment,ip_network
	FROM service_euipment se 
	WHERE vlan_service  BETWEEN  50  AND  100 AND segment = 'B2B')as r;
SELECT * FROM service;	

-- триггер при удалении оборудования из euipment_network  удаляется и из service_euipment
DELIMITER //
DROP TRIGGER IF EXISTS del//
CREATE TRIGGER del
AFTER DELETE ON euipment_network  
FOR EACH ROW 
BEGIN 
  DELETE FROM service_euipment  WHERE id = OLD.id;

END //
DELIMITER ;

SELECT * FROM euipment_network;
SELECT * FROM service_euipment;

-- триггер на втавку знаяения дата ввода в эксплуатацию
DELIMITER //
DROP TRIGGER IF EXISTS new_equipment// 
CREATE TRIGGER new_equipment BEFORE INSERT ON euipment_network 
FOR EACH ROW
BEGIN 
SET NEW.working_at = NOW();
END//
DELIMITER ;

INSERT  INTO euipment_network (serial_number, types ,vendor,model)
VALUES
('55555', 'Core','ELTEX','SMG1016M');

SELECT * FROM euipment_network;

-- хранимая процедура,  вывести сегмент B2C информацию по вендору,
-- модели и имени админа кот его эксплуатирует, при условии что оборудование в EoL
DELIMITER //
DROP PROCEDURE IF EXISTS p_admin//
CREATE PROCEDURE p_admin(IN name_admin VARCHAR(50))
BEGIN
SELECT a.user_name,en.vendor,en.model,se2.EoL,se.segment
FROM admin a 
JOIN euipment_network en
ON a.id = en.id
JOIN service_euipment se 
ON se.id = en.id
JOIN support_equipment se2 
ON se2.serial_number_id = en.id
GROUP BY a.user_name,se.segment,en.vendor,se2.EoL,en.model
HAVING se2.EoL > NOW() AND segment = 'B2C' AND a.user_name = name_admin
ORDER BY segment;
END//
CALL p_admin('Корепанов Д')
DELIMITER ;

-- хранимая процедура,  вывести по модели  где стоимотсь более 10000
DELIMITER //
DROP PROCEDURE IF EXISTS model //
CREATE PROCEDURE model(IN model_u TEXT)
BEGIN
	SELECT vendor, model
	FROM equpment_store es 
	WHERE model_u = model AND price > 10000;
END //

CALL model('3750')





