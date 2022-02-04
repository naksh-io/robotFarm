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
                    CMAKE_ARGS ${ROBOT_FARM_FORWARDED_CMAKE_ARGS})
