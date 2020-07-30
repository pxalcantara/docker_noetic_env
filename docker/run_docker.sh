#!/bin/bash

#creat image from Dockerfile
# noetic_env is the image name
docker build . -t "noetic_env"

# enable access from root container to X11 of the host
xhost +local:root

#creat the container from the image created before
#noetic_env is the container name
docker run -it \
    --name="noetic_env" \
    -e DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -e DISPLAY=${DISPLAY} \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v ~/docker_noetic_env/docker/home-host:/root/home \
    noetic_env
    /bin/bash
