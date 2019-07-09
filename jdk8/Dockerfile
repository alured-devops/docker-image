FROM junhwong/base:slim

LABEL maintainer=junhwong
# junhwong/unit:jdk8

ENV JAVA_HOME=/usr/lib/jdk
ENV CLASSPATH=.:$JAVA_HOME/lib:$CLASSPATH
ENV PATH=$JAVA_HOME/bin:$PATH
ENV JAVA_VERSION=8

# https://www.azul.com/downloads/zulu/zulu-linux/
ENV ZULU_PACK=zulu8.38.0.13-ca-jdk8.0.212-linux_x64

COPY entrypoint.sh /
COPY jvm.options /etc/jdk/

RUN curl https://cdn.azul.com/zulu/bin/${ZULU_PACK}.tar.gz -O \
    && tar -xvf /$ZULU_PACK.tar.gz && rm -f /${ZULU_PACK}.tar.gz \
    && mkdir $JAVA_HOME \
    && mv -f /$ZULU_PACK/bin ${JAVA_HOME}/bin \
    && mv -f /$ZULU_PACK/lib ${JAVA_HOME}/lib \
    && mv -f /$ZULU_PACK/include ${JAVA_HOME}/include \
    && mv -f /$ZULU_PACK/LICENSE ${JAVA_HOME}/LICENSE \
    && mv -f /$ZULU_PACK/jre ${JAVA_HOME}/jre \
    && rm -Rf /$ZULU_PACK \
    && chmod +x /entrypoint.sh

WORKDIR /app
COPY env.sh /app/

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "-version" ]