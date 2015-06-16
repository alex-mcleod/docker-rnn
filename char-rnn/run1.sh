 docker run -i -t \
 --rm \
 --device /dev/nvidia0:/dev/nvidia0 --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm \
 --dns 8.8.8.8 \
 -v `pwd`:/work \
 -u $(id -u) \
 -w /work \
 -e USER=$(whoami) \
 -e HOME=/work \
 -e PS1='docker-torch$ ' \
 tmbdev/torch-local \
/opt/torch/install/bin/th train.lua -data_dir data/tinyshakespeare/ -rnn_size 512 -num_layers 2 -gpuid 0 > log/train.log