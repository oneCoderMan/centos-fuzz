#!/bin/bash -eux

#编译安装llvm6.0
svn co https://llvm.org/svn/llvm-project/llvm/tags/RELEASE_600/final llvm6
svn co https://llvm.org/svn/llvm-project/cfe/tags/RELEASE_600/final llvm6/tools/clang
svn co https://llvm.org/svn/llvm-project/clang-tools-extra/tags/RELEASE_600/final llvm6/tools/clang/tools/extra
svn co https://llvm.org/svn/llvm-project/compiler-rt/tags/RELEASE_600/final llvm6/projects/compiler-rt
svn co https://llvm.org/svn/llvm-project/libcxx/tags/RELEASE_600/final llvm6/projects/libcxx
svn co https://llvm.org/svn/llvm-project/libcxxabi/tags/RELEASE_600/final llvm6/projects/libcxxabi
svn co https://llvm.org/svn/llvm-project/test-suite/tags/RELEASE_600/final/ llvm6/projects/test-suite

rm -rf llvm6/.svn
rm -rf llvm6/tools/clang/.svn
rm -rf llvm6/tools/clang/tools/extra/.svn
rm -rf llvm6/projects/compiler-rt/.svn
rm -rf llvm6/projects/libcxx/.svn
rm -rf llvm6/projects/libcxxabi/.svn
rm -rf llvm6/projects/test-suite/.svn

mkdir build6
cd build6
cmake -G Ninja -DLIBCXX_ENABLE_SHARED=OFF -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86" -DLLVM_BINUTILS_INCDIR=/usr/include -DCMAKE_INSTALL_PREFIX=/usr ../llvm6
ninja
ninja install
cd ../
#还有一件事，安装的时候如果没有设置 -DCMAKE_INSTALL_PREFIX 属性的话，会默认在usr/local下install。所以为了把诸如LLVMgold.so文件变为全局的，需要将相应的文件复制到usr/lib下。
#已经安装在usr下了

git clone --depth 1 https://github.com/tum-i22/macke-opt-llvm 
cd macke-opt-llvm
make LLVM_SRC_PATH=/src/klee/llvm/ KLEE_BUILDDIR=/src/klee/klee/Release+Asserts KLEE_INCLUDES=/src/klee/klee/include/
cd ../

git clone --depth 1 https://github.com/tum-i22/macke-fuzzer-opt-llvm 
cd macke-fuzzer-opt-llvm
make LLVM_SRC_PATH=/src/llvm6/ KLEE_BUILDDIR=/src/klee/klee/Release+Asserts KLEE_INCLUDES=/src/klee/klee/include/
cd ../

git clone --depth 1 https://github.com/tum-i22/macke
cd macke
pip3 install virtualenv
python3 -m pip install --upgrade pip
make dev
source .venv/bin/activate

