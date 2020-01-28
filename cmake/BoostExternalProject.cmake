#[[ CMake guard. ]]
if(TARGET BoostExternalProject)
    return()
endif()

include(ExternalProject)
include(${CMAKE_CURRENT_LIST_DIR}/Python3ExternalProject.cmake)

set(ROBOT_FARM_BOOST_URL
    "https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz"
    CACHE STRING
    "URL of the Boost source archive")

externalproject_add(BoostExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/boost
                    URL ${ROBOT_FARM_BOOST_URL}
                    DOWNLOAD_NO_PROGRESS ON

                    CONFIGURE_COMMAND
                    LD_LIBRARY_PATH=${CMAKE_INSTALL_PREFIX}/lib:$ENV{LD_LIBRARY_PATH}
                    PATH=${CMAKE_INSTALL_PREFIX}/bin:$ENV{PATH}
                    <SOURCE_DIR>/bootstrap.sh
                        --prefix=${CMAKE_INSTALL_PREFIX}
                        --with-python-root=${CMAKE_INSTALL_PREFIX}
                        --with-python=python3

                    BUILD_COMMAND <SOURCE_DIR>/b2 install
                    BUILD_IN_SOURCE ON
                    INSTALL_COMMAND "")

add_dependencies(BoostExternalProject Python3ExternalProject)
