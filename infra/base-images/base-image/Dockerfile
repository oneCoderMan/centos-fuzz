# Base image for all other images.

FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils && \
    apt-get install -y curl libc6-dev binutils libgcc-5-dev  vim git python3 python && \
    apt-get autoremove -y 
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN rm get-pip.py
#定义输入的文件位置
ENV IN=/in
#定义输出的文件位置
ENV OUT=/out
#定义放源码的位置
ENV SRC=/src
#暂且不定义
ENV WORK=/work

ENV PATH="$PATH:/out"

RUN mkdir -p $OUT $SRC $WORK $IN && chmod a+rwx $OUT $SRC $WORK $IN 
