# based on https://github.com/naftulikay/docker-bionic-vm/blob/master/Dockerfile

FROM ubuntu:18.04
ENV container=docker TERM=xterm LC_ALL=en_US LANGUAGE=en_US LANG=en_US.UTF-8

# locale
RUN apt-get update -q > /dev/null \
  && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq apt-utils locales language-pack-en dialog > /dev/null \
  && locale-gen $LANGUAGE $LANG

# Git/Curl -- don't disable recommends here or you won't have Certification Authority certificates and will fail
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq git curl > /dev/null

# packages specific to your needs
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq make gfortran libcoarrays-dev libopenmpi-dev open-coarrays-bin > /dev/null \
  && apt-get clean -q

# latest cmake
RUN git clone --depth 1 https://github.com/scivision/cmake-utils \
  && mkdir $HOME/.local && cd cmake-utils && ./cmake_setup.sh \
  && mv $HOME/.local/cmake* $HOME/.local/cmake

ENV PATH=$PATH:/root/.local/cmake/bin

# other optional installs

# RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq octave
