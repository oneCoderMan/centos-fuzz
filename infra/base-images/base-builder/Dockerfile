FROM hust-fuzz-base/base-aflgo
RUN PATH=$PATH:/usr/local/bin
RUN apt-get install -y git \
    subversion \
    jq \
    python3 \
    zip \
    make \
    libunwind8-dev \
    binutils-dev \
    libblocksruntime-dev \
    libc6-dev-i386

# Default build flags for various sanitizers.
#ENV SANITIZER_FLAGS_address "-fsanitize=address -fsanitize-address-use-after-scope"

# Set of '-fsanitize' flags matches '-fno-sanitize-recover' + 'unsigned-integer-overflow'.
#ENV SANITIZER_FLAGS_undefined "-fsanitize=bool,array-bounds,float-divide-by-zero,function,integer-divide-by-zero,return,shift,signed-integer-overflow,unsigned-integer-overflow,vla-bound,vptr -fno-sanitize-recover=bool,array-bounds,float-divide-by-zero,function,integer-divide-by-zero,return,shift,signed-integer-overflow,vla-bound,vptr"

#ENV SANITIZER_FLAGS_memory "-fsanitize=memory -fsanitize-memory-track-origins"

#ENV SANITIZER_FLAGS_dataflow "-fsanitize=dataflow"

# Do not use any sanitizers in the coverage build.
#ENV SANITIZER_FLAGS_coverage ""

# We use unsigned-integer-overflow as an additional coverage signal and have to
# suppress error messages. See https://github.com/google/oss-fuzz/issues/910.
#ENV UBSAN_OPTIONS="silence_unsigned_overflow=1"

# Default build flags for coverage feedback.
#ENV COVERAGE_FLAGS="-fsanitize=fuzzer-no-link"

# Use '-Wno-unused-command-line-argument' to suppress "warning: -ldl: 'linker' input unused"
# messages which are treated as errors by some projects.
#ENV COVERAGE_FLAGS_coverage "-fprofile-instr-generate -fcoverage-mapping -pthread -Wl,--no-as-needed -Wl,-ldl -Wl,-lm -Wno-unused-command-line-argument"

# Coverage isntrumentation flags for dataflow builds.
#ENV COVERAGE_FLAGS_dataflow="-fsanitize-coverage=trace-pc-guard,pc-table,func,trace-cmp"

# Default sanitizer, fuzzing engine and architecture to use.
ENV SANITIZER="address"
ENV FUZZING_ENGINE="afl"
ENV ARCHITECTURE="x86_64"

# DEPRECATED - NEW CODE SHOULD NOT USE THIS. OLD CODE SHOULD STOP. Please use
# LIB_FUZZING_ENGINE instead.
# Path to fuzzing engine library to support some old users of
# LIB_FUZZING_ENGINE.
#ENV LIB_FUZZING_ENGINE_DEPRECATED="/usr/lib/libFuzzingEngine.a"

# Argument passed to compiler to link against fuzzing engine.
# Defaults to the path, but is "-fsanitize=fuzzer" in libFuzzer builds.
#ENV LIB_FUZZING_ENGINE="/usr/lib/libFuzzingEngine.a"

# TODO: remove after tpm2 catchup.
ENV FUZZER_LDFLAGS ""

WORKDIR $SRC

#ADD http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz $SRC/
#RUN mkdir afl && \
#    cd afl && \
#    tar -xzv --strip-components=1 -f $SRC/afl-latest.tgz && \
#    make && \
#    make install && \
#    rm -rf $SRC/afl-latest.tgz

COPY compile compile_afl compile_macke macke_build compile_dataflow compile_libfuzzer compile_honggfuzz \
    srcmap write_labels.py /usr/local/bin/
RUN chmod +x /usr/local/bin/compile 
RUN chmod +x /usr/local/bin/compile_afl 
RUN chmod +x /usr/local/bin/compile_macke 
RUN chmod +x /usr/local/bin/macke_build

RUN chmod +x /usr/local/bin/compile_dataflow 
RUN chmod +x /usr/local/bin/compile_libfuzzer 
RUN chmod +x /usr/local/bin/compile_honggfuzz 
RUN chmod +x /usr/local/bin/srcmap 
CMD ["compile"]
