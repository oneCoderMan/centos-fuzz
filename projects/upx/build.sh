pwd
#cd upx
CC=clang
CXX=clang++
git submodule update --init --recursive
wget http://www.oberhumer.com/opensource/ucl/download/ucl-1.03.tar.gz
tar zxvf ucl-1.03.tar.gz
cd ucl-1.03
./configure
make 
make install
cd ..
wget http://pkgs.fedoraproject.org/repo/pkgs/zlib/zlib-1.2.11.tar.xz/sha512/b7f50ada138c7f93eb7eb1631efccd1d9f03a5e77b6c13c8b757017b2d462e19d2d3e01c50fad60a4ae1bc86d431f6f94c72c11ff410c25121e571953017cb67/zlib-1.2.11.tar.xz
#xz -d zlib-1.2.11.tar.xz
tar -Jxf zlib-1.2.11.tar.xz
cd zlib-1.2.11
./configure
make install
cd ..
export UPX_UCLDIR="$PWD/ucl-1.03"
export UPX_LZMADIR="$PWD/src/lzma-sdk"
#./configure
CC=afl-clang
CXX=afl-clang++
make all  
mv ./src/upx.out $OUT/upx


pwd
ls
#make
#afl-fuzz -i $IN -o $OUT ./src/upx.out
# build project
# e.g.
# ./autogen.sh
# ./configure
# make -j$(nproc) all

# build fuzzers
# e.g.
# $CXX $CXXFLAGS -std=c++11 -Iinclude \
#     /path/to/name_of_fuzzer.cc -o $OUT/name_of_fuzzer \
#     $LIB_FUZZING_ENGINE /path/to/library.a
