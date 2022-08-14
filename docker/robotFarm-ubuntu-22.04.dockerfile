FROM ubuntu:22.04 AS robot-farm-base

# Set dpkg to run in non-interactive mode.
ENV DEBIAN_FRONTEND=noninteractive

# Set shell to return failure code if any command in the pipe fails.
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN echo $'Acquire::http::Pipeline-Depth 0;\n\
    Acquire::http::No-Cache true;\n\
    Acquire::BrokenProxy    true;\n'\
    >> /etc/apt/apt.conf.d/90fix-hashsum-mismatch

RUN apt-get update && \
    apt-get install -y --no-install-recommends cmake clang-14 clang++-14 gcc-12 g++-12 git jq ninja-build && \
    apt-get full-upgrade -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y

FROM robot-farm-base AS throwaway-robot-farm-build
WORKDIR /tmp
COPY . /tmp/robotFarm-src

RUN cmake -G Ninja                                                              \
    -S /tmp/robotFarm-src                                                       \
    -B /tmp/robotFarm-build                                                     \
    -DCMAKE_BUILD_TYPE:STRING="Release"                                         \
    -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/tmp/robotFarm-src/toolchains/gnu-12.cmake  \
    -DCMAKE_INSTALL_PREFIX:PATH=/opt/robotFarm

RUN sh /tmp/robotFarm-build/systemDependencyInstaller.sh

RUN cmake --build /tmp/robotFarm-build


FROM robot-farm-base AS robot-farm
COPY --from=throwaway-robot-farm-build /opt/robotFarm /opt/robotFarm
COPY --from=throwaway-robot-farm-build /tmp/robotFarm-build/systemDependencyInstaller.sh /tmp/systemDependencyInstaller.sh
RUN sh /tmp/systemDependencyInstaller.sh && rm /tmp/systemDependencyInstaller.sh
