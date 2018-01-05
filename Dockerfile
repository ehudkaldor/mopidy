################################################
#
#
#
#
#
################################################

FROM        ehudkaldor/alpine-edge-s6-rpi:latest
MAINTAINER  Ehud Kaldor <ehud@UnfairFunction.org>

RUN         apk add --update \
            snapcast && \
            rm -rf /var/cache/apk/*

# Server socket.
EXPOSE      6680

# Add the configuration file.
ADD         rootfs /
