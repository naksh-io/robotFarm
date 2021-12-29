#[[ Cmake guard. ]]
if(TARGET CeresSolverExternalProject)
    return()
endif()

include(ExternalProject)
include(${CMAKE_CURRENT_LIST_DIR}/GFlagsExternalProject.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/GlogExternalProject.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Eigen3ExternalProject.cmake)

set(ROBOT_FARM_CERES_SOLVER_URL
    "https://github.com/ceres-solver/ceres-solver/archive/refs/tags/2.0.0.tar.gz"
    CACHE STRING
    "URL of the Ceres Solver source archive")

externalproject_add(CeresSolverExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/ceressolver
                    URL ${ROBOT_FARM_CERES_SOLVER_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CMAKE_ARGS
                    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
                    -DBUILD_SHARED_LIBS:BOOL=ON)


add_dependencies(CeresSolverExternalProject GFlagsExternalProject GlogExternalProject Eigen3ExternalProject)
