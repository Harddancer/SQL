2 Задание
Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
===========================
mysql> CREATE DATABASE examples;
Query OK, 1 row affected (0,03 sec)

mysql> use examples;
Database changed


mysql> CREATE TABLE users(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,name VARCHAR(10));
Query OK, 0 rows affected (0,15 sec)


mysql> INSERT INTO users(name) VALUES('Тамерлан');
Query OK, 1 row affected (0,01 sec)

mysql> INSERT INTO users(name) VALUES('Зигмунд');
Query OK, 1 row affected (0,01 sec)

mysql> INSERT INTO users(name) VALUES('Моисей');
Query OK, 1 row affected (0,01 sec)

mysql> SELECT * FROM users;
+----+------------------+
| id | name             |
+----+------------------+
|  1 | Тамерлан         |
|  2 | Зигмунд          |
|  3 | Моисей           |
+----+------------------+
3 rows in set (0,00 sec)
