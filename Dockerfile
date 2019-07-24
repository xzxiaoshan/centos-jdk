#基础镜像
FROM centos:latest

MAINTAINER xzxiaoshan <365384722@qq.com>

WORKDIR /usr/java/

#JDK版本linux_x64
ENV JDK_VERSION=jdk1.8.0_221

RUN set -x && \
        yum install unzip -y && \
        wget --no-check-certificate https://gitee.com/catoop/files/raw/master/${JDK_VERSION}.tar.gzaa && \
        wget --no-check-certificate https://gitee.com/catoop/files/raw/master/${JDK_VERSION}.tar.gzab && \
        cat ${JDK_VERSION}.tar.gza* | tar -xzv && \
        rm -rf ${JDK_VERSION}.tar.gza*

# set environment variables
ENV JAVA_HOME /usr/java/${JDK_VERSION}
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH
