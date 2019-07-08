FROM alpine:3.10

LABEL maintainer=junhwong
# junhwong/base:alpine
# 该镜像主要用于非 glibc 环境

RUN apk add --update ca-certificates tzdata && rm -rf /var/cache/apk/* /tmp/*
# 更新 CA
RUN update-ca-certificates

# 设置时区为上海

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

CMD ["/bin/sh","-c","date"]