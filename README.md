Efrei Arena Docker image
========================

This image is based on Debian image.

How to build
------------

```bash
$ git clone https://github.com/Strift/docker-efrei-arena.git
$ cd docker-efrei-arena
$ git clone https://github.com/Chtwin/Link-Rupees-Rush.git # The arena repo
$ docker build -t username/image-name \
               --build-arg REPO_PATH=./Link-Rupees-Rush \ # In this case, the arena repository is in the same directory
               --build-arg FILE_PATH=./path/to/file.c \ # The path to the student code to be evaluated
               . # The Dockerfile location; the current directory in this case
```

How to run
----------

```bash
$ xhost local:docker # to allow X11 forwarding and display for the docker user, assuming you don't need to 'sudo' for docker
$ xhost local:root # I guess you should run this one instead if you need to 'sudo' for docker
$ docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device /dev/snd strift/efrei-arena
```
