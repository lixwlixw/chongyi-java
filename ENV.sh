#!/bin/bash
set -x
#if [ -z "MYSQLBSI" ]; then
    eval zkhost=\$BSI_ZOOKEEPER_ZK_HOST
    eval kahost=\$BSI_KAFKA_KAFKA_HOST
    eval tyuri=\$TY_MYSQL_URI 
    eval tyuser=\$TY_MYSQL_USER
    eval typass=\$TY_MYSQL_PASS
    
    sed -i 's/10.191.116.75/'$zkhost'/g' /lib/skyEye/AV-Master/conf/AV.cfg
    sed -i 's/10.191.17.1:3306\/skyeyes/'$tyuri'/g' /lib/skyEye/AV-Master/conf/AV.cfg
    sed -i 's/bigdata/'$tyuser'/g' /lib/skyEye/AV-Master/conf/AV.cfg
    sed -i 's/Bduser2015#/'$typass'/g' /lib/skyEye/AV-Master/conf/AV.cfg
    sed -i 's/10.191.116.75/'$zkhost'/g' /lib/skyEye/AV-SDK-Thrift/conf/AV.cfg
    sed -i "s/meta.*/metadata.broker.list=$kahost:9092/g" /lib/skyEye/AV-SDK-Thrift/conf/AV.cfg
    sed -i 's/10.1.0.21/127.0.0.1/g' /lib/skyEye/AV-Master/conf/sky-site.xml
    sed -i 's/10.1.0.21/127.0.0.1/g' /lib/skyEye/AV-HBase-thrift-S/conf/sky-site.xml
bash /lib/skyEye/AV-SDK-Thrift/run-SDK.sh
bash /lib/skyEye/AV-Master/run-MASTER.sh
bash /lib/skyEye/AV-HBase-thrift-S/run-HBase.sh
service hadoop-hdfs-datanode start
service hadoop-hdfs-namenode start 

service zookeeper-server start

service hbase-master start
service hbase-regionserver start

# infinite loop
while :; do echo "Running Hbase ..."; sleep 5; done
