#!/usr/bin/env bash

VERSION=9

#   source foam dot file
source "${CONDA_PREFIX}/openfoam/OpenFOAM-${VERSION}/etc/bashrc"

#   unload local variables
unset VERSION