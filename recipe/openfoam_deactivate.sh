#!/usr/bin/env bash

VERSION=9

#   unload through openfoam
source "${CONDA_PREFIX}/openfoam/OpenFOAM-${VERSION}/etc/config.sh/unset"

IFS="#"

#   to be sure ...
#   ... filter PATH
PATH_NEW=

for pathold in $(echo $PATH | sed "s/:/#/g"); do 
    case $pathold in 
        "${CONDA_PREFIX}"*) 
            ;; 
        *)
            case ":$PATH_NEW:" in
                *:"$pathold":*)
                    ;;
                *)
                    PATH_NEW="${PATH_NEW:+$PATH_NEW:}$pathold"
            esac
            ;;
    esac
done

export PATH=$PATH_NEW

#   ... filter LD_LIBRARY
LD_LIBRARY_NEW=

for pathold in $(echo $LD_LIBRARY | sed "s/:/#/g"); do 
    case $pathold in 
        "${CONDA_PREFIX}"*) 
            ;; 
        *)
            case ":$LD_LIBRARY_NEW:" in
                *:"$pathold":*)
                    ;;
                *)
                    LD_LIBRARY_NEW="${LD_LIBRARY_NEW:+$LD_LIBRARY_NEW:}$pathold"
            esac
            ;;
    esac
done

export LD_LIBRARY=$LD_LIBRARY_NEW

#   unload local variables
unset VERSION IFS PATH_NEW LD_LIBRARY_NEW 
