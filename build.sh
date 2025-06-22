#! /usr/bin/env bash
# Script to build image bbb image
# Author: Siddhant Jajoo.
# Modified: Josh Heyse

git submodule init
git submodule sync
git submodule update

# local.conf won't exist until this step on first execution
source poky/oe-init-build-env

rm -rf build/*

CONFLINE="MACHINE = \"beaglebone-yocto\""

cat conf/local.conf | grep "${CONFLINE}" >/dev/null
local_conf_info=$?

if [ $local_conf_info -ne 0 ]; then
  echo "Append ${CONFLINE} in the local.conf file"
  echo ${CONFLINE} >>conf/local.conf

  # echo 'PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-rt"' >>conf/local.conf
  # echo 'KERNEL_FEATURES += "features/latency/latency.scc"' >>conf/local.conf
  echo 'IMAGE_INSTALL += "can-utils"' >>conf/local.conf

  # Add CAN support
  echo 'KERNEL_MODULE_AUTOLOAD += "can can-dev can-raw mcp251x"' >>conf/local.conf

else
  echo "${CONFLINE} already exists in the local.conf file"
fi

# bitbake-layers add-layer ../meta-openembedded/meta-oe

# bitbake-layers show-layers | grep "meta-bbc" >/dev/null
# layer_info=$?
#
# if [ $layer_info -ne 0 ]; then
#   echo "Adding meta-bbc layer"
#   bitbake-layers add-layer ../meta-bbc
# else
#   echo "meta-bbc layer already exists"
# fi

set -e
bitbake core-image-minimal

/bin/bash

# cp tmp/deploy/images/beaglebone-yocto/core-image-minimal-beaglebone-yocto.rootfs.wic ../core-image-minimal-beaglebone-yocto.rootfs.wic
