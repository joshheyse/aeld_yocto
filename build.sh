#! /usr/bin/env bash
# Script to build image bbb image
# Author: Siddhant Jajoo.
# Modified: Josh Heyse

git submodule init
git submodule sync
git submodule update

source poky/oe-init-build-env

bitbake core-image-bbc
