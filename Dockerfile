#基础镜像
FROM centos:latest

MAINTAINER xzxiaoshan <365384722@qq.com>

WORKDIR /usr/java/

#JDK版本linux_x64
ENV JDK_TAR_NAME=jdk-8u221-linux-x64.tar.gz
ENV JDK_VERSION=jdk1.8.0_221

RUN set -x && \
    yum -y install wget && \
    wget --no-check-certificate https://temp.i86.pub:54321/files/${JDK_TAR_NAME} && \
    tar -zxvf ${JDK_TAR_NAME} && \
    rm -rf ${JDK_TAR_NAME}

# set environment variables
ENV JAVA_HOME /usr/java/${JDK_VERSION}
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH
