#[[ CMake guard. ]]
if(TARGET NlohmannJsonExternalProject)
    return()
endif()

include(ExternalProject)
option(ROBOT_FARM_SKIP_NLOHMANN_JSON "Skip Nlohmann's Json" OFF)

if(ROBOT_FARM_SKIP_NLOHMANN_JSON)
    add_custom_target(NlohmannJsonExternalProject)
else()
    set(ROBOT_FARM_NLOHMANN_JSON_URL
        "https://github.com/nlohmann/json/archive/refs/tags/v3.10.4.tar.gz"
        CACHE STRING
        "URL of the nlohmann's json source archive")

    externalproject_add(NlohmannJsonExternalProject
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/nlohmann-json
        URL ${ROBOT_FARM_NLOHMANN_JSON_URL}
        DOWNLOAD_NO_PROGRESS ON
        CMAKE_ARGS ${ROBOT_FARM_FORWARDED_CMAKE_ARGS})
endif()
