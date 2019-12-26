#[[ CMake guard. ]]
if(TARGET NlohmannJsonExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_NLOHMANN_JSON_URL
    "https://github.com/nlohmann/json/archive/v3.7.3.zip"
    CACHE STRING
    "URL of the nlohmann's json source archive")

externalproject_add(NlohmannJsonExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/nlohmann-json
                    URL ${ROBOT_FARM_NLOHMANN_JSON_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CMAKE_ARGS
                    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX})
