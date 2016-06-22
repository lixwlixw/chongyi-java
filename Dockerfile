#FROM registry.dataos.io/library/java:7-jdk
FROM library/hbase-cdh5
RUN mkdir /lib/skyEye/
ADD skyEye.zip /lib/skyEye/
WORKDIR /lib/skyEye/
RUN unzip skyEye.zip
COPY ENV.sh /ENV.sh
RUN bash /ENV.sh
