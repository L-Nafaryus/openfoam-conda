About openfoam-conda
====================

Home: https://github.com/L-Nafaryus/openfoam-conda

Package license: GPL3

Recipe license: BSD-3-Clause

Summary: OpenFOAM-9

Development: https://github.com/OpenFOAM/OpenFOAM-9

Documentation: https://openfoam.org/resources

OpenFOAM is a free, open source computational fluid dynamics (CFD) software package released by the OpenFOAM Foundation.

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [openfoam](https://anaconda.org/L-Nafaryus/openfoam) | ![downloads](https://anaconda.org/l-nafaryus/openfoam/badges/downloads.svg) | ![version](https://anaconda.org/l-nafaryus/openfoam/badges/version.svg) | ![platforms](https://anaconda.org/l-nafaryus/openfoam/badges/platforms.svg) |

Installing openfoam
===================

Installing `openfoam` from the `l-nafaryus` channel can be achieved by adding `l-nafaryus` to your channels with:
```
conda config --add channels l-nafaryus
```
Once the `l-nafaryus` channel has been enabled, `openfoam` can be installed with:
```
conda install openfoam
```

Building locally
================

Building `openfoam` locally can be achieved by executing script:
```
bash scripts/build-steps.sh
```

Building in container
=====================

Building `openfoam` in container can be achieved by executing script:
```
bash scripts/run-container-build.sh
```

Be sure that you installed and configured `podman`.

Recipe Maintainers
==================

* [L-Nafaryus](https://github.com/L-Nafaryus)