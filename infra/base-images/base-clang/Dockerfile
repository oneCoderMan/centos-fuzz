FROM hust-fuzz-base/base-image


COPY checkout_build_install_llvm.sh /root/
# Keep all steps in the same script to decrease the number of intermediate
# layes in docker file.
#RUN /bin/bash /root/checkout_build_install_llvm.sh
#RUN rm /root/checkout_build_install_llvm.sh
RUN apt-get update && apt-get install -y clang llvm 
# Setup the environment.
ENV CC "clang"
ENV CXX "clang++"
ENV CCC "clang++"

# FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION is described at
# http://libfuzzer.info#fuzzer-friendly-build-mode

#此处留爷
#ENV CFLAGS "-O1 -fno-omit-frame-pointer -gline-tables-only -DFUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION"
#ENV CFLAGS "-O1 -fno-omit-frame-pointer  -DFUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION"

#ENV CXXFLAGS_EXTRA "-stdlib=libc++"
#ENV CXXFLAGS "$CFLAGS $CXXFLAGS_EXTRA"
