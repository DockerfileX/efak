# 基础镜像
FROM openjdk:8

ARG VERSION

# 作者及邮箱
# 镜像的作者和邮箱
LABEL maintainer="nnzbz@163.com"
# 镜像的版本
LABEL version=${VERSION}
# 镜像的描述
LABEL description="EFAK(Eagle For Apache Kafka)"

ENV KE_NAME=efak-web-${VERSION}
ENV KE_HOME=/usr/local/${KE_NAME}

WORKDIR ${KE_HOME}

RUN mkdir -p ${KE_HOME} /hadoop/kafka-eagle/db/
COPY ${KE_NAME} ${KE_HOME}

RUN \
    echo 'sed -i s/cluster1.zk.list=tdn1:2181,tdn2:2181,tdn3:2181/cluster1.zk.list=${ZK_HOSTS}/ conf/system-config.properties' >> entrypoint.sh \
    && echo 'bin/ke.sh start' >> entrypoint.sh \
    && echo 'sleep 3' >> entrypoint.sh \
    && echo 'tail -f logs/ke_console.out' >> entrypoint.sh \
    && touch logs/ke_console.out

ENTRYPOINT ["sh", "./entrypoint.sh"]