#!/bin/bash

. versions.sh

echo 'Installing packages required by singularity'

sudo -u $SUDO_USER sudo apt-get install -y build-essential \
  libssl-dev uuid-dev libseccomp-dev \
  pkg-config squashfs-tools cryptsetup
