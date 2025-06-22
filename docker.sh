#! /usr/bin/env bash
podman build -t yocto .
podman unshare chown 4201:4200 -R .
podman run -it -v "$(pwd):/work:z" yocto /bin/bash
