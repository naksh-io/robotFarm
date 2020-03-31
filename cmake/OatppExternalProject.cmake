#[[ CMake guard. ]]
if(TARGET OatppExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_OATPP_URL
        "https://github.com/oatpp/oatpp/archive/1.0.0.zip"
        CACHE STRING
        "URL of the oatpp source archive")

externalproject_add(OatppExternalProject
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/oatpp
        URL ${ROBOT_FARM_OATPP_URL}
        DOWNLOAD_NO_PROGRESS ON
        CMAKE_ARGS
        -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
        -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
        -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
        -DBUILD_SHARED_LIBS:BOOL=ON)
