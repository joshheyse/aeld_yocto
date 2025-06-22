FROM ubuntu:24.04

RUN groupadd -g 4200 poky \
  && useradd -u 4201 -g poky -r -s /bin/bash -m poky

# Install Yocto dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  chrpath \
  cpio \
  debianutils \
  diffstat \
  file \
  gawk \
  gcc \
  git \
  iputils-ping \
  libacl1 \
  liblz4-tool \
  locales \
  python3 \
  python3-git \
  python3-jinja2 \
  python3-pexpect \
  python3-pip \
  python3-subunit \
  socat \
  texinfo \
  unzip \
  wget \
  xz-utils \
  zstd

# Set up locale to avoid warnings
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

USER poky
WORKDIR /work
