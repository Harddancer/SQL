/*Тема курсовой 'Разработка базы данных для Проекта "CDN-Control Desine Network" .
Цель: База данных по атрибутам различного сетевого оборудования, support,
тех.поддержка, эксплуатация и.т.д. 
Задачи: Разработка на базе СУБД MySQL БД-телеком сети для сетевых элементов и их сущностей,
 реализация инвентари системы телеком сети, с возможностью прозрачного управления сетью, использовать для анализа
 и построения дизайна сети, учет сетевых атрибутов и сервисов. Формирование налитических отчетов.
Перспективы:Автоматизация настроек сетевого оборудования, контроль дизайна сети.*/



DROP DATABASE IF EXISTS CDN; /*Control Desine Network*/
CREATE DATABASE CDN;
USE CDN;
SET foreign_key_checks = 1;
 DROP TABLE IF EXISTS admin;
 CREATE TABLE admin (
  id SERIAL PRIMARY KEY,
  user_name VARCHAR(255) COMMENT 'Имя админа',
  term_mashcin VARCHAR(255) COMMENT 'Имя терминалки',
  vlan_number INT NOT NULL COMMENT 'vlan  для управления',
  UNIQUE (vlan_number),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT 'Время обновления записи'
  ) COMMENT = 'Информация по администраторам сети';



 
 
 DROP TABLE IF EXISTS equpment_store;
CREATE TABLE equpment_store (
  id SERIAL PRIMARY KEY,
  admin_id BIGINT UNSIGNED,
  serial_number VARCHAR(15) COMMENT 'Серийник',
  vendor VARCHAR(255) COMMENT 'Производитель',
  model TEXT COMMENT 'Тип модели',
  price  DECIMAL (15,2) COMMENT 'Цена',
  order_time DATE COMMENT 'Дата заказа',
  ship_time DATE COMMENT 'Дата отгрузки',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT FK_equpment_store FOREIGN KEY (admin_id) REFERENCES admin(id) ON UPDATE CASCADE ON DELETE CASCADE
  ) COMMENT = 'Список оборудования телеком в заказах';
 
 

  DROP TABLE IF EXISTS euipment_network;
CREATE TABLE euipment_network (
  id SERIAL PRIMARY KEY,
  serial_number BIGINT UNSIGNED COMMENT 'Серийник',
  types ENUM('DU','AGG','Core') COMMENT 'Тип',
  vendor VARCHAR(255) COMMENT 'Производитель',
  model TEXT COMMENT 'Тип модели',
  working_at DATE COMMENT 'Дата ввода в эксплутацию',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT 'Время обновления записи'
) COMMENT = 'Список оборудования телеком используемого на сети';
 
 DROP TABLE IF EXISTS spare_equipment;
 CREATE TABLE spare_equipment (
  id SERIAL PRIMARY KEY,
  serial_number_id BIGINT UNSIGNED,
  vendor VARCHAR(255) COMMENT 'Название производителя',
  name_spare VARCHAR(255) COMMENT 'Название карты,модуля',
  counts INT COMMENT 'Количество',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT 'Время обновления записи',
  CONSTRAINT FK_spare_equipment FOREIGN KEY (serial_number_id) REFERENCES euipment_network(id) ON UPDATE CASCADE ON DELETE CASCADE
  ) COMMENT = 'Информация по запчастям на складе';
 
 
 DROP TABLE IF EXISTS support_equipment;
 CREATE TABLE support_equipment (
  id SERIAL PRIMARY KEY,
  serial_number_id BIGINT UNSIGNED,
  vendor VARCHAR(255) COMMENT 'Название производителя',
  serial_number BIGINT UNSIGNED COMMENT 'Серийник',
  EoL DATE NOT NULL COMMENT 'Дата окончания поддержки',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT 'Время обновления записи',
  CONSTRAINT FK_support_equipment FOREIGN KEY (serial_number_id) REFERENCES euipment_network(id) ON UPDATE CASCADE ON DELETE CASCADE
  ) COMMENT = 'Информация по технической поддержке';
 
 DROP TABLE IF EXISTS road_map;
 CREATE TABLE road_map (
  id SERIAL PRIMARY KEY,
  vendor VARCHAR(255) COMMENT 'Название производителя',
  model VARCHAR(255) COMMENT 'Название модели',
  region VARCHAR(255) COMMENT 'Вендор_регион',
  counts_items INT COMMENT 'Кол шт на регион',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления записи',
  CONSTRAINT FK_road_map FOREIGN KEY (id) REFERENCES euipment_network(id) ON UPDATE CASCADE ON DELETE CASCADE
  
  ) COMMENT = 'Информация по новой стройке';
 
 
 


 DROP TABLE IF EXISTS service_euipment;
CREATE TABLE service_euipment (
  id SERIAL PRIMARY KEY,
  vrf VARCHAR(30) COMMENT 'Название VRF',
  vlan_service INT COMMENT 'ID VLAN',
  ip_network VARCHAR(30) COMMENT 'IP сеть',
  segment ENUM('B2C','B2B','B2O'),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT 'Время обновления записи',
  FOREIGN KEY (id) REFERENCES euipment_network(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'Список оборудования телеком используемого на сети';

-- связующая таблица
DROP TABLE IF EXISTS euipment_network_admin;
CREATE TABLE euipment_network_admin(

  id BIGINT UNSIGNED,
  serial_number BIGINT UNSIGNED,
  PRIMARY KEY (id, serial_number),
  CONSTRAINT FK_euipment_network FOREIGN KEY (serial_number) REFERENCES euipment_network(id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT FK_admin FOREIGN KEY (id) REFERENCES admin(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'Связанная таблица';

-- INSERT таблицы admin до 10 значений

INSERT INTO admin (user_name,term_mashcin,vlan_number)
VALUES
('Корепанов Д','TM1',100),
('Коробейников В','TM2',200),
('Зубец Ф','TM3',300),
('Козырев Д','TM3',400),
('Малеревский А','TM2',500),
('Грач С','TM5',600),
('Казаков А','TM5',700),
('Широбоких Ж','TM3',800),
('Лисненко С','TM1',900),
('Минязев Р','TM1',1000),
('Аристов Д','TM1',999);
 SELECT * FROM admin;

/*SELECT  es.serial_number  FROM equpment_store es 
LEFT JOIN admin a ON es.serial_number=a.id 
WHERE a.id IS NULL;*/


-- INSERT таблицы equpment_store до 10 значений

INSERT  INTO equpment_store (admin_id,serial_number, vendor,model,price,order_time,ship_time)
VALUES
(1,'12345','Cisco','3750',78698,'2018-05-17','2023-03-01'),
(2,'56892','Cisco','ASR1000HX',754.00,'2019-04-17','2024-09-02'),
(3,'59595','Huawei','CX600',86544.00,'2015-08-23','2016-09-10'),
(4,'98765','Delink','2320',784594.00,'2013-01-11','2013-03-17'),
(5,'88888','Juniper','MX480',5454.23,'2014-09-19','2015-09-07'),
(6,'99987','Cisco','7606',343344.00,'2020-12-23','2024-12-31'),
(7,'98786','ZTE','MXN10Z',324324324.00,'2018-02-21','2018-07-27'),
(8,'87976','Cisco','ASR9006',342.43,'2011-02-01','2015-09-07'),
(9,'57865','Huawei','SX3000',432.00,'2010-02-19','2010-08-17'),
(10,'56546','Cisco','ASR1009',1234.98,'2011-09-25','2012-09-07'),
(11,'99983','Cisco','Satelite',4343.00,'1970-12-31','1971-04-07');
SELECT * FROM equpment_store;

-- INSERT таблицы euipment_network до 10 значений

INSERT  INTO euipment_network (serial_number, types ,vendor,model,working_at)
VALUES
('98786', 'Core','ZTE','MXN10Z','2018-10-31'),
('87976','Core','Cisco','ASR9006','2015-12-02'),
('57865','AGG','Huawei','SX3000','2010-09-19'),
('56546','Core','Cisco','ASR1009','2012-11-08'),
('99983','AGG','Cisco','Satelite','1971-12-09'),
('59595','AGG','Huawei','CX600','2016-10-12'),
('98765','DU','Delink','2320','2013-06-14'),
('88888','AGG','Juniper','MX480','2015-10-11'),
('67584','Core','Juniper','MX480','2015-09-07'),
('77777','Core','Juniper','MX480','2014-09-07');
SELECT * FROM euipment_network;

-- INSERT таблицы spare_equipment до 10 значений

INSERT INTO spare_equipment (serial_number_id,vendor,name_spare,counts)
VALUES
(1,'ZTE','Cabel AC',3),
(2,'Сisco','QFP',10),
(3,'Huawei','NAT modul',4),
(4,'Delink','Modul Eth',8),
(5,'Macrony','Voice GW',3),
(6,'Ericson','PinchBord',2),
(7,'Cisco','Cabel DC',19),
(8,'ZTE','DHCP server',2),
(9,'Qtech','Voice',6),
(10,'ZTE','RACK',1);
SELECT * FROM spare_equipment;

-- INSERT таблицы support_equipment до 10 значений


  
  INSERT INTO support_equipment (serial_number_id,vendor,serial_number,EOL)
  VALUES
  (1, 'ZTE','98786','2024-10-31'),                   
  (2,'Cisco','87976','2015-12-02'),
  (3,'Huawei','57865','2023-09-19'),
  (4,'Cisco','56546','2027-11-08'),
  (5,'Cisco','99983','1985-12-09'),
  (6,'Huawei','59595','2020-10-12'),
  (7,'Delink','98765','2024-06-14'),
  (8,'Juniper','88888','2018-10-11'),
  (9,'Juniper','67584','2020-09-07'),
  (10,'Juniper','77777','2019-09-07');
SELECT * FROM support_equipment; 
 
-- INSERT таблицы road_map до 10 значений
 
 
 INSERT INTO road_map (vendor,model,region,counts_items)
 VALUES
  ('Cisco','ASR1009','Moscow',5),   
  ('Huawei','SX3000','Voroneg',3),
  ('ZTE','MXN10Z','EKB',2),
  ('Delink','2320','Penza',189),
  ('Juniper','MX480','Barnaul',4),
  ('Juniper','MX480','Ryzan',3),
  ('Cisco','ASR9006','Samara',6),
  ('Huawei','SX3000','Kirov',1),
  ('Cisco','Satelit','Voroneg',1),
  ('Huawei','CX600','Novgorod',7);
SELECT * FROM road_map;  

  
  -- INSERT таблицы service_euipment до 10 значений
  
   INSERT INTO service_euipment (vrf,vlan_service,ip_network,segment)
   VALUES
   ('SHPD_BRAS','10','10.10.10.0/24','B2C'),
   ('SHPD_BRAS','20','11.11.11.32/28','B2C'),
   ('SHPD_IPTV','11','172.16.0.32/29','B2B'),
   ('SHPD_BRAS','15','11.180.220.0/24','B2C'),
   ('SHPD_WIFI','30','212.100.100.32/28','B2O'),
   ('VOIP','40','34.45.11.16/22','B2C'),
   ('VOIP','50','212.148.10.0/21','B2C'),
   ('SHPD_IPV6','90','108.0.0.0/22','B2B'),
   ('VOIP_TEST','70','180.144.11.0/24','B2O'),
   ('Domofon','80','1.1.1.1/32','B2B');
   
   SELECT * FROM service_euipment; 
  
  