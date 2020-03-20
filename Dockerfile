FROM centos:centos7
MAINTAINER The Memeo team  <magni-dev@memeo-inc.com>

RUN yum install -y java-1.7.0-openjdk-devel

RUN mkdir /app; \
    mkdir /app/zookeeper_logs; \
    mkdir /app/zookeeper_data
    
COPY zookeeper-3.4.5.tar.gz /app/zookeeper-3.4.5.tar.gz

RUN cd /app/; \   
    tar --no-same-owner -zxvpf zookeeper-3.4.5.tar.gz; \
    rm zookeeper-3.4.5.tar.gz
    

COPY zoo.cfg /app/zookeeper-3.4.5/conf/zoo.cfg
COPY java.env /app/zookeeper-3.4.5/conf/java.env
COPY myid /app/zookeeper_data/myid
COPY log4j.properties /app/zookeeper-3.4.5/conf/log4j.properties

CMD ["/app/zookeeper-3.4.5/bin/zkServer.sh", "start-foreground"]
