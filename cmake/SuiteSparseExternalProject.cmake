#[[ Cmake guard.
if(TARGET SuiteSparseExternalProject)
    return()
endif()

include(ExternalProject)
include(ProcessorCount)
include(${CMAKE_CURRENT_LIST_DIR}/AtlasExternalProject.cmake)

processorcount(NUM_PROCESSORS)

set(ROBOT_FARM_SUITE_SPARSE_URL
    "http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-5.4.0.tar.gz"
    CACHE STRING
    "URL of the Suite Sparse source archive")

externalproject_add(SuiteSparseExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/suiteSparse
                    URL ${ROBOT_FARM_SUITE_SPARSE_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CONFIGURE_COMMAND ""

                    BUILD_COMMAND
                    JOBS=${NUM_PROCESSORS}
                    make
                    LAPACK=${CMAKE_INSTALL_PREFIX}/lib/liblapack.a
                    BLAS=${CMAKE_INSTALL_PREFIX}/lib/libcblas.a
                    config library

                    BUILD_IN_SOURCE ON
                    INSTALL_COMMAND make INSTALL=${CMAKE_INSTALL_PREFIX} install)

add_dependencies(SuiteSparseExternalProject AtlasExternalProject) ]]
