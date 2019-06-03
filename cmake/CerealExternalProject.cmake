#[[ Cmake guard. ]]
if(TARGET CerealExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_CEREAL_URL
    "https://github.com/USCiLab/cereal/archive/v1.2.2.zip"
    CACHE STRING
    "URL of the Cereal source archive")

externalproject_add(CerealExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/cereal
                    URL ${ROBOT_FARM_CEREAL_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CMAKE_ARGS
                    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
                    -DJUST_INSTALL_CEREAL:BOOL=ON)
