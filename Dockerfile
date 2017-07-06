FROM shuaicj/java:8.131.11
MAINTAINER shuaicj <shuaicj@gmail.com>

ENV SPARK_RELEASE spark-2.1.1-bin-hadoop2.7
ENV SPARK_HOME /spark/${SPARK_RELEASE}
ENV PATH ${PATH}:${SPARK_HOME}/bin

RUN apk add --no-cache bash && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd && \
    cd /tmp && \
    curl -jksSLO https://d3kbcqa49mib13.cloudfront.net/${SPARK_RELEASE}.tgz && \
    mkdir /spark && \
    tar zxvf ${SPARK_RELEASE}.tgz -C /spark && \
    cd $SPARK_HOME/conf && \
    cp spark-env.sh.template spark-env.sh && \
    printf "\n\nSPARK_MASTER_WEBUI_PORT=8080\nSPARK_WORKER_PORT=9000\n" >> spark-env.sh && \
    cp spark-defaults.conf.template spark-defaults.conf && \
    printf "\n\nspark.shuffle.service.enabled    true" >> spark-defaults.conf && \
    rm -rf /var/cache/apk/* \
           /tmp/*

CMD ["/bin/bash"]
