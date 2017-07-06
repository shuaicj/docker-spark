FROM shuaicj/java:8.131.11
MAINTAINER shuaicj <shuaicj@gmail.com>

ENV SPARK_RELEASE spark-2.1.1-bin-hadoop2.7
ENV SPARK_HOME /spark/${SPARK_RELEASE}
ENV PATH ${PATH}:${SPARK_HOME}/bin

https://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.7.tgz

RUN cd /tmp && \
    curl -jksSLO https://d3kbcqa49mib13.cloudfront.net/${SPARK_RELEASE}.tgz && \
    mkdir /spark && \
    tar zxvf ${SPARK_RELEASE}.tgz -C /spark && \
    rm -rf /tmp/*
