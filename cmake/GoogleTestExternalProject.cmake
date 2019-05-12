#[[ Cmake guard. ]]
if(TARGET GoogleTestExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_GOOGLE_TEST_URL
    "https://github.com/google/googletest/archive/release-1.8.1.zip"
    CACHE STRING
    "URL of the Google Test source archive")

externalproject_add(GoogleTestExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/googleTest
                    URL ${ROBOT_FARM_GOOGLE_TEST_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CMAKE_ARGS
                    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX})
