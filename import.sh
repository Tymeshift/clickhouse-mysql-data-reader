clickhouse-mysql --src-host=35.192.162.222 \
--src-user=root \
--src-password=Mister007 \
--src-tables=tymeapp_tymeshift.temp_audit_events_for_account_id_35063 \
--dst-host=clickhouse-ch-pods.ch-storage-dev.svc.cluster.local \
--dst-user=admin \
--dst-password=clickhouse \
--dst-table=audit_events \
--dst-schema=storage \
--migrate-table

clickhouse-mysql --src-server-id=200 \
--src-wait \
--nice-pause=1 \
--src-host=35.192.162.222 \
--src-user=root \
--src-password=Mister007 \
--src-tables=tymeapp_tymeshift.temp_audit_events_for_account_id_30193 \
--dst-host=35.223.7.1 \
--dst-user=admin \
--dst-password=clickhouse \
--dst-table=audit_events \
--dst-schema=storage \
--migrate-table

clickhouse-mysql \
--src-host=35.192.162.222 \
--src-user=root \
--src-password=Mister007 \
--create-table-sql-template \
--with-create-database \
--src-tables=tymeapp_tymeshift.temp_audit_events_for_account_id_0

kubectl run reader --image=us.gcr.io/development-228621/clickhouse-mysql-reader:master -n ch-storage-dev

kubectl exec -it shell-demo -- /bin/bash

34.70.102.75

yum install wget
wget -O- ifconfig.co/json

2020-04-25 15:11:07,294/1587827467.294078
2020-04-25 15:12:23,072/1587827543.072639 = 01:16

2020-04-25 15:18:39,091/1587827919.091542
2020-04-25 15:19:54,770/1587827994.770721 = 01:15

2020-04-25 16:26:11,887/1587831971.887603:DEBUG:Block send time: 0.000247
2020-04-25 16:26:12,788/1587831972.788071:CRITICAL:QUERY FAILED
2020-04-25 16:26:12,788/1587831972.788542:CRITICAL:ex=Code: 225.
DB::Exception: ZooKeeper session has been expired.. Stack trace:

0. 0x10339650 Poco::Exception::Exception(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, int)  in /usr/bin/clickhouse
1. 0x8ea65cd DB::Exception::Exception(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, int)  in /usr/bin/clickhouse
2. 0xd977e91 ?  in /usr/bin/clickhouse
3. 0xd976edc DB::ReplicatedMergeTreeBlockOutputStream::write(DB::Block const&)  in /usr/bin/clickhouse
4. 0xd08da8e DB::PushingToViewsBlockOutputStream::write(DB::Block const&)  in /usr/bin/clickhouse
5. 0xd09ba43 DB::SquashingBlockOutputStream::write(DB::Block const&)  in /usr/bin/clickhouse
6. 0xd0964dc DB::AddingDefaultBlockOutputStream::write(DB::Block const&)  in /usr/bin/clickhouse
7. 0xd08bd5c DB::CountingBlockOutputStream::write(DB::Block const&)  in /usr/bin/clickhouse
8. 0x8f952f4 DB::TCPHandler::receiveData(bool)  in /usr/bin/clickhouse
9. 0x8f95777 DB::TCPHandler::receivePacket()  in /usr/bin/clickhouse
10. 0x8f95955 DB::TCPHandler::readDataNext(unsigned long const&, int const&)  in /usr/bin/clickhouse
11. 0x8f95f66 DB::TCPHandler::processInsertQuery(DB::Settings const&)  in /usr/bin/clickhouse
12. 0x8f978ef DB::TCPHandler::runImpl()  in /usr/bin/clickhouse
13. 0x8f97ee0 DB::TCPHandler::run()  in /usr/bin/clickhouse
14. 0xe1ff79b Poco::Net::TCPServerConnection::start()  in /usr/bin/clickhouse
15. 0xe1ffc1d Poco::Net::TCPServerDispatcher::run()  in /usr/bin/clickhouse
16. 0x103c77b7 Poco::PooledThread::run()  in /usr/bin/clickhouse
17. 0x103c35bc Poco::ThreadImpl::runnableEntry(void*)  in /usr/bin/clickhouse
18. 0x103c4f5d ?  in /usr/bin/clickhouse
19. 0x76db start_thread  in /lib/x86_64-linux-gnu/libpthread-2.27.so
20. 0x12188f __clone  in /lib/x86_64-linux-gnu/libc-2.27.so


