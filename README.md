# efak(Eagle for Apache Kafka)

[TOC]

## 1. 官网

<https://www.kafka-eagle.org/>

## 2. 编译

```sh
docker build -t nnzbz/efak:2.1.0 --build-arg VERSION=2.1.0 .
# latest
docker tag nnzbz/efak:2.1.0 nnzbz/efak:latest
```

## 3. 上传镜像

```sh
docker push nnzbz/efak:2.1.0
docker push nnzbz/efak:latest
```

## 4. 创建并启动容器

```sh
docker run --name efak \
    -d -p1048:8048 \
    -e TZ=CST-8 \
    -e ZK_HOSTS=172.17.0.1:2181 \
    --restart always \
    nnzbz/efak
```

- ZK_HOSTS
  ZooKeeper的连接地址
