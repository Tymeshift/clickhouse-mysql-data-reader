# clickhouse-mysql-data-reader

- [Manual](docs/manual.md)
- [Usage examples](docs/usage-references.md)

#Quick start

1) Setup Mysql User
```
 mysql> CREATE USER 'clickhousereader'@'%' IDENTIFIED BY 'MDB@2019';
 Query OK, 0 rows affected (0.02 sec)
 mysql> CREATE USER 'clickhousereader'@'127.0.0.1' IDENTIFIED BY 'MDB@2019';
 Query OK, 0 rows affected (0.00 sec)
 mysql> CREATE USER 'clickhousereader'@'localhost' IDENTIFIED BY 'MDB@2019';
 Query OK, 0 rows affected (0.02 sec)
 mysql> GRANT SELECT, REPLICATION CLIENT, REPLICATION SLAVE, SUPER ON *.* TO
 'clickhousereader'@'%';
 Query OK, 0 rows affected (0.01 sec)
 mysql> GRANT SELECT, REPLICATION CLIENT, REPLICATION SLAVE, SUPER ON *.* TO
 'clickhousereader'@'127.0.0.1';
 Query OK, 0 rows affected (0.00 sec)
 mysql> GRANT SELECT, REPLICATION CLIENT, REPLICATION SLAVE, SUPER ON *.* TO
 'clickhousereader'@'localhost';
 Query OK, 0 rows affected, 1 warning (0.01 sec)
```
 
2)Setup Mysql configs
```
[mysqld]
# mandatory
server-id = 200
log_bin = /var/lib/mysql/bin.log
binlog-format = row # very important if you want to receive write, update and delete row
events
# optional
expire_logs_days = 30
max_binlog_size = 900M
# setup listen address
bind-address = 0.0.0.0
```
3)Run clickhouse-mysql-reader
```
clickhouse-mysql --src-server-id=200 --src-wait --nice-pause=1 --src-host=192.168.56.101
--src-user=clickhousereader --src-password=MDB@2019 --src-tables=wiki.pageviews
--dst-host=127.0.0.1 --dst-create-table --migrate-table
```