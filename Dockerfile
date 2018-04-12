# Run the Zelda Arena in a container
# docker run -it \
#	     -v /tmp/.X11-unix:/tmp/.X11-unix \ # mount the X11 socket
#            -e DISPLAY=unix$DISPLAY \
#            --device /dev/snd \ # so we have sound

# Press Escape when the container will run to exit the game

FROM debian:sid
LABEL maintainer "Strift <lau.cazanove@gmail.com>"

MAINTAINER Strift

RUN apt-get update
RUN apt-get install -y g++
RUN apt-get install -y libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev

COPY ./Link-Rupees-Rush/arène_code /usr/src/app
WORKDIR /usr/src/app

RUN g++ $(sdl-config --cflags) -o app main.cpp $(sdl-config --libs) -lSDL_image -lSDL_mixer -lSDL_ttf

CMD ["./app"]
