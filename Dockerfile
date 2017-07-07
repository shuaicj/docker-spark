FROM shuaicj/java:8.131.11
MAINTAINER shuaicj <shuaicj@gmail.com>

ENV SPARK_RELEASE spark-2.1.1-bin-hadoop2.7
ENV SPARK_HOME /spark/${SPARK_RELEASE}
ENV PATH ${PATH}:${SPARK_HOME}/bin

RUN apk add --no-cache --update bash sed grep procps coreutils && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd && \
    cd /tmp && \
    curl -jksSLO https://d3kbcqa49mib13.cloudfront.net/${SPARK_RELEASE}.tgz && \
    mkdir /spark && \
    tar zxvf ${SPARK_RELEASE}.tgz -C /spark && \
    rm -rf /var/cache/apk/* /tmp/*

WORKDIR ${SPARK_HOME}

CMD ["/bin/bash"]
