FROM ubuntu:15.04
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
RUN apt-get install swig3.0 || apt-get install swig2.0

WORKDIR /tmp
RUN rm -rf luajit-rocks && git clone https://github.com/torch/luajit-rocks.git
RUN cd luajit-rocks && mkdir build && cd build && cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local
RUN cd luajit-rocks/build && make install

RUN luarocks install paths
RUN luarocks install cwrap
RUN luarocks install torch

RUN luarocks install luafilesystem
RUN luarocks install penlight
RUN luarocks install sys
RUN luarocks install xlua
RUN luarocks install image
RUN luarocks install optim
RUN luarocks install json
RUN luarocks install lua-cjson
RUN luarocks install trepl
RUN luarocks install dok
RUN luarocks install lzmq
RUN luarocks install sundown
RUN luarocks install gnuplot
RUN luarocks install lbase64
RUN luarocks install env
RUN luarocks install luacrypto
RUN luarocks install uuid
RUN luarocks install iTorch

RUN luarocks install torchx
RUN luarocks install strict
RUN luarocks install graph
RUN luarocks install nn
RUN luarocks install nnx
RUN luarocks install nngraph
RUN luarocks install totem
RUN luarocks install rnn

RUN luarocks install gnuplot
RUN luarocks install async
RUN luarocks install inline-c
RUN luarocks install fn
RUN luarocks install fs
RUN luarocks install nngraph
RUN luarocks install xlua
RUN luarocks install randomkit
RUN luarocks install python
RUN luarocks install persist
RUN luarocks install pprint

RUN git clone https://github.com/deepmind/torch-hdf5.git
RUN cd torch-hdf5 && luarocks install *.rockspec

RUN apt-get -qq install vim
RUN echo deb http://us.archive.ubuntu.com/ubuntu/ vivid multiverse >> /etc/apt/sources.list
RUN apt-get -qq update

# Install CUDA 
# Adapted from https://registry.hub.docker.com/u/tleyden5iwx/ubuntu-cuda/dockerfile/

ENV CUDA_RUN http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_6.5.14_linux_64.run

RUN apt-get update && apt-get install -q -y \
  wget \
  build-essential \
  module-init-tools \
  gcc-4.7 \
  g++-4.7

RUN cd /opt && \
  wget $CUDA_RUN && \
  chmod +x *.run && \
  mkdir nvidia_installers && \
  ./cuda_6.5.14_linux_64.run -extract=`pwd`/nvidia_installers && \
  cd nvidia_installers && \
  ./NVIDIA-Linux-x86_64-340.29.run -s -N --no-kernel-module

RUN cd /opt/nvidia_installers && \
  ./cuda-linux64-rel-6.5.14-18749181.run -noprompt

# Ensure the CUDA libs and binaries are in the correct environment variables
ENV LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-6.5/lib64
ENV PATH=$PATH:/usr/local/cuda-6.5/bin

# Use correct compiler for CUDA
sudo ln -s /usr/bin/gcc-4.7 /usr/local/cuda-6.5/bin/gcc
sudo ln -s /usr/bin/g++-4.7 /usr/local/cuda-6.5/bin/g++

# RUN apt-get -qqy install nvidia-cuda-dev
# RUN apt-get -qqy install nvidia-cuda-toolkit

RUN luarocks install cutorch
RUN luarocks install cunn
RUN luarocks install cunnx
RUN luarocks install ccn2
RUN luarocks install inn
RUN apt-get -qqy install libprotobuf-dev
RUN apt-get -qqy install protobuf-compiler
RUN luarocks install loadcaffe

RUN apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
ADD start-itorch /root/start-itorch
ADD start-notebook /root/start-notebook
EXPOSE 8888
