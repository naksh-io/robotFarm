#[[ Cmake guard. ]]
if(TARGET CapnprotoExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_CAPNPROTO_URL
        "https://github.com/capnproto/capnproto/archive/refs/tags/v0.9.1.tar.gz"
        CACHE STRING
        "URL of the Cap'n'proto source archive")

externalproject_add(CapnprotoExternalProject
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/capnproto
        URL ${ROBOT_FARM_CAPNPROTO_URL}
        DOWNLOAD_NO_PROGRESS ON
        CMAKE_ARGS ${ROBOT_FARM_FORWARDED_CMAKE_ARGS})
