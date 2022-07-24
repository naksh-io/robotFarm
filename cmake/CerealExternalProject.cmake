#[[ Cmake guard. ]]
if(TARGET CerealExternalProject)
    return()
endif()

include(ExternalProject)
include(${CMAKE_CURRENT_LIST_DIR}/BoostExternalProject.cmake)

option(ROBOT_FARM_SKIP_CEREAL "Skip Cereal" OFF)

if(ROBOT_FARM_SKIP_CEREAL)
    add_custom_target(CerealExternalProject)
else()
    set(ROBOT_FARM_CEREAL_URL
        "https://github.com/USCiLab/cereal/archive/refs/tags/v1.3.1.tar.gz"
        CACHE STRING
        "URL of the Cereal source archive")

    set(ROBOT_FARM_CEREAL_CMAKE_ARGS ${ROBOT_FARM_FORWARDED_CMAKE_ARGS})

    if(NOT ${BUILD_SHARED_LIBS})
        list(APPEND ROBOT_FARM_CEREAL_CMAKE_ARGS -DBoost_USE_STATIC_RUNTIME:BOOL=ON)
    endif()

    externalproject_add(CerealExternalProject
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/cereal
        URL ${ROBOT_FARM_CEREAL_URL}
        DOWNLOAD_NO_PROGRESS ON
        CMAKE_ARGS ${ROBOT_FARM_CEREAL_CMAKE_ARGS})
endif()

add_dependencies(CerealExternalProject BoostExternalProject)
