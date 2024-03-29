#[[ Cmake guard. ]]
if(TARGET CerealExternalProject)
    return()
endif()

include(ExternalProject)
include(${CMAKE_CURRENT_LIST_DIR}/BoostExternalProject.cmake)

option(ROBOT_FARM_SKIP_CerealExternalProject "Forcefully skip Cereal" OFF)

if(ROBOT_FARM_SKIP_CerealExternalProject)
    add_custom_target(CerealExternalProject)
else()
    list(APPEND ROBOT_FARM_BUILD_LIST CerealExternalProject)

    set(ROBOT_FARM_CEREAL_URL
        "https://github.com/USCiLab/cereal/archive/refs/tags/v1.3.2.tar.gz"
        CACHE STRING
        "URL of the Cereal source archive")

    externalproject_add(CerealExternalProject
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/cereal
        URL ${ROBOT_FARM_CEREAL_URL}
        DOWNLOAD_NO_PROGRESS ON
        CMAKE_ARGS
            ${ROBOT_FARM_FORWARDED_CMAKE_ARGS}
            -DBoost_USE_STATIC_RUNTIME:BOOL=$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>
            -DBUILD_SANDBOX:BOOL=OFF) # Sandbox fails with warnings.
endif()

add_dependencies(CerealExternalProject BoostExternalProject)
