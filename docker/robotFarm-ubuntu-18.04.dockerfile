FROM ubuntu:18.04

ARG INSTALL_PREFIX=/opt/robotFarm
ARG SKIP_PYTHON3=ON

# Set dpkg to run in non-interactive mode.
ENV DEBIAN_FRONTEND=noninteractive

# Set shell to return failure code if any command in the pipe fails.
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN echo $'Acquire::http::Pipeline-Depth 0;\n\
    Acquire::http::No-Cache true;\n\
    Acquire::BrokenProxy    true;\n'\
    >> /etc/apt/apt.conf.d/90fix-hashsum-mismatch

# Update package list and upgrade.
RUN apt-get update 2>&1 | tee -a /buildLog.txt
RUN apt-get upgrade -y 2>&1 | tee -a /buildLog.txt

# Copy over the code from the context.
COPY . /tmp/robotFarm

# Run the scripts to install all system dependencies.
WORKDIR /tmp/robotFarm/scripts
RUN sh installBuildTools.sh 2>&1 | tee -a /buildLog.txt
RUN sh installPython3Dependencies.sh 2>&1 | tee -a /buildLog.txt
RUN if [ "${SKIP_PYTHON3}" = "ON" ] ; then sh installBoostDependencies.sh 2>&1 | tee -a /buildLog.txt ; fi
RUN sh installVTKDependencies.sh 2>&1 | tee -a /buildLog.txt
RUN sh installAtlasDependencies.sh 2>&1 | tee -a /buildLog.txt
RUN sh installSuiteSparseDependencies.sh 2>&1 | tee -a /buildLog.txt
RUN sh installCeresDependencies.sh 2>&1 | tee -a /buildLog.txt
RUN sh installProtobufDependencies.sh 2>&1 | tee -a /buildLog.txt
RUN sh installOgreDependencies.sh 2>&1 | tee -a /buildLog.txt
RUN sh installOpenCVDependencies.sh 2>&1 | tee -a /buildLog.txt

# Clean-up.
RUN apt-get install --fix-missing 2>&1 | tee -a /buildLog.txt
RUN apt-get autoremove -y 2>&1 | tee -a /buildLog.txt
RUN apt-get autoclean -y 2>&1 | tee -a /buildLog.txt

# Set PATH and LD_LIBRARY_PATH so that the successive steps of the build can
# execute binaries built in the preceding steps of the build.
ENV PATH=${INSTALL_PREFIX}/bin:${PATH}
ENV LD_LIBRARY_PATH=${INSTALL_PREFIX}/lib:${LD_LIBRARY_PATH}

# Create a build directory
RUN mkdir -p /tmp/robotFarm-build
WORKDIR /tmp/robotFarm-build

# Run cmake to configure.
RUN cmake                                                       \
    -DCMAKE_BUILD_TYPE:STRING=Release                           \
    -DCMAKE_INSTALL_PREFIX:PATH=${INSTALL_PREFIX}               \
    -DROBOT_FARM_BUILD_ALL:BOOL=ON                              \
    -DROBOT_FARM_SKIP_PYTHON3:BOOL=${SKIP_PYTHON3}              \
    -DROBOT_FARM_OPENCV_WITH_NON_FREE_CONTRIB:BOOL=OFF          \
    ../robotFarm 2>&1 | tee -a /buildLog.txt

# Build.
RUN make -j`nproc` 2>&1 | tee -a /buildLog.txt

# Switch the work directory back to /.
WORKDIR /
