#[[ CMakes version of pragma once. ]]
if(TARGET EigenExternalProject)
    return()
endif()

include(ExternalProject)

ExternalProject_Add(EigenExternalProject
        )