#FROM registry.dataos.io/library/java:7-jdk
FROM registry.dataos.io/library/hbase-cdh5:latest
RUN yum -y install unzip wget
RUN mkdir /lib/skyEye/
WORKDIR /lib/skyEye/
COPY skyEye.zip /lib/skyEye/skyEye.zip
COPY kafka_2.11-0.9.0.0.tgz /lib/skyEye/kafka_2.11-0.9.0.0.tgz
#RUN cd /lib/skyEye/ && wget https://s3.cn-north-1.amazonaws.com.cn/tianyan/kafka_2.11-0.9.0.0.tgz
#RUN cd /lib/skyEye/ && wget https://s3.cn-north-1.amazonaws.com.cn/tianyan/skyEye.zip
RUN unzip /lib/skyEye/skyEye.zip
RUN tar -xf /lib/skyEye/kafka_2.11-0.9.0.0.tgz
COPY ENV.sh /ENV.sh
COPY run-HBase.sh /lib/skyEye/AV-HBase-thrift-S/run-HBase.sh
COPY run-MASTER.sh /lib/skyEye/AV-Master/run-MASTER.sh
COPY run-SDK.sh /lib/skyEye/AV-SDK-Thrift/run-SDK.sh
ENTRYPOINT ["/ENV.sh"]
