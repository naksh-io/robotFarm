#[[ Cmake guard. ]]
if(TARGET GlogExternalProject)
    return()
endif()

include(ExternalProject)
include(${CMAKE_CURRENT_LIST_DIR}/GFlagsExternalProject.cmake)

set(ROBOT_FARM_GLOG_URL
    "https://github.com/google/glog/archive/v0.4.0.zip"
    CACHE STRING
    "URL of the Google Log source archive")

externalproject_add(GlogExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/glog
                    URL ${ROBOT_FARM_GLOG_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CMAKE_ARGS
                    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
                    -DBUILD_SHARED_LIBS:BOOL=ON)

add_dependencies(GlogExternalProject GFlagsExternalProject)
