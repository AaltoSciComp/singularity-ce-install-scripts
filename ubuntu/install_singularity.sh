#!/bin/bash
set -euo pipefail

. versions.sh

cd singularity-ce-${SINGULARITY_RELEASE}/builddir
sudo -u $SUDO_USER sudo make install
