# docker-firefox52 #

Docker image with Firefox 52 (maintained by the Debian Project) and Java
plugin.

This image is base on `debian:stretch-slim`.

## Build ##

```
    docker build -t 'yourusername/firefox52' .
```

## Run ##

If you don't want any persistency, and you want to use the automated build from
docker hub:

```shell
    docker run -d \
        --shm-size 2g \
        --net host \
        --cpuset-cpus 0 \
        -v /etc/localtime:/etc/localtime:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e "DISPLAY=${DISPLAY}" \
        -e GDK_SCALE -e GDK_DPI_SCALE \
        --device /dev/dri \
        --name firefox52 \
        eriol/firefox52
```

otherwise remember to mount volumes for directories needed by Firefox.
