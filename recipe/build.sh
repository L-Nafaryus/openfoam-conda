
#   thirdparty is ignored
export VERSION=9

export FOAM_DIR_NAME="${SRC_DIR}/OpenFOAM-${VERSION}"
export THIRDPARTY_DIR_NAME="${SRC_DIR}/ThirdParty-${VERSION}"

export FOAM_INSTALL_DIR="${PREFIX}/openfoam/OpenFOAM-${VERSION}"
export THIRDPARTY_INSTALL_DIR="${PREFIX}/openfoam/ThirdParty-${VERSION}"

export FOAM_ACTIVATE="${PREFIX}/etc/conda/activate.d"

#   provide soft links for openfoam
for binutil in $(ls "${BUILD_PREFIX}/bin/${BUILD}-"* | xargs); do 
    case "$binutil" in 
        "${BUILD_PREFIX}/bin/${BUILD}-"*) 
            shortname=$(echo "$binutil" | sed "s/${BUILD}-//g")
            ln -sfv "$binutil" "$shortname"
            ;; 
    esac 
done

#   source foam dot file
source "${FOAM_DIR_NAME}/etc/bashrc" || exit 1

#   
echo "cFLAGS += -I ${BUILD_PREFIX}/include" >> "${FOAM_DIR_NAME}/wmake/rules/linux64Gcc/c"
echo "c++FLAGS += -I ${BUILD_PREFIX}/include" >> "${FOAM_DIR_NAME}/wmake/rules/linux64Gcc/c++"

#   compile thirdparty
# ${THIRDPARTY_DIR_NAME}/Allwmake -j || exit 1
# wmakeLnIncludeAll -update || exit 1
# wmRefresh || exit 1

#   compile openfoam
${FOAM_DIR_NAME}/Allwmake -j || exit 1

#   clean up and prepare
wclean all || exit 1
wmakeLnIncludeAll || exit 1

#   install
echo "Installing ..."
mkdir -pv ${THIRDPARTY_INSTALL_DIR} ${FOAM_INSTALL_DIR} 

#cp -r ${THIRDPARTY_DIR_NAME}/* ${THIRDPARTY_INSTALL_DIR}/
cp -r ${FOAM_DIR_NAME}/* ${FOAM_INSTALL_DIR}/

#   activation and deactivation scripts
for CHANGE in "activate" "deactivate"; do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/openfoam_${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/openfoam_${CHANGE}.sh"
done
