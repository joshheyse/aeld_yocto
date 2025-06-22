#! /usr/bin/env bash

image=${1-"core-image-minimal-beaglebone-yocto.rootfs.wic"}
disk=${2-""/dev/disk5}

scp "ubuntu-vm:/home/josh/code/poky/build/tmp/deploy/images/beaglebone-yocto/$image" "./$image"

diskutil unmountDisk "$disk"
dd if="./$image" of="$disk" bs=4M conv=fsync status=progress
