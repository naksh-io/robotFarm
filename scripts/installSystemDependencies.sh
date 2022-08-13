#!/bin/sh
####################################################################################################
# Copyright (c) 2021.                                                                              #
# Project  : Naksh                                                                                 #
# Author   : Anurag Jakhotia                                                                       #
####################################################################################################

SCRIPT_DIR=$(dirname "${0}")
OS_NAME="${1}"
TAG="${2}"

display_usage() {
    echo "sh installSystemDependencies.sh <OS NAME> <TAG>"
    echo "Refer to \"supportedOS\" and \"packageTags\" sub-structures"  \
         "of the sibling file \"systemDependencies.json\" respectively" \
         "for valid options to each argument."
}

if [ -z "${OS_NAME}" ]; then
    echo "No OS name has been provided."
    display_usage
    exit 1
fi
# TODO: Check if the OS name of the listed supportedOS


if [ -z "${TAG}" ]; then
    echo "No tag has been provided."
    display_usage
    exit 1
fi
# TODO: Check if tag is one of the listed packageTags


apt-get install -y --no-install-recommends jq || exit 1

PACKAGE_LIST=$(jq -r                                        \
    --arg OS_NAME "$OS_NAME"                                \
    --arg TAG "$TAG"                                        \
    '.packages | .[] | select(.tag==$TAG) | .[$OS_NAME]'    \
    "${SCRIPT_DIR}"/systemDependencies.json) || exit 1


if [ -n "${PACKAGE_LIST}" ]; then
    printf "************************************\n"
    printf "Installing the following packages:\n%s\n" "${PACKAGE_LIST}"
    printf "************************************\n"
    apt-get install -y --no-install-recommends ${PACKAGE_LIST} || exit 1
else
    echo "No packages are needed."
fi
