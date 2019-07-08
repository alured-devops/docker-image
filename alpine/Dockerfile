FROM alpine:3.10

LABEL maintainer=junhwong
# junhwong/unit:alpine
# update-ca docker build -t alpine:ca .
RUN apk add --update ca-certificates && rm -rf /var/cache/apk/* /tmp/*
RUN update-ca-certificates
