# Mopidy
Mopidy is an extensible music server that plays music from local disk, Spotify, SoundCloud, Google Play Music, and more. You edit the playlist from any phone, tablet, or computer using a range of MPD and web clients.
https://www.mopidy.com

This is a Docker image running Mopidy. It is based on [Alpine Linux](https://alpinelinux.org/) 3.7 using the edge-testing repository, and using [s6 overlay for containers](https://github.com/just-containers/s6-overlay) (more details on S6 [here](http://skarnet.org/software/s6/overview.html)).

This container is meant to work with [Snapcast](https://github.com/badaix/snapcast), and specifically, with the Snapcast container I have [here](https://github.com/ehudkaldor/snapcast). There is an `audio` section in the config file (in rootfs/root/.config/mopidy/mopidy.conf), stating the output should go to /tmp/snapfifo. Simply disable it to route audio to local speakers.

you can pull it directly from docker hub:
`docker pull ehudkaldor/mopidy`

or build it yourself, by cloning this repo and running:
`docker build -t whatever .`

when running, you can provide a few volumes to be used for specific purposes:
```docker run
  -d
  --name mopidy
  -v <a dir for database>:/root/.local    # optional, might be useful if the container restarts  
  -v <a local music dir>:/opt/music       # optional, yes, but not providing it will leave you with no music
  -v <a dir for stream fifo files>:/tmp   # optional, to keep stream files outside the container, to be used by Snapcest
  -p 6680:6680
  ehudkaldor/mopidy:latest
  ```
