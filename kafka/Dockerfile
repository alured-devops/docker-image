FROM junhwong/unit:jdk8

LABEL maintainer=junhwong
# junhwong/unit:kafka

ENV PKG_VER 2.3.0
ENV SLA_VER 2.12
RUN curl http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/$PKG_VER/kafka_$SLA_VER-$PKG_VER.tgz -o app-pkg.tgz \
    && tar -xvf app-pkg.tgz && rm -f app-pkg.tgz

RUN mv /app/kafka_$SLA_VER-$PKG_VER/* /app && rm -fR /app/kafka_$SLA_VER-$PKG_VER
COPY env.sh /app

EXPOSE 9092 2181

CMD [ "config/server.properties" ]