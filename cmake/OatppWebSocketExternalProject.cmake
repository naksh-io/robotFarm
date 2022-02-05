#[[ CMake guard. ]]
if(TARGET OatppWebsocketExternalProject)
    return()
endif()

include(ExternalProject)
include(${CMAKE_CURRENT_LIST_DIR}/OatppExternalProject.cmake)

set(ROBOT_FARM_OATPP_WEBSOCKET_URL
        "https://github.com/oatpp/oatpp-websocket/archive/refs/tags/1.3.0.tar.gz"
        CACHE STRING
        "URL of the oatpp-websocket source archive")

externalproject_add(OatppWebsocketExternalProject
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/oatpp-websocket
        URL ${ROBOT_FARM_OATPP_WEBSOCKET_URL}
        DOWNLOAD_NO_PROGRESS ON
        CMAKE_ARGS ${ROBOT_FARM_FORWARDED_CMAKE_ARGS})

add_dependencies(OatppWebsocketExternalProject OatppExternalProject)
