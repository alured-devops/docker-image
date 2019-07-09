# 配置 KAFKA

export CLASSPATH=/app/libs/*:$CLASSPATH
export APP_OPTS="-Xmx512M -Xms512M -Dlog4j.configuration=file:/app/config/log4j.properties"
export APP_MAIN="kafka.Kafka"

# # 启动内置 zookeeper。TODO: 内存很小 观察是否会挂！

ZK_OPTS="-Xmx64M -Xms64M"
ZK_MAIN=org.apache.zookeeper.server.quorum.QuorumPeerMain
ZK_CONF=config/zookeeper.properties
nohup $JAVA $ENV_JAVA_OPTS$ZK_OPTS -cp $CLASSPATH $ZK_MAIN "$ZK_CONF" > /dev/stdout &