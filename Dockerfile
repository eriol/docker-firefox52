FROM fedora:23
LABEL maintainer "Nate Revo <nrevo@revoweb.com>"

ENV LAST_UPDATE 2019-06-11
ENV LANG=en_US.UTF-8
ENV GDM_LANG="en_US.UTF-8"

RUN dnf update -y && \ 
    dnf -y install firefox \
        xorg-x11-twm \
        xterm xulrunner \
        dejavu-sans-fonts  \
        dejavu-serif-fonts \
        xdotool \
        PackageKit-gtk3-module \
        adwaita-icon-theme \
        findutils \
         && \
    dnf clean all && \
    mkdir /app

COPY jre-6u45-linux-x64-rpm.bin /app

RUN chmod +x /app/jre-6u45-linux-x64-rpm.bin && \
    /app/jre-6u45-linux-x64-rpm.bin || true 
RUN alternatives --install /usr/lib64/mozilla/plugins/libjavaplugin.so libjavaplugin.so.x86_64 /usr/java/jre1.6.0_45/lib/amd64/libnpjp2.so 20000 && \
    alternatives --install /usr/bin/java java /usr/java/jre1.6.0_45/bin/java 20000 && \
    alternatives --install /usr/bin/javaws javaws /usr/java/jre1.6.0_45/bin/javaws 20000 && \
    alternatives --set java /usr/java/jre1.6.0_45/bin/java && \
    echo done

ENTRYPOINT ["/usr/bin/firefox"]
#ENTRYPOINT ["/bin/bash"]
