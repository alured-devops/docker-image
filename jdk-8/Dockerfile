FROM debian:stretch-slim
LABEL builds=2019-07-08T17:00
LABEL maintainer=junhwong
# junhwong/base:debian
# 该镜像作为基础镜像，主要用于支持需要 glibc 
# TODO: 替换更小的基础镜像，设置默认中文环境，JDK提供版本的最优选择和设置，CA
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8

CMD ["/bin/bash","-c","date"]