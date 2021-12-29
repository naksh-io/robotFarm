#[[ Cmake guard. ]]
if(TARGET VTKExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_VTK_URL
    "https://github.com/Kitware/VTK/archive/refs/tags/v9.1.0.tar.gz"
    CACHE STRING
    "URL of the VTK source archive")

externalproject_add(VTKExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/vtk
                    URL ${ROBOT_FARM_VTK_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CMAKE_ARGS
                    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
                    -DBUILD_TESTING:BOOL=OFF
                    -DBUILD_SHARED_LIBS:BOOL=ON)
