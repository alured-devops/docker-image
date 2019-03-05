![latest 0.1.2](https://img.shields.io/badge/latest-0.1.1-green.svg?style=flat) 
![License MIT](https://img.shields.io/badge/license-MIT-blue.svg) 
[![](https://img.shields.io/docker/stars/junhwong/vsftpd.svg)](https://hub.docker.com/r/junhwong/vsftpd 'DockerHub') 
[![](https://img.shields.io/docker/pulls/junhwong/vsftpd.svg)](https://hub.docker.com/r/junhwong/vsftpd 'DockerHub')


Lightweight FTP-server built on alpine and vsftpd. For security reasons it is recommended to start the container when needed.


### Usage

To run it:
```
$ docker run -ti --rm \
-p 21:21 -p 21100-21109:21100-21109 \
-e FTP_PASS=YOURPASSWORD \
-e PASV_ADDRESS=YOUR.SERVER.HOST \
-v /YOUR/FTP/ROOT:/home/ftpuser \
junhwong/vsftpd:latest

```

local build:
```
$ docker build -t vsftpd .

```

***NOTE***:
Three env options is required:

1. Very, very, very **important** is to set the password of the login user, `-e FTP_PASS=YOURPASSWORD`.
2. `-e PASV_ADDRESS=YOUR.SERVER.HOST` sets the ftp connection address for passive mode.
3. and map your FTP data root directory with `-v /YOUR/FTP/ROOT:/home/ftpuser`.


### Contributing

Before submitting pull requests or issues, please check github to make sure an existing issue or pull request is not already open.
