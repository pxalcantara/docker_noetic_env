#!/bin/bash

# enable access from root container to X11 of the host
xhost +local:root

XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

# creat the container from the image created before if it was not already created, otherwise, just
# start or execute the container
#noetic_env is the container name
if [ ! "$(docker ps -q -f name=noetic_env)" ]; then
    if [ ! "$(docker ps -aq -f status=exited -f name=noetic_env)" ]; then
        docker run -it \
                --name="noetic_env" \
                --env="DISPLAY=$DISPLAY" \
                --env="QT_X11_NO_MITSHM=1" \
                --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
                --env="XAUTHORITY=$XAUTH" \
                --volume="$XAUTH:$XAUTH" \
                --runtime=nvidia \
                -v ~/docker_noetic_env/docker/home-host:/root/home \
                noetic_env \
                bash
        echo "Container created"
    fi
    echo "Starting the container"
    docker start -ai noetic_env
else
    echo "Just executing the container already started"
    docker exec -ti noetic_env /bin/bash
fi