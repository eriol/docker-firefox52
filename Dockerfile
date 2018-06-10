FROM debian:stretch-slim
LABEL maintainer "Daniele Tricoli <eriol@mornie.org>"

ENV LAST_UPDATE 2018-06-11

# Directory creation is a workaround for Debian bug 863199.
# See https://bugs.debian.org/863199
RUN mkdir -p /usr/share/man/man1 \
    && apt update \
    && apt install -qqy \
        ca-certificates \
        firefox-esr \
        icedtea-plugin \
        --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt -qqy clean

ENV LANG en-US

ENTRYPOINT ["/usr/bin/firefox"]
