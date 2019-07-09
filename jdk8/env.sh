#!/bin/bash

# 命令或管道中任何非0返回均终止执行脚本 
set -e -o pipefail

# 设置当前环境的绝对路径 ENV_HOME
SCRIPT="$0"
ENV_HOME=`dirname "$SCRIPT"`
export ENV_HOME=`cd "$ENV_HOME"; pwd`

# 配置应用启动参数

# export CLASSPATH=/app/libs/*:$CLASSPATH
export APP_OPTS="-Xmx512M -Xms512M"
export APP_MAIN=""

# 执行额外的后台任务
