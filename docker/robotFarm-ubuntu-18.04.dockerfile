FROM ubuntu:18.04

ARG USERNAME=bobTheBuilder
ARG INSTALL_PREFIX=/home/${USERNAME}/usr

# Set dpkg to run in non-interactive mode.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt upgrade -y

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

# Create the user.
RUN useradd --system --user-group --create-home ${USERNAME}

# Switch to user and give-up root privilege.
USER ${USERNAME}:${USERNAME}

# Create a sandbox, copy over the code and build it.
RUN mkdir -p /home/${USERNAME}/sandbox
WORKDIR /home/${USERNAME}/sandbox
COPY --chown=${USERNAME}:${USERNAME} . robotFarm

# Create a build directory next to the source root.
RUN mkdir -p /home/${USERNAME}/sandbox/robotFarm-build
WORKDIR /home/${USERNAME}/sandbox/robotFarm-build

# Set PATH and LD_LIBRARY_PATH so that the successive steps of the build can
# execute binaries built in the preceding steps of the build.
ENV PATH = ${INSTALL_PREFIX}/bin:${PATH}
ENV LD_LIBRARY_PATH = ${INSTALL_PREFIX}/lib:${LD_LIBRARY_PATH}

# Run cmake to configure.
RUN cmake                                                       \
    -DCMAKE_BUILD_TYPE:STRING=Release                           \
    -DCMAKE_INSTALL_PREFIX:PATH=${INSTALL_PREFIX}               \
    -DROBOT_FARM_BUILD_ALL:BOOL=ON                              \
    -DROBOT_FARM_OPENCV_WITH_NON_FREE_CONTRIB:BOOL=OFF          \
     ../robotFarm 2>&1 | tee -a buildLog.txt

# Build.
RUN make -j`nproc` 2>&1 | tee -a buildLog.txt
