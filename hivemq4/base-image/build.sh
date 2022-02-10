#!/usr/bin/env bash

#set -o xtrace

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${DIR}

HIVEMQ_VERSION=${VERSION:-4.7.3}
IMAGE_NAME=${TARGETIMAGE:-hivemq/hivemq4:$HIVEMQ_VERSION}

#download HiveMQ binary
[ -f "hivemq-${HIVEMQ_VERSION}.zip" ] || (curl -L https://www.hivemq.com/releases/hivemq-${HIVEMQ_VERSION}.zip -o hivemq-${HIVEMQ_VERSION}.zip)

#build docker image
docker build --build-arg HIVEMQ_VERSION=${HIVEMQ_VERSION} -f Dockerfile . -t ${IMAGE_NAME}