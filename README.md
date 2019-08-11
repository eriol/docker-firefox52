# docker-firefox52 #

Docker image with Firefox (maintained by the Fedora Project) and Java
plugin.

This image is base on `fedora:23`.

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
    therevoman/firefox52
```

otherwise remember to mount volumes for directories needed by Firefox.

HIDPI rendering does not work properly as the image is using java 1.6.  To get firefox to scale properly set values in GDK_SCALE (integer) or GDK_DPI_SCALE (float).


If you get an error like the following:

```
Gdk-ERROR **: The program 'firefox' received an X Window System error.
This probably reflects a bug in the program.
The error was 'BadValue (integer parameter out of range for operation)'.
  (Details: serial 335 error_code 2 request_code 130 (unknown) minor_code 3)
  (Note to programmers: normally, X errors are reported asynchronously;
   that is, you will receive the error a while after causing it.
   To debug your program, run it with the GDK_SYNCHRONIZE environment
   variable to change this behavior. You can then get a meaningful
   backtrace from your debugger if you break on the gdk_x_error() function.)
```

disable IPC namespacing (keep in mind that this degrades container isolation)
using `--ipc=host`:

```shell
docker run -d \
    --shm-size 2g \
    --net host \
    --ipc=host \
    --cpuset-cpus 0 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY}" \
    -e GDK_SCALE -e GDK_DPI_SCALE \
    --device /dev/dri \
    --name firefox52 \
    therevoman/firefox52
```

My execution settings:

```shell
docker run -i -t --rm \
    --shm-size 2g \
    --net host \
    --ipc=host \
    --cpuset-cpus 0 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY}" \
    -e GDK_SCALE=2 \
    -e GDK_DPI_SCALE \
    --device /dev/dri \
    --name firefox52 \
    therevoman/firefox52
```

