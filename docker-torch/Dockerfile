FROM ubuntu:14.04
MAINTAINER Tom <tmbdev@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:.

RUN apt-get -qq update
RUN apt-get -y install \
  apt-utils \
  git \
  curl \
  wget \
  unzip \
  git-core \
  build-essential \
  gcc \
  g++ \
  cmake \
  gfortran \
  gdb \
  vim \
  python-pip \
  python-dev
RUN pip install ipython[notebook]

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

# Instal luarocks
WORKDIR /tmp
RUN rm -rf luajit-rocks && git clone https://github.com/torch/luajit-rocks.git
RUN cd luajit-rocks && mkdir build && cd build && cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local
RUN cd luajit-rocks/build && make install

# Install Torch 
RUN curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash 
RUN git clone https://github.com/torch/distro.git /opt/torch --recursive 
RUN cd /opt/torch ; /opt/torch/install.sh -b

# Install Lua packages
# RUN luarocks install nngraph 
# RUN luarocks install optim

# Add paths to Lua packages
ENV LD_LIBRARY_PATH=/usr/local/lib/lua/5.1:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=/usr/local/lib:/opt/OpenBLAS/lib:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=/opt/torch/install/lib/lua/5.1/:$LD_LIBRARY_PATH
ENV DYLD_LIBRARY_PATH=/usr/local/lib/lua/5.1:$DYLD_LIBRARY_PATH

RUN apt-get clean 

EXPOSE 8888
