#!/bin/bash -eux

docker build -t  hust-fuzz-base/base-image "$@" infra/base-images/base-image
docker build -t hust-fuzz-base/base-clang "$@" infra/base-images/base-clang
docker build -t hust-fuzz-base/base-aflgo "$@" infra/base-images/base-aflgo
docker build -t hust-fuzz-base/base-builder  "$@" infra/base-images/base-builder
docker build -t hust-fuzz-base/base-runner "$@" infra/base-images/base-runner
docker build -t hust-fuzz-base/base-llvm6.0 "$@" infra/base-images/base-llvm6.0

docker build -t hust-fuzz-base/base-klee "$@" infra/base-images/base-klee
docker build -t hust-fuzz-base/base-wildfire "$@" infra/base-images/base-wildfire



#docker build -t hust-fuzz-base/base-runner-debug "$@" infra/base-images/base-runner-debug
