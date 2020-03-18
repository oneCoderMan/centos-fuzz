#!/bin/bash -eux

#编译安装llvm3.0
svn co https://llvm.org/svn/llvm-project/llvm/tags/RELEASE_342/final llvm3
svn co https://llvm.org/svn/llvm-project/cfe/tags/RELEASE_342/final llvm3/tools/clang
svn co https://llvm.org/svn/llvm-project/clang-tools-extra/tags/RELEASE_342/final llvm3/tools/clang/tools/extra
svn co https://llvm.org/svn/llvm-project/compiler-rt/tags/RELEASE_342/final llvm3/projects/compiler-rt
svn co https://llvm.org/svn/llvm-project/libcxx/tags/RELEASE_342/final llvm3/projects/libcxx
svn co https://llvm.org/svn/llvm-project/libcxxabi/tags/RELEASE_342/final llvm3/projects/libcxxabi
svn co https://llvm.org/svn/llvm-project/test-suite/tags/RELEASE_342/final/ llvm3/projects/test-suite

rm -rf llvm3/.svn
rm -rf llvm3/tools/clang/.svn
rm -rf llvm3/tools/clang/tools/extra/.svn
rm -rf llvm3/projects/compiler-rt/.svn
rm -rf llvm3/projects/libcxx/.svn
rm -rf llvm3/projects/libcxxabi/.svn
rm -rf llvm3/projects/test-suite/.svn

mkdir build3
cd build3
cmake -G Ninja -DLIBCXX_ENABLE_SHARED=OFF -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86" -DLLVM_BINUTILS_INCDIR=/usr/include -DCMAKE_INSTALL_PREFIX=/usr ../llvm3
ninja
ninja install
cd ../
#还有一件事，安装的时候如果没有设置 -DCMAKE_INSTALL_PREFIX 属性的话，会默认在usr/local下install。所以为了把诸如LLVMgold.so文件变为全局的，需要将相应的文件复制到usr/lib下。
#已经安装在usr下了

