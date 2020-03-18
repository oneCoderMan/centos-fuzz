FROM hust-fuzz-base/base-klee

RUN apt-get install -y bc bison build-essential cmake curl flex git libboost-all-dev libcap-dev libncurses5-dev python-minimal python-pip subversion unzip zlib1g-dev
RUN apt-get install -y make cmake ninja-build python2.7 binutils-gold binutils-dev
RUN apt-get install -y python3-venv valgrind python3 python3-dev python3-pip cgroup-lite cgroup-bin
WORKDIR $SRC

COPY build_install_wildfire.sh $SRC

RUN /bin/bash $SRC/build_install_wildfire.sh
COPY config.ini $SRC/macke/

RUN rm $SRC/build_install_wildfire.sh
WORKDIR $SRC
ADD http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz $SRC/
RUN mkdir afl && \
    cd afl && \
    tar -xzv --strip-components=1 -f $SRC/afl-latest.tgz && \
    make && \
    make install && \
    cd llvm_mode && \
    make && \
    cd .. && \
    make && \
    make install && \
    rm -rf $SRC/afl-latest.tgz 
RUN cd $SRC

COPY enter.sh $SRC
#RUN chmod +x enter.sh
#ENTRYPOINT ["/bin/bash" ,"enter.sh","&&" ]
#CMD [ "source" ,"$SRC/macke/.venv/bin/activate &&/bin/bash" ]