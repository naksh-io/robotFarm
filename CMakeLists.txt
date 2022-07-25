cmake_minimum_required(VERSION 3.5.2)

project(robotFarm VERSION 0.1.0.0 LANGUAGES C CXX)

set(BUILD_SHARED_LIBS OFF CACHE BOOL "Global flag to build shared libraries [Default: OFF]")
set(BUILD_TESTING OFF CACHE BOOL "Global flag used by CTest [Default: OFF]")

set(ROBOT_FARM_FORWARDED_CMAKE_ARGS
        -DCMAKE_MAKE_PROGRAM:PATH=${CMAKE_MAKE_PROGRAM}
        -DCMAKE_C_COMPILER:PATH=${CMAKE_C_COMPILER}
        -DCMAKE_CXX_COMPILER:PATH=${CMAKE_CXX_COMPILER}
        -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY:BOOL=ON
        -DCMAKE_EXPORT_PACKAGE_REGISTRY:BOOL=OFF
        -DCMAKE_FIND_USE_PACKAGE_REGISTRY:BOOL=OFF)

if(CMAKE_BUILD_TYPE)
    list(APPEND ROBOT_FARM_FORWARDED_CMAKE_ARGS -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE})
endif()

set(PREFIX_PATH "")

if(CMAKE_INSTALL_PREFIX)
    list(APPEND ROBOT_FARM_FORWARDED_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX})
    list(APPEND PREFIX_PATH ${CMAKE_INSTALL_PREFIX})
endif()

if(CMAKE_PREFIX_PATH)
    list(APPEND PREFIX_PATH ${CMAKE_PREFIX_PATH})
endif()

list(APPEND ROBOT_FARM_FORWARDED_CMAKE_ARGS -DCMAKE_PREFIX_PATH:STRING="${PREFIX_PATH}")
list(APPEND ROBOT_FARM_FORWARDED_CMAKE_ARGS "-DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}")
list(APPEND ROBOT_FARM_FORWARDED_CMAKE_ARGS "-DBUILD_TESTING:BOOL=${BUILD_TESTING}")


#include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/AtlasExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/BoostExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/CapnprotoExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/CerealExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/CeresSolverExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Eigen3ExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/FlatBuffersExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/GFlagsExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/GlogExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/GoogleTestExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/NlohmannJsonExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OatppExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OatppWebSocketExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OgreExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OpenCVExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/ProtobufExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Python3ExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/SpdLogExternalProject.cmake)
#include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/SuiteSparseExternalProject.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/VTKExternalProject.cmake)

add_subdirectory(docker)
