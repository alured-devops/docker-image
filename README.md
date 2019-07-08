

# Supported tags and respective Dockerfile links

* [base:debian](https://github.com/junhwong/docker-image/blob/master/base/debian/Dockerfile)
* [base:alpine](https://github.com/junhwong/docker-image/blob/master/base/alpine/Dockerfile)
* [unit:vsftpd](https://github.com/junhwong/docker-image/blob/master/vsftpd/Dockerfile)

## Build and Test for base
```
export TAG=alpine
cd "./base/$TAG"
docker build --no-cache -t "junhwong/base:$TAG" .
docker run -it --rm "junhwong/base:$TAG" && cd ../..

```

## For What?
* `base` 作为通用的基础库，保持通用、安全和整洁三个方面。
* `unit` 作为可独立运行或准独立性镜像，为特定方向的微服务提供支持，如：jdk, python, nodejs, golang 等

## For How?
```
docker pull junhwong/(base|unit):TAG

docker run OPTIONS junhwong/(base|unit):TAG
```

## Contributing

Before submitting pull requests or issues, please check github to make sure an existing issue or pull request is not already open.