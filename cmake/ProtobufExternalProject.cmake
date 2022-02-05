#[[ Cmake guard. ]]
if(TARGET ProtobufExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_PROTOBUF_URL
        "https://github.com/protocolbuffers/protobuf/releases/download/v3.19.1/protobuf-all-3.19.1.tar.gz"
        CACHE STRING
        "URL of the Protocol Buffers source archive")

externalproject_add(ProtobufExternalProject
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}/protobuf
        URL ${ROBOT_FARM_PROTOBUF_URL}
        DOWNLOAD_NO_PROGRESS ON
        CONFIGURE_COMMAND
            <SOURCE_DIR>/configure
            --prefix=${CMAKE_INSTALL_PREFIX}
            --with-sysroot=${CMAKE_INSTALL_PREFIX})
