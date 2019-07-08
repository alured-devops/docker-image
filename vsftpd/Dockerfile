FROM junhwong/base:alpine

LABEL maintainer=junhwong
# junhwong/unit:vsftpd
ENV FTP_USER=ftpuser \
    FTP_PASS="" \
    FTP_UID=1433 \
    FTP_GID=1433 \
    PASV_ADDRESS=YOURSERVER.com \
    PASV_MIN=21100 \
    PASV_MAX=21109 \
    LOOKUP_DNS=NO \
    SSL_ENABLE=YES \
    PASV_ENABLE=YES


RUN apk --update --no-cache add vsftpd openssl && rm -rf /var/cache/apk/* /tmp/*
RUN openssl req -x509 -nodes -days 1000000 -subj "/C=CN/ST=Docker/L=Docker/O=IT" -newkey rsa:2048 -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.pem \
    && apk del openssl

COPY vsftpd.conf /etc/vsftpd/
COPY docker-entrypoint.sh /usr/sbin/

RUN chmod +x /usr/sbin/docker-entrypoint.sh \
    && ln -sf /dev/stdout /var/log/vsftpd.log
RUN chmod +x /var/log/vsftpd.log
EXPOSE 21 21100-21109
VOLUME /var/log/vsftpd
ENTRYPOINT [ "/usr/sbin/docker-entrypoint.sh" ]