FROM centos:centos7


RUN yum install -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm python3 epel-release
RUN curl -s https://packagecloud.io/install/repositories/altinity/clickhouse/script.rpm.sh | bash
RUN yum install -y clickhouse-client mysql-community-devel mariadb-devel gcc python34-devel python34-pip which python3-devel
RUN pip3 install clickhouse-mysql && /usr/local/bin/clickhouse-mysql --install

