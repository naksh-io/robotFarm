#[[ CMake guard. ]]
if(TARGET OatppExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_OATPP_URL
        "https://github.com/oatpp/oatpp/archive/refs/tags/1.3.0.tar.gz"
        CACHE STRING
        "URL of the oatpp source archive")

externalproject_add(OatppExternalProject
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/oatpp
        URL ${ROBOT_FARM_OATPP_URL}
        DOWNLOAD_NO_PROGRESS ON
        CMAKE_ARGS ${ROBOT_FARM_FORWARDED_CMAKE_ARGS})
