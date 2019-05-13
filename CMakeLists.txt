cmake_minimum_required(VERSION 3.5.2)

project(robotFarm VERSION 0.1.0.0 LANGUAGES C CXX)

#[[ Build all option to test the correctness of the project setup.
    To build, set options corresponding to the desired libraries
    during configuration. ]]
option(ROBOT_FARM_BUILD_ALL "Build All libraries" OFF)

option(ROBOT_FARM_BUILD_GOOGLE_TEST "Build Google Tests" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_GOOGLE_TEST)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/GoogleTestExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_PYTHON3 "Build Pyhton3" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_PYTHON3)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Python3ExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_BOOST "Build Boost" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_BOOST)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/BoostExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_VTK "Build VTK" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_VTK)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/VTKExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_ATLAS "Build Atlas" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_ATLAS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/AtlasExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_SUITE_SPARSE "Build Suite Sparse" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_SUITE_SPARSE)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/SuiteSparseExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_EIGEN3 "Build Eigen3" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_EIGEN3)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Eigen3ExternalProject.cmake)
endif ()
