FROM ubuntu:18.04

LABEL maintainer="Arthur Jinyue Guo <jg5505@nyu.edu>"

USER root

## basic libs
RUN apt-get update && apt-get install -y wget \
                                         libasound-dev \
                                         libjack-dev

## portaudio libs
RUN apt-get install -y libportaudio2 \
                       libportaudiocpp0 \
                       portaudio19-dev \
                       portaudio19-doc

## sndfile libs
RUN apt-get install -y libsndfile1 \
                       libsndfile1-dev

## other useful libs
RUN apt-get install -y ffmpeg \
                       libav-tools