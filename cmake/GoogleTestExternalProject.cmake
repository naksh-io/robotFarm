#[[ Cmake guard. ]]
if(TARGET GoogleTestExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_GOOGLE_TEST_URL
    "https://github.com/google/googletest/archive/refs/tags/release-1.11.0.tar.gz"
    CACHE STRING
    "URL of the Google Test source archive")

externalproject_add(GoogleTestExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/googleTest
                    URL ${ROBOT_FARM_GOOGLE_TEST_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CMAKE_ARGS ${ROBOT_FARM_FORWARDED_CMAKE_ARGS})
