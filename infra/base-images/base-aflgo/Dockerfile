FROM hust-fuzz-base/base-clang

RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN  apt-get clean
WORKDIR $SRC
RUN apt-get update
RUN apt-get install -y autoconf libtool automake pkg-config python3 python3-dev python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install networkx
RUN pip3 install pydot
RUN pip3 install pydotplus

COPY build_install_aflgo.sh $SRC
RUN /bin/bash $SRC/build_install_aflgo.sh
RUN rm $SRC/build_install_aflgo.sh

