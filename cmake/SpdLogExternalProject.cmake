#[[ Cmake guard. ]]
if(TARGET SpdLogExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_SPDLOG_URL
    "https://github.com/gabime/spdlog/archive/refs/tags/v1.8.5.tar.gz"
    CACHE STRING
    "URL of the spdlog source archive")

externalproject_add(SpdLogExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/spdlog
                    URL ${ROBOT_FARM_SPDLOG_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CMAKE_ARGS
                    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX})