#!/bin/bash

# 命令或管道中任何非0返回均终止执行脚本 
set -e -o pipefail

# 设置当前环境的绝对路径 ENV_HOME
SCRIPT="$0"
ENV_HOME=`dirname "$SCRIPT"`
ENV_HOME=`cd "$ENV_HOME"; pwd`


# 查找 java
if [ ! -z "$JAVA_HOME" ]; then
    JAVA="$JAVA_HOME/bin/java"
else
    JAVA="$ENV_HOME/jdk/bin/java"
    if [ ! -x "$JAVA" ]; then
        JAVA=`which java`
    fi
fi

if [ ! -x "$JAVA" ]; then
    echo "could not find java in JAVA_HOME or bundled at $JAVA" >&2
    exit 1
fi

# 解析 java 版本
if [ -z "$JAVA_VERSION" ]; then
    # 检测规则来自 KAFKA
    # The first segment of the version number, which is '1' for releases before Java 9
    # it then becomes '9', '10', ...
    # Some examples of the first line of `java --version`:
    # 8 -> java version "1.8.0_152"
    # 9.0.4 -> java version "9.0.4"
    # 10 -> java version "10" 2018-03-20
    # 10.0.1 -> java version "10.0.1" 2018-04-17
    # We need to match to the end of the line to prevent sed from printing the characters that do not match
    JAVA_MAJOR_VERSION=$($JAVA -version 2>&1 | sed -E -n 's/.* version "([0-9]*).*$/\1/p')
    if [[ "$JAVA_MAJOR_VERSION" -eq "1" ]]; then
        JAVA_MAJOR_VERSION=8 # 最低支持8
    fi
    export JAVA_VERSION="$JAVA_MAJOR_VERSION"
fi

if [ -z "$JAVA_VERSION" ]; then
    echo "could not find java version in JAVA_VERSION" >&2
    exit 1
fi

# 筛选合并JVM选项
ENV_JAVA_OPTS=`cat /etc/jdk/jvm.options | grep -E '(^-D|^-X|^\d+\-?:-(X|D))' | awk '$0~/^[0-9]+:-/ {
    i=index($0,":");
    v=substr($0, 0, i-1);
    if (v==ENVIRON["JAVA_VERSION"]) { printf "%s ", substr($0, i+1) }
} $0~/^[0-9]+-:-/ {
    i=index($0,"-:");
    v=substr($0, 0, i-1);
    if (v>=ENVIRON["JAVA_VERSION"]) { printf "%s ", substr($0, i+2) }
} $0~/^-/ { printf "%s ", $0}'`

export APP_OPTS=""
export APP_MAIN=""
if [ -x "/app/env.sh" ]; then
    chmod +x /app/env.sh && source /app/env.sh
fi

# echo "$JAVA $ENV_JAVA_OPTS$APP_OPTS -cp $CLASSPATH $APP_MAIN"
exec $JAVA $ENV_JAVA_OPTS$APP_OPTS -cp $CLASSPATH $APP_MAIN "$@"