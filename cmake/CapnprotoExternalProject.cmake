#[[ Cmake guard. ]]
if(TARGET CapnprotoExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_CAPNPROTO_URL
    "https://github.com/capnproto/capnproto/archive/refs/tags/v0.8.0.tar.gz"
    CACHE STRING
    "URL of the Cap'n'proto source archive")

externalproject_add(CapnprotoExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/capnproto
                    URL ${ROBOT_FARM_CAPNPROTO_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CMAKE_ARGS
                        -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                        -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                        -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
                        -DBUILD_SHARED_LIBS:BOOL=ON)
