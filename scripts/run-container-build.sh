#!/usr/bin/env bash

set -xeo pipefail

IMAGE="docker.io/mambaorg/micromamba"
ROOT="$(cd "$(dirname "$0")/.."; pwd;)"

podman pull ${IMAGE}

podman run \
    -v "${ROOT}/recipe:/tmp/recipe" \
    -v "${ROOT}/scripts:/tmp/scripts" \
    ${IMAGE} \
    bash /tmp/scripts/build-steps.sh
