FROM debian:stretch-slim
LABEL maintainer=junhwong
# junhwong/base:slim
# 该镜像作为基础镜像，主要用于支持需要 glibc 
# TODO: 替换更小的基础镜像，设置默认中文环境，CA
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL C
ENV TZ Asia/Shanghai
# COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -yqq --no-install-recommends ca-certificates curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 更新 CA
RUN update-ca-certificates
CMD ["/bin/bash","-c","date"]