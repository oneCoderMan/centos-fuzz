# infra
> Hust-Fuzz project infrastructure

Core infrastructure:
* [`base-images`](base-images/) - 为建立检测目标的镜像 & corresponding jenkins
  pipeline.

Continuous Integration infrastructure:

* [`libfuzzer-pipeline.groovy`](libfuzzer-pipeline.groovy/) - jenkins pipeline that runs for each OSS-Fuzz
  project.
* [`docker-cleanup`](docker-cleanup/) - jenkins pipeline to clean stale docker images & processes.
* [`push-images`](push-images/) - jenkins pipeline to push built base images.
* [`jenkins-cluster`](jenkins-cluster/) - kubernetes cluster definition for our jenkins-based build (not operational yet,
[#10](https://github.com/google/oss-fuzz/issues/10)).

## center.py
> script to automate common docker operations

| Command | Description |
|---------|-------------
| `generate`      | 为一个新项目生成基本结构，后续|
| `build_image`   | 为一个项目建立镜像 |
| `build_fuzzers` | 为一个项目建立检测目标 |
| `run_fuzzer`    | 在docker容器中检测目标 |
| `coverage`      | Runs fuzz target(s) in a docker container and generates a code coverage report. See [Code Coverage doc](../docs/code_coverage.md) |
| `reproduce`     | Runs a testcase to reproduce a crash |
| `shell`         | Starts a shell inside the docker image for a project |
- `build_fuzzers` 根据是否有clean参数清理上次的内容，需要指定out目录，根据yaml中的描述建立，设定默认值，不要问我怎么编译，问就是通过complain_{engin},{engin}_build
- `run_fuzzer` 启动检测程序，同样根据yaml中的描述使用对应的工具，设定默认值，