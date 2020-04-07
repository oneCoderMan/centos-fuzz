pwd
echo "===========test begin============="
export FORCE_UNSAFE_CONFIGURE=1

wget -c http://panda.moyix.net/~moyix/lava_corpus.tar.xz
xz -d lava_corpus.tar.xz
tar -xvf lava_corpus.tar
cp -r ./lava_corpus/LAVA-M/base64/coreutils-8.24-lava-safe ./
export SUBJECT=$PWD/coreutils-8.24-lava-safe
echo "Subeject:$SUBJECT"
echo "==================================================AFLGO=================="

echo "当前目录======"
pwd

mkdir temp
export TMP_DIR=$PWD/temp
export AFLGO=/root/aflgo

export CC=$AFLGO/afl-clang-fast
export CXX=$AFLGO/afl-clang-fast++
export COPY_CFLAGS=$CFLAGS
export COPY_CXXFLAGS=$CXXFLAGS
export ADDITIONAL="-targets=$TMP_DIR/BBtargets.txt -outdir=$TMP_DIR -flto -fuse-ld=gold -Wl,-plugin-opt=save-temps"
export CFLAGS="$CFLAGS $ADDITIONAL"
export CXXFLAGS="$CXXFLAGS $ADDITIONAL"

# 写入目标行
echo $'lib/base64.c:627' > $TMP_DIR/BBtargets.txt

echo "=====执行 ./configure============"
echo "$CC"
cd $SUBJECT
./configure
echo "========== make ================================"
make -j$(nproc)

echo "=====生成BBcall, BBnames============"
cat $TMP_DIR/BBnames.txt | rev | cut -d: -f2- | rev | sort | uniq > $TMP_DIR/BBnames2.txt && mv $TMP_DIR/BBnames2.txt $TMP_DIR/BBnames.txt
cat $TMP_DIR/BBcalls.txt | sort | uniq > $TMP_DIR/BBcalls2.txt && mv $TMP_DIR/BBcalls2.txt $TMP_DIR/BBcalls.txt

echo "=====计算CG和CFG  ================="
$AFLGO/scripts/genDistance.sh $SUBJECT $TMP_DIR base64

export CFLAGS="$COPY_CFLAGS -distance=$TMP_DIR/distance.cfg.txt"
export CXXFLAGS="$COPY_CXXFLAGS -distance=$TMP_DIR/distance.cfg.txt"

echo "======第二次编译 插入距离信息======"
cd $SUBJECT
./configure
make clean
make -j$(nproc)

# 将生成后的插桩编译的文件输出
pwd
mv  $SUBJECT/src/ $OUT/base64

