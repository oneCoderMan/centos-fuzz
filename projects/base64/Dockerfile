
FROM hust-fuzz-base/base-builder
MAINTAINER your@email.com
#可以在此处添加开发者特定需要的库
RUN apt-get update && apt-get install -y xz-utils libucl-dev wget make autoconf automake libtool
RUN  apt-get install -y gperf bison texinfo
#RUN git clone --depth 1 <git_url> upx     # or use other version control


COPY build.sh $SRC/
