#[[ CMakes version of pragma once. ]]
if(TARGET Eigen3ExternalProject)
    return()
endif()

include(ExternalProject)

ExternalProject_Add(Eigen3ExternalProject
        )