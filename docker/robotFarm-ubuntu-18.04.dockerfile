FROM ubuntu:18.04

RUN apt update -q=2
RUN apt upgrade -y -q=2

# Set dpkg to run in non-interactive mode.
ENV DEBIAN_FRONTEND=noninteractive

COPY ./scripts /tmp

WORKDIR /tmp
RUN sh installBuildTools.sh
RUN sh installPython3Dependencies.sh
RUN sh installVTKDependencies.sh
RUN sh installAtlasDependencies.sh
RUN sh installSuiteSparseDependencies.sh
RUN sh installCeresDependencies.sh
RUN sh installProtobufDependencies.sh
RUN sh installOpenCVDependencies.sh

# Clean-up.
RUN apt install --fix-missing
RUN apt autoremove -y
RUN apt autoclean -y

# Create a user, bobTheBuilder.
RUN useradd --system --user-group --create-home bobTheBuilder

# Switch to use bobTheBuilder and give-up root privilege.
USER bobTheBuilder:bobTheBuilder

# Create a sandbox, copy over the code and build it.
RUN mkdir -p /home/bobTheBuilder/sandbox
WORKDIR /home/bobTheBuilder/sandbox
COPY --chown=bobTheBuilder:bobTheBuilder . robotFarm

# Create a build directory next to the source root.
RUN mkdir -p /home/bobTheBuilder/sandbox/robotFarm-build
WORKDIR /home/bobTheBuilder/sandbox/robotFarm-build

# Run cmake to configure.
RUN cmake                                                       \
    -DCMAKE_BUILD_TYPE:STRING=Release                           \
    -DCMAKE_INSTALL_PREFIX:PATH=${HOME}/usr                     \
    -DROBOT_FARM_BUILD_ALL:BOOL=ON                              \
    -DROBOT_FARM_OPENCV_WITH_NON_FREE_CONTRIB:BOOL=ON           \
     ../robotFarm 2>&1 | tee -a buildLog.txt

# Build.
RUN make -j`nproc` 2>&1 | tee -a buildLog.txt
