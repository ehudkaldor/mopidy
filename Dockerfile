################################################
#
#
#
#
#
################################################

FROM		    ehudkaldor/alpine-s6:latest
MAINTAINER	Ehud Kaldor <ehud@UnfairFunction.org>

# Server socket.
EXPOSE 	  	6680

# Add the configuration file.
COPY 		    rootfs /

# RUN 		    echo "http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
RUN     apk update && \
        apk upgrade apk && \
        apk add \
            mopidy \
            gcc \
            g++ \
        	  gst-plugins-good \
            gst-plugins-bad \
            gst-plugins-ugly \
        	  alsa-utils \
            python \
            python3 \
            python-dev \
            py-cffi \
            py-six \
        	  py-pip \
            py-lxml && \
 		    pip install --upgrade pip && \
            pip install inotify-simple && \
            pip install Mopidy-MusicBox-Webclient && \
 		        pip install Mopidy-Mobile && \
            # pip install mopidy-beets && \
            pip install mopidy-moped && \
            pip install Mopidy-Local-SQLite && \
            # pip install mopidy-gmusic && \
            pip install Mopidy-Local-Images && \
            pip install Mopidy-Iris && \
            pip install -r /opt/fs-watcher/requirements.txt && \
        apk del \
            libffi-dev \
            openssl-dev \
            build-base \
            gcc \
            g++ \
            py-pip \
            python-dev && \
            rm -rf /var/cache/apk/* && \
        ln -s /usr/lib/libpython2.7.so.1.0 /usr/lib/libpython2.7.so && \
        ln -s /usr/lib/libpython3.6m.so.1.0 /usr/lib/libpython3.6m.so
