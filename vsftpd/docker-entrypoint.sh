#!/bin/sh

echo "pasv_addr_resolve=$LOOKUP_DNS" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=$PASV_MAX" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=$PASV_MIN" >> /etc/vsftpd/vsftpd.conf
echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftpd/vsftpd.conf
echo "local_root=/home/$FTP_USER" >> /etc/vsftpd/vsftpd.conf
echo "user_sub_token=$FTP_USER" >> /etc/vsftpd/vsftpd.conf
echo "ssl_enable=$SSL_ENABLE" >> /etc/vsftpd/vsftpd.conf
echo "pasv_enable=$PASV_ENABLE" >> /etc/vsftpd/vsftpd.conf

# sets login user and password
addgroup -g $FTP_GID -S $FTP_USER
adduser -u $FTP_UID -D -G $FTP_USER -h /home/$FTP_USER -s /sbin/nologin $FTP_USER

echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd

# cd /home/$FTP_USER
# pwd
# cat /etc/vsftpd/vsftpd.conf

echo "===== now start vsftpd(build:Mon Jul 8 19:17:22 CST 2019) and enjoy it:) ====="
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
