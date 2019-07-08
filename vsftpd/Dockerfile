FROM alpine:3.8

LABEL maintainer=junhwong

ENV FTP_USER=ftpuser \
    FTP_PASS="" \
    PASV_ADDRESS=someadres.com \
    PASV_MIN=21100 \
    PASV_MAX=21109 \
    LOOKUP_DNS=NO \
    SSL_ENABLE=YES \
    PASV_ENABLE=YES


RUN apk update && apk upgrade && apk --update --no-cache add vsftpd openssl

RUN openssl req -x509 -nodes -days 1000000 -subj "/C=CN/ST=Docker/L=Docker/O=IT" -newkey rsa:2048 -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.pem \
    && apk del tzdata \
    && apk del openssl \
    && rm -rf /var/cache/apk/*

RUN echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "anonymous_enable=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "guest_enable=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "chroot_list_enable=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "#chroot_list_file=/etc/vsftpd.chroot_list" >> /etc/vsftpd/vsftpd.conf \
    && echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "ftpd_banner=Welcome to FTP-server" >> /etc/vsftpd/vsftpd.conf \
    && echo "dirmessage_enable=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "background=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "connect_from_port_20=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "ssl_tlsv1=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "ssl_sslv2=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "ssl_sslv3=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "ssl_ciphers=HIGH" >> /etc/vsftpd/vsftpd.conf \
    && echo "listen=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "idle_session_timeout=6000" >> /etc/vsftpd/vsftpd.conf \
    && echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "#user_config_dir=/etc/vsftpd/userconf" >> /etc/vsftpd/vsftpd.conf \
    && echo "rsa_cert_file=/etc/vsftpd/vsftpd.pem" >> /etc/vsftpd/vsftpd.conf \
    && echo "rsa_private_key_file=/etc/vsftpd/vsftpd.key" >> /etc/vsftpd/vsftpd.conf

COPY vsftpd.sh /usr/sbin/

RUN chmod +x /usr/sbin/vsftpd.sh

EXPOSE 21 21100-21109

CMD /usr/sbin/vsftpd.sh