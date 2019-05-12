#[[ CMake guard. ]]
if(TARGET Python3ExternalProject)
    return()
endif()

include(ExternalProject)

ExternalProject_Add(Python3ExternalProject
        PREFIX                  ${CMAKE_CURRENT_BINARY_DIR}/python3
        URL                     https://github.com/python/cpython/archive/v3.5.7.zip
        DOWNLOAD_NO_PROGRESS    ON

        CONFIGURE_COMMAND       <SOURCE_DIR>/configure --silent --prefix=${CMAKE_INSTALL_PREFIX}
                                --enable-shared --without-pymalloc --enable-ipv6
                                --enable-optimizations --with-lto --with-address-sanitizer)
