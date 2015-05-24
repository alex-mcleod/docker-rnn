FROM ubuntu:14.04
MAINTAINER Tom <tmbdev@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:.

RUN apt-get -qq update
RUN apt-get -qqy install apt-utils
RUN apt-get -qqy install git
RUN apt-get -qqy install curl
RUN apt-get -qqy install wget
RUN apt-get -qqy install unzip
RUN apt-get -qqy install git-core
RUN apt-get -qqy install build-essential
RUN apt-get -qqy install gcc
RUN apt-get -qqy install g++ 
RUN apt-get -qqy install cmake
RUN apt-get -qqy install gfortran
RUN apt-get -qqy install gdb
RUN apt-get -qqy install libreadline-dev
RUN apt-get -qqy install libjpeg-dev
RUN apt-get -qqy install libpng-dev
RUN apt-get -qqy install ncurses-dev
RUN apt-get -qqy install imagemagick
RUN apt-get -qqy install libzmq3-dev
RUN apt-get -qqy install libopenblas-dev
RUN apt-get -qqy install libhdf5-dev h5utils
RUN apt-get -qqy install openssh-server pwgen
RUN mkdir -p /var/run/sshd
RUN apt-get -qqy install tmux
RUN apt-get install -qqy libssl-dev
RUN apt-get install -qqy python-pip
RUN apt-get install -qqy python-dev
RUN pip install ipython[notebook]
RUN apt-get -qq install vim

# Install Torch 
RUN curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash 
RUN git clone https://github.com/torch/distro.git /opt/torch –-recursive 
RUN cd /opt/torch ; /opt/torch/install.sh -b

# Install CUDA 
# Adapted from https://registry.hub.docker.com/u/tleyden5iwx/ubuntu-cuda/dockerfile/

ENV CUDA_RUN http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_6.5.14_linux_64.run

RUN apt-get update && apt-get install -q -y module-init-tools

RUN cd /opt && \
  wget $CUDA_RUN && \
  chmod +x *.run && \
  mkdir nvidia_installers && \
  ./cuda_6.5.14_linux_64.run -extract=`pwd`/nvidia_installers && \
  cd nvidia_installers && \
  ./NVIDIA-Linux-x86_64-340.29.run -s -N --no-kernel-module

RUN cd /opt/nvidia_installers && \
  ./cuda-linux64-rel-6.5.14-18749181.run -noprompt \
  ./cuda-samples-linux-6.5.14-18745345.run -noprompt -cudaprefix=/usr/local/cuda-6.5/

# Set CUDA env variables
ENV LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-6.5/lib64
ENV PATH=$PATH:/usr/local/cuda-6.5/bin

# Install Lua packages
RUN luarocks install nngraph 
RUN luarocks install optim
RUN luarocks install cutorch
RUN luarocks install cunn
RUN luarocks install cunnx
RUN luarocks install ccn2
RUN luarocks install inn

# Add paths to Lua packages
ENV LD_LIBRARY_PATH=/usr/local/lib/lua/5.1:$LD_LIBRARY_PATH
ENV DYLD_LIBRARY_PATH=/usr/local/lib/lua/5.1:$DYLD_LIBRARY_PATH

RUN apt-get clean && /var/lib/apt/lists/* /var/tmp/*

EXPOSE 8888
