#! /usr/bin/env bash

podman build -t yocto .

podman run -it --rm \
  --security-opt label=disable \
  -v /work/build \
  -v .:/work yocto \
  /work/build.sh
