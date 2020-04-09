#[[ CMake guard. ]]
if(TARGET OgreExternalProject)
    return()
endif()

include(ExternalProject)
include(${CMAKE_CURRENT_LIST_DIR}/BoostExternalProject.cmake)

set(ROBOT_FARM_OGRE_URL
        "https://github.com/OGRECave/ogre/archive/v1.12.5.zip"
        CACHE STRING
        "URL of the OGRE source archive")

externalproject_add(OgreExternalProject
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/ogre
        URL ${ROBOT_FARM_OGRE_URL}
        DOWNLOAD_NO_PROGRESS ON
        CMAKE_ARGS
        -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
        -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
        -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
        -DOGRE_BUILD_COMPONENT_OVERLAY_IMGUI:BOOL=OFF
        -DOGRE_BUILD_DEPENDENCIES:BOOL=OFF)

add_dependencies(OgreExternalProject BoostExternalProject)
