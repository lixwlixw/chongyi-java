#FROM registry.dataos.io/library/java:7-jdk
FROM library/hbase-cdh5
RUN mkdir /lib/skyEye/
ADD skyEye.zip /lib/skyEye/
WORKDIR /lib/skyEye/
RUN unzip skyEye.zip
COPY ENV.sh /ENV.sh
COPY run-HBase.sh /lib/skyEye/AV-HBase-thrift-S/run-HBase.sh
COPY run-MASTER.sh /lib/skyEye/AV-HBase-thrift-S/run-MASTER.sh
COPY run-SDK.sh /lib/skyEye/AV-HBase-thrift-S/run-MASTER.sh

RUN bash /ENV.sh
CMD 
