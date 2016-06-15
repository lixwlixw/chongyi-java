FROM registry.dataos.io/library/java:7-jdk
RUN mkdir /lib/skyEye/
ADD skyEye1.zip /lib/skyEye/
WORKDIR /lib/skyEye/
RUN unzip skyEye1.zip
