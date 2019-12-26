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

option(ROBOT_FARM_BUILD_PYTHON3 "Build Python3" OFF)
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

#option(ROBOT_FARM_BUILD_ATLAS "Build Atlas" OFF)
#if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_ATLAS)
#    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/AtlasExternalProject.cmake)
#endif ()
#
#option(ROBOT_FARM_BUILD_SUITE_SPARSE "Build Suite Sparse" OFF)
#if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_SUITE_SPARSE)
#    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/SuiteSparseExternalProject.cmake)
#endif ()

option(ROBOT_FARM_BUILD_EIGEN3 "Build Eigen3" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_EIGEN3)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Eigen3ExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_GFLAGS "Build GFlags" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_GFLAGS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/GFlagsExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_GLOG "Build Glog" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_GLOG)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/GlogExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_CERES_SOLVER "Build Ceres Solver" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_CERES_SOLVER)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/CeresSolverExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_PROTOBUF "Build Protobuf" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_PROTOBUF)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/ProtobufExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_OPENCV "Build OpenCV" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_OPENCV)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OpenCVExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_FLAT_BUFFERS "Build Flat Buffers" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_FLAT_BUFFERS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/FlatBuffersExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_CEREAL "Build Cereal" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_CEREAL)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/CerealExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_NLOHMANN_JSON "Build nlohmann's json" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_NLOHMANN_JSON)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/NlohmannJsonExternalProject.cmake)
endif ()
