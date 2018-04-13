C (GCC) Docker image
====================

This image is based on Debian image.

How to run
----------

```bash
$ docker pull strift/zelda-arena
$ xhost local:docker # to allow X11 forwarding and display for the docker user, assuming you don't need to 'sudo' for docker
$ xhost local:root # I guess you should run this one instead if you need to 'sudo' for docker
$ docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device /dev/snd strift/zelda-arena
```

How to build
------------

In case you want to build the image on your own machine.

```bash
$ docker build -t strift/zelda-arena --build-arg REPO_PATH=./Link-Rupees-Rush . # Change the REPO_PATH arg accordingly
```
