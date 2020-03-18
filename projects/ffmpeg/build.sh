pwd
#cd upx
source /src/macke/.venv/bin/activate
./configure

mkdir ffmpeg
cd ffmpeg
../klee/llvm/Release/bin/clang -emit-llvm -I ../ -c libavdevice/*
#对每个文件操作
paths=$1
files=$(ls $paths)
for filename in $files
do
    macke $filename >> log.log
done
