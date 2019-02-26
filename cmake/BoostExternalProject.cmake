#[[ CMake guard. ]]
if(TARGET BoostExternalProject)
    return()
endif(TARGET BoostExternalProject)

include(ExternalProject)

ExternalProject_Add(BoostExternalProject
        PREFIX                  ${CMAKE_CURRENT_BINARY_DIR}/boost
        URL                     https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz
        DOWNLOAD_NO_PROGRESS    ON
        CONFIGURE_COMMAND       <SOURCE_DIR>/bootstrap.sh --prefix=${CMAKE_INSTALL_PREFIX} --without-libraries=python
        BUILD_COMMAND           <SOURCE_DIR>/b2 install
        BUILD_IN_SOURCE         ON
        INSTALL_COMMAND         ""
        )