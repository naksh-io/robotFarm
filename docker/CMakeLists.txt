add_custom_target(robotFarmDockerBuild
        COMMAND bash -c "docker build                                                           \
                            --force-rm                                                          \
                            --tag robotfarm/build                                               \
                            --file ${CMAKE_CURRENT_LIST_DIR}/robotFarm-ubuntu-18.04.dockerfile  \
                            ${robotFarm_SOURCE_DIR}"

        WORKING_DIRECTORY ${robotFarm_SOURCE_DIR}
        COMMENT "Building robotFarm in docker container."
        VERBATIM)
