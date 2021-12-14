Задание3 Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
===============================================
(base) yamamotod@yamamotod-VPCEB1E1R:/$ cd /etc
(base) yamamotod@yamamotod-VPCEB1E1R:/etc$ cat .my.cnf
[client]
user=yamamotod
password=
(base) yamamotod@yamamotod-VPCEB1E1R:/$ su -p
Password: 
(base) root@yamamotod-VPCEB1E1R:/# mysqldump mysql > mysql.sql

(base) yamamotod@yamamotod-VPCEB1E1R:~/Рабочий стол/GeekBrains/SQL education$ sudo cp hello.sql /
[sudo] password for yamamotod:         
(base) yamamotod@yamamotod-VPCEB1E1R:~/Рабочий стол/GeekBrains/SQL education$ cd /
(base) yamamotod@yamamotod-VPCEB1E1R:/$ ls
bin    etc        lib32       media      proc  snap      test   usr
boot   hello.sql  lib64       mnt        root  srv       test1  var
cdrom  home       libx32      mysql.sql  run   swapfile  tmp
dev    lib        lost+found  opt        sbin  sys       users
(base) yamamotod@yamamotod-VPCEB1E1R:/$ sudo mysql < hello.sql
Hello world!
Hello world!
