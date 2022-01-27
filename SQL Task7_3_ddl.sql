
/*Есть таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
-- Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов (flights) с русскими названиями городов*/

DROP TABLE IF EXISTS flight;
CREATE TABLE IF NOT EXISTS flight(
id SERIAL PRIMARY KEY,
from_fl VARCHAR(100) NOT NULL COMMENT 'откуда',
to_fl VARCHAR(100) NOT NULL COMMENT 'куда'
);

DROP TABLE IF EXISTS cities;
CREATE TABLE IF NOT EXISTS cities(
label VARCHAR(100)  PRIMARY KEY COMMENT 'city ',
name VARCHAR(100) COMMENT 'город'
);

INSERT INTO cities(label,name)
VALUES
('Moscow', 'Москва'),
('Saint Petersburg', 'Санкт-Петербург'),
('Omsk', 'Омск'),
('Tomsk', 'Томск'),
('Ufa', 'Уфа');

INSERT INTO flight VALUES
(NULL, 'Moscow', 'Saint Petersburg'),
(NULL, 'Saint Petersburg', 'Omsk'),
(NULL, 'Omsk', 'Tomsk'),
(NULL, 'Tomsk', 'Ufa'),
(NULL, 'Ufa', 'Moscow');

ALTER TABLE flight 
ADD CONSTRAINT fk_f
FOREIGN KEY (from_fl) 
REFERENCES cities(label) 
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE flight 
ADD CONSTRAINT fk_f_to
FOREIGN KEY (to_fl) 
REFERENCES cities(label) 
ON UPDATE CASCADE ON DELETE CASCADE;


SELECT f.from_fl AS 'откуда',f.to_fl AS 'куда',c.name AS 'Город вылета',c2.name AS 'Город прилета' 
FROM flight AS f 
LEFT JOIN cities AS c
ON f.from_fl = c.label
LEFT JOIN cities AS c2
ON f.to_fl = c2.label;

