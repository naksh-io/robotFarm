#[[ CMake guard. ]]
if(TARGET Python3ExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_PYTHON3_URL
    "https://github.com/python/cpython/archive/v3.5.7.zip"
    CACHE STRING
    "URL of the Python3 source archive")

externalproject_add(Python3ExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/python3
                    URL ${ROBOT_FARM_PYTHON3_URL}
                    DOWNLOAD_NO_PROGRESS ON

                    CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --silent
                    --prefix=${CMAKE_INSTALL_PREFIX}
                    --enable-shared
                    --enable-optimizations
                    --enable-loadable-sqlite-extensions
                    --enable-ipv6
                    --with-lto
                    --with-address-sanitizer
                    --with-system-expat
                    --with-system-ffi
                    --with-system-libmpdec
                    --with-signal-module
                    --with-threads
                    --with-fpectl
                    --without-pymalloc)
