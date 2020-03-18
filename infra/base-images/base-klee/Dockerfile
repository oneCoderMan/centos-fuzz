FROM hust-fuzz-base/base-image

RUN apt-get install -y bc bison build-essential cmake curl flex git libboost-all-dev libcap-dev libncurses5-dev python-minimal python-pip subversion unzip zlib1g-dev
WORKDIR $SRC
COPY ubuntu.sh $SRC
COPY README.md $SRC
RUN chmod +x ubuntu.sh
RUN mkdir klee

RUN /bin/bash $SRC/ubuntu.sh klee/
RUN rm $SRC/ubuntu.sh
RUN rm $SRC/README.md