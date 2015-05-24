# Getting AWS machine set up 

Adapted instructions from http://stackoverflow.com/questions/25185405/using-gpu-from-a-docker-container.

Use ami-c38babf3 on an US East AWS machine with GPUs, or follow instructions here http://tleyden.github.io/blog/2014/10/25/cuda-6-dot-5-on-aws-gpu-instance-running-ubuntu-14-dot-04/ to setup CUDA from scratch. 
 
Install docker using the install-docker.sh script. 

docker-torch/Dockerfile installs the CUDA drivers within the container. 
