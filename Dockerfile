#FROM registry.dataos.io/library/java:7-jdk
FROM registry.dataos.io/library/hbase-cdh5:latest
RUN mkdir /lib/skyEye/
WORKDIR /lib/skyEye/
ADD skyEye.zip /lib/skyEye/
ADD kafka_2.11-0.9.0.0.tgz /lib/skyEye/
RUN kafka_2.11-0.9.0.0.tgz
RUN unzip skyEye.zip
COPY ENV.sh /ENV.sh
COPY run-HBase.sh /lib/skyEye/AV-HBase-thrift-S/run-HBase.sh
COPY run-MASTER.sh /lib/skyEye/AV-HBase-thrift-S/run-MASTER.sh
COPY run-SDK.sh /lib/skyEye/AV-HBase-thrift-S/run-MASTER.sh
ENTRYPOINT ["/ENV.sh"]
