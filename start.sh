#!/bin/bash
meshlabserver -i cat.ply -o cat.ply -m sa
xhost +local:root
docker rm -f pvnet
 docker  run  --rm -it -d --name pvnet --privileged  --volume=/dev:/dev --gpus all --net=host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 tjdalsckd/pvnet:latest bash 
 docker cp cat.ply pvnet:/root/workspace/pvnet-rendering-smc
docker exec -it pvnet bash

