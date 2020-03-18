FROM hust-fuzz-base/base-image
RUN apt-get update
RUN apt-get install -y bc bison build-essential cmake curl flex git libboost-all-dev libcap-dev libncurses5-dev python-minimal python-pip subversion unzip zlib1g-dev
RUN apt-get install -y make cmake ninja-build python2.7 binutils-gold binutils-dev
RUN apt-get install -y python3-venv valgrind python3 python3-dev python3-pip 
WORKDIR $SRC

COPY build_install_llvm.sh $SRC
RUN /bin/bash $SRC/build_install_llvm.sh

RUN rm $SRC/build_install_llvm.sh

