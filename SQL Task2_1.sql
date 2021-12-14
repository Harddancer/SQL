1 Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
==============================
(base) yamamotod@yamamotod-VPCEB1E1R:~$ sudo mysql -u root
[sudo] password for yamamotod:         
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 51
Server version: 8.0.27-0ubuntu0.20.04.1 (Ubuntu)

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> \s
--------------
mysql  Ver 8.0.27-0ubuntu0.20.04.1 for Linux on x86_64 ((Ubuntu))

Connection id:		51
Current database:	
Current user:		root@localhost
SSL:			Not in use
Current pager:		stdout
Using outfile:		''
Using delimiter:	;
Server version:		8.0.27-0ubuntu0.20.04.1 (Ubuntu)
Protocol version:	10
Connection:		Localhost via UNIX socket
Server characterset:	utf8mb4
Db     characterset:	utf8mb4
Client characterset:	utf8mb4
Conn.  characterset:	utf8mb4
UNIX socket:		/var/run/mysqld/mysqld.sock
Binary data as:		Hexadecimal
Uptime:			2 days 2 hours 39 min 25 sec

Threads: 2  Questions: 283  Slow queries: 0  Opens: 338  Flush tables: 3  Open tables: 254  Queries per second avg: 0.001
--------------


mysql> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

mysql> select user from user;
+------------------+
| user             |
+------------------+
| debian-sys-maint |
| mysql.infoschema |
| mysql.session    |
| mysql.sys        |
| root             |
| yamamotod        |
+------------------+
6 rows in set (0,01 sec)

(base) yamamotod@yamamotod-VPCEB1E1R:/etc$ sudo find  -type f -name "my*"
(base) yamamotod@yamamotod-VPCEB1E1R:/etc$ sudo touch .my.cnf
(base) yamamotod@yamamotod-VPCEB1E1R:/etc$ ls -a
(base) yamamotod@yamamotod-VPCEB1E1R:/etc$ sudo vi .my.cnf
(base) yamamotod@yamamotod-VPCEB1E1R:/$ sudo mysql -u root
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 57
Server version: 8.0.27-0ubuntu0.20.04.1 (Ubuntu)

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
