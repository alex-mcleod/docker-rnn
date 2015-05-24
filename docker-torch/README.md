docker-torch
============

Torch in a Docker container

This is a basic build that contains the standard packages that are
installed by the scripts from torch.ch. The container is based on
Ubuntu 14.04

You can run Torch in the container with a command like this:

    docker run -i -t tmbdev/docker-torch /usr/local/bin/th "$@"

A more complete Torch command is given by the following command:

    docker run -i -t \
     --rm \
     --dns 8.8.8.8 \
     -v `pwd`:/work \
     -u $(id -u) \
     -w /work \
     -e USER=$(whoami) \
     -e HOME=/work \
     -e PS1='docker-torch$ ' \
     tmbdev/torch \
     /usr/local/bin/th "$@"

With If you put this into a file "./runth" and make it executable,
you can then execute Torch programs as you would as if you had
Torch installed locally:

    chmod 755 runth
    ./runth myfile.lua

The individual parts mean the following:

    docker run -i -t      # run interactively
    --rm                  # delete file system after command ends
    --dns 8.8.8.8         # set up DNS server (workaround for Ubuntu)
    -v `pwd`:/work        # map the current directory to /work
    -u $(id -u)           # run as the current UID inside the container
    -w /work              # change into /work
    -e USER=$(whoami)     # set environment variables
    -e HOME=/work
    -e PS1='docker-torch$ '
    tmbdev/torch          # run the "tmbdev/torch" container
    /usr/local/bin/th     # run /usr/local/bin/th inside the container
    "$@"                  # pass any arguments along
