
FROM hust-fuzz-base/base-wildfire
MAINTAINER your@email.com
#可以在此处添加开发者特定需要的库
RUN apt-get update && apt-get install -y xz-utils libucl-dev wget make autoconf automake libtool nasm
#RUN git clone --depth 1 <git_url> upx     # or use other version control
#RUN git clone https://github.com/FFmpeg/FFmpeg.git
COPY FFmpeg $SRC/FFmpeg
WORKDIR FFmpeg
COPY build.sh $SRC/
