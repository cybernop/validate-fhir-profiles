#!/bin/sh

if [ -z "$VALIDATOR_VERSION" ]; then
    VALIDATOR_VERSION=6.3.20
fi

if [ -z "$1" ]; then
    PROJECT_DIR=$PWD
else
    PROJECT_DIR=$1
fi

USER_SETTING="-u $(id -u):$(id -g)"
PROJECT_MOUNT="-v ${PROJECT_DIR}:/project"
IMAGE="ghcr.io/cybernop/validate-fhir-profiles:${VALIDATOR_VERSION}"
DOCKER_OPTS="--pull always"

docker run --rm $USER_SETTING $PROJECT_MOUNT $DOCKER_OPTS $IMAGE
