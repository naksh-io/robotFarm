#[[ Cmake guard. ]]
if(TARGET OpenCVExternalProject)
    return()
endif()

include(ExternalProject)
include(${CMAKE_CURRENT_LIST_DIR}/VTKExternalProject.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Python3ExternalProject.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Eigen3ExternalProject.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ProtobufExternalProject.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/GFlagsExternalProject.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/GlogExternalProject.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/CeresSolverExternalProject.cmake)

find_package(CUDA)

option(ROBOT_FARM_OPENCV_WITH_NON_FREE_CONTRIB
       "Build OpenCV with non-free contrib modules. Please be sure to comply with the licensing"
       OFF)

set(ROBOT_FARM_OPENCV_CONTRIB_URL
    "https://github.com/opencv/opencv_contrib/archive/4.1.0.zip"
    CACHE STRING
    "URL of the OpenCV contrib source archive")

set(ROBOT_FARM_OPENCV_URL
    "https://github.com/opencv/opencv/archive/4.1.0.zip"
    CACHE STRING
    "URL of the OpenCV source archive")

if(ROBOT_FARM_OPENCV_WITH_NON_FREE_CONTRIB)

    externalproject_add(OpenCVContribExternalProject
                        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/opencv-contrib
                        URL ${ROBOT_FARM_OPENCV_CONTRIB_URL}
                        DOWNLOAD_NO_PROGRESS ON
                        CONFIGURE_COMMAND ""
                        BUILD_COMMAND ""
                        INSTALL_COMMAND "")

    externalproject_get_property(OpenCVContribExternalProject SOURCE_DIR)

    externalproject_add(OpenCVExternalProject
                        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/opencv
                        URL ${ROBOT_FARM_OPENCV_URL}
                        DOWNLOAD_NO_PROGRESS ON
                        CMAKE_ARGS
                        -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                        -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                        -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
                        -DOPENCV_EXTRA_MODULES_PATH:PATH=${SOURCE_DIR}/modules
                        -DOPENCV_ENABLE_NONFREE:BOOL=ON
                        -DWITH_CUDA:BOOL=${CUDA_FOUND}
                        -DWITH_VTK:BOOL=ON
                        -DWITH_NVCUVID:BOOL=OFF)

    add_dependencies(OpenCVExternalProject OpenCVContribExternalProject)

else()
    externalproject_add(OpenCVExternalProject
                        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/opencv
                        URL ${ROBOT_FARM_OPENCV_URL}
                        DOWNLOAD_NO_PROGRESS ON
                        CMAKE_ARGS
                        -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                        -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                        -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
                        -DWITH_CUDA:BOOL=${CUDA_FOUND}
                        -DWITH_VTK:BOOL=ON
                        -DWITH_NVCUVID:BOOL=OFF)
endif()

add_dependencies(OpenCVExternalProject
                 VTKExternalProject
                 Python3ExternalProject
                 Eigen3ExternalProject
                 ProtobufExternalProject
                 GFlagsExternalProject
                 GlogExternalProject
                 CeresSolverExternalProject)
