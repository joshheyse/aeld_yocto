#! /usr/bin/env bash
image=${1-"/home/josh/code/aeld_yocto/build/tmp/deploy/images/beaglebone-yocto/core-image-bbc-beaglebone-yocto.rootfs.wic"}
disk=${2-""/dev/sde}

sudo dd if="$image" of="$disk" bs=4M conv=fsync status=progress
