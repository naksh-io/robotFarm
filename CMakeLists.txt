cmake_minimum_required(VERSION 3.5.2)

project(robotFarm VERSION 0.1.0.0 LANGUAGES C CXX)

#[[ Build all option to test the correctness of the project setup.
    To build, set options corresponding to the desired libraries
    during configuration. ]]
option(ROBOT_FARM_BUILD_ALL "Build All libraries" OFF)
option(ROBOT_FARM_SKIP_PYTHON3 "Skip building of Python3" ON)

set(ROBOT_FARM_FORWARDED_CMAKE_ARGS
    -DCMAKE_MAKE_PROGRAM:PATH=${CMAKE_MAKE_PROGRAM}
    -DCMAKE_C_COMPILER:PATH=${CMAKE_C_COMPILER}
    -DCMAKE_CXX_COMPILER:PATH=${CMAKE_CXX_COMPILER})

if(CMAKE_BUILD_TYPE)
    list(APPEND ROBOT_FARM_FORWARDED_CMAKE_ARGS -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE})
endif()

if(CMAKE_INSTALL_PREFIX)
    list(APPEND ROBOT_FARM_FORWARDED_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX})
endif()

list(APPEND ROBOT_FARM_FORWARDED_CMAKE_ARGS -DCMAKE_PREFIX_PATH:STRING="${CMAKE_INSTALL_PREFIX};${CMAKE_PREFIX_PATH}")

if(BUILD_SHARED_LIBS)
    list(APPEND ROBOT_FARM_FORWARDED_CMAKE_ARGS "-DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}")
endif()

if(BUILD_TESTING)
    list(APPEND ROBOT_FARM_FORWARDED_CMAKE_ARGS "-DBUILD_TESTING:BOOL=${BUILD_TESTING}")
endif()


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

option(ROBOT_FARM_BUILD_CAPNPROTO "Build Cap'n'proto" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_CAPNPROTO)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/CapnprotoExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_OATPP "Build oatpp" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_OATPP)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OatppExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_OATPP_WEBSOCKET "Build oatpp websocket" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_OATPP_WEBSOCKET)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OatppWebSocketExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_OGRE "Build OGRE" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_OGRE)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OgreExternalProject.cmake)
endif ()

option(ROBOT_FARM_BUILD_SPDLOG "Build SpdLog" OFF)
if (ROBOT_FARM_BUILD_ALL OR ROBOT_FARM_BUILD_SPDLOG)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/SpdLogExternalProject.cmake)
endif ()

add_subdirectory(docker)
