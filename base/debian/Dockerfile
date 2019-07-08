FROM debian:stretch-slim
LABEL builds=2019-07-08T17:00
LABEL maintainer=junhwong
# junhwong/base:debian
# 该镜像作为基础镜像，主要用于支持需要 glibc 
# TODO: 替换更小的基础镜像，设置默认中文环境，CA
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8
ENV TZ=Asia/Shanghai

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*

# 更新 CA
RUN update-ca-certificates
CMD ["/bin/bash","-c","date"]