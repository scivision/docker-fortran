# based on https://github.com/naftulikay/docker-bionic-vm/blob/master/Dockerfile

FROM ubuntu:18.04
ENV container=docker TERM=xterm LC_ALL=en_US LANGUAGE=en_US LANG=en_US.UTF-8

# packages
RUN apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq apt-utils locales language-pack-en dialog \
  && locale-gen $LANGUAGE $LANG \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq gfortran libcoarrays-dev libopenmpi-dev open-coarrays-bin libhdf5-dev \
  && apt-get clean -q

# other optional installs

# RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq octave
