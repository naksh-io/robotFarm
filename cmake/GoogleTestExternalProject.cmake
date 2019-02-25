#[[ Cmake guard. ]]
if(TARGET GoogleTestExternalProject)
    return()
endif(TARGET GoogleTestExternalProject)

include(ExternalProject)

ExternalProject_Add(GoogleTestExternalProject
        PREFIX                  ${CMAKE_CURRENT_BINARY_DIR}/googleTest
        URL                     https://github.com/google/googletest/archive/release-1.8.1.zip
        DOWNLOAD_NO_PROGRESS    ON
        CMAKE_ARGS
            -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
            -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
            -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
        )