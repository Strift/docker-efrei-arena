# Run the Zelda Arena in a container
# docker run -it \
#	     -v /tmp/.X11-unix:/tmp/.X11-unix \ # mount the X11 socket
#            -e DISPLAY=unix$DISPLAY \
#            --device /dev/snd \ # so we have sound

FROM debian:sid
LABEL maintainer "Strift <lau.cazanove@gmail.com>"

# Build dependencies
RUN apt-get update
RUN apt-get install -y g++
RUN apt-get install -y libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev

# Copying the arena code
ARG REPO_PATH
COPY $REPO_PATH/arène_code /usr/src/app
COPY $REPO_PATH/Images /usr/src/app

# Copying the student code to be evaluated
ARG FILE_PATH
COPY $FILE_PATH /usr/src/app

# Building the app
WORKDIR /usr/src/app
RUN g++ $(sdl-config --cflags) -o app main.cpp $(sdl-config --libs) -lSDL_image -lSDL_mixer -lSDL_ttf

# Running
CMD ["./app"]
