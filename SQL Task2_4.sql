4 задание (по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
=====================================================
(base) yamamotod@yamamotod-VPCEB1E1R:/$ sudo mysqldump -u yamamotod -p --opt --where="1 limit 100" mysql help_keyword > dump_keyword.sql
bash: dump_keyword.sql: Permission denied --- не пойму почему блокирует.

сам файл есть
(base) yamamotod@yamamotod-VPCEB1E1R:/$ ls
bin    dump_keyword.sql  lib     lost+found  opt   sbin      sys    users
boot   etc               lib32   media       proc  snap      test   usr
cdrom  hello.sql         lib64   mnt         root  srv       test1  var
dev    home              libx32  mysql.sql   run   swapfile  tmp
