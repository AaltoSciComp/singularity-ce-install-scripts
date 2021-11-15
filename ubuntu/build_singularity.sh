#!/bin/bash
set -euo pipefail

. versions.sh

GO_TAR=go${GO_VERSION}.linux-amd64.tar.gz
SINGULARITY_TAR=singularity-ce-${SINGULARITY_RELEASE}.tar.gz

if [ ! -f $GO_TAR ]; then
	wget https://golang.org/dl/${GO_TAR}
fi
if [ ! -d go ]; then
	echo "${GO_CHECKSUM}  ${GO_TAR}" | sha256sum -c
	tar xf ${GO_TAR}
fi

if [ ! -f ${SINGULARITY_TAR} ] ; then
	wget https://github.com/sylabs/singularity/releases/download/v${SINGULARITY_RELEASE}/${SINGULARITY_TAR}
fi

rm -rf singularity-ce-$SINGULARITY_RELEASE
echo "${SINGULARITY_CHECKSUM}  ${SINGULARITY_TAR}" | sha256sum -c
tar xf ${SINGULARITY_TAR}

cd singularity-ce-$SINGULARITY_RELEASE

sed -i 's:package_version=`scripts/get-version`:package_version='$SINGULARITY_RELEASE':g' mconfig

./mconfig --prefix=$SINGULARITY_PREFIX -V ${SINGULARITY_RELEASE}
cd ./builddir
make
