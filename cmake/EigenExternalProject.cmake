#[[ CMakes version of pragma once. ]]
if(TARGET EigenExternalProject)
    return()
endif(EigenExternalProject)

include(ExternalProject)

ExternalProject_Add(EigenExternalProject
        )