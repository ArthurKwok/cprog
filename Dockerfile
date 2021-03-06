FROM ubuntu:18.04

LABEL maintainer="Arthur Jinyue Guo <jg5505@nyu.edu>"

USER root

ENV DEBIAN_FRONTEND noninteractive
# ENV DISPLAY=0

## basic libs
RUN apt-get update && apt-get install -y wget \
                                         libasound-dev \
                                         libjack-dev \
                                         libncurses5-dev \
                                         libncursesw5-dev
## portaudio libs
RUN apt-get install -y libportaudio2 \
                       libportaudiocpp0 \
                       portaudio19-dev \
                       portaudio19-doc

## sndfile libs
RUN apt-get install -y libsndfile1 \
                       libsndfile1-dev

## ALSA libs for playback on computer
RUN apt-get install -y alsa-base \
                       alsa-utils \
                       pulseaudio \


## other useful libs
RUN apt-get install -y ffmpeg \
                       jackd2 \
                       dbus-x11 \
                       libjack-jackd2-dev

## Create and change to new user
RUN useradd --system \
            --create-home \
            --shell /bin/bash \
            --home-dir /home/cprog-user \
            --gid root \
            -G sudo \
            -u 1001 \
            cprog-user
USER cprog-user
WORKDIR /home/cprog-user

## Copy src files to user dir
COPY src/* /home/cprog-user/sources/

