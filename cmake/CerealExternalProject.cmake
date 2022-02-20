#[[ Cmake guard. ]]
if(TARGET CerealExternalProject)
    return()
endif()

include(ExternalProject)

option(ROBOT_FARM_SKIP_CEREAL "Skip Cereal" OFF)

if(ROBOT_FARM_SKIP_CEREAL)
    add_custom_target(CerealExternalProject)
else()
    set(ROBOT_FARM_CEREAL_URL
        "https://github.com/USCiLab/cereal/archive/refs/tags/v1.3.1.tar.gz"
        CACHE STRING
        "URL of the Cereal source archive")

    externalproject_add(CerealExternalProject
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/cereal
        URL ${ROBOT_FARM_CEREAL_URL}
        DOWNLOAD_NO_PROGRESS ON
        CMAKE_ARGS ${ROBOT_FARM_FORWARDED_CMAKE_ARGS})
endif()
