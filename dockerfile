FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xrdp \
    dbus-x11 \
    xfce4 \
    xfce4-terminal \
    sudo \
    curl \
    openssh-client \
    python3 \
    && rm -rf /var/lib/apt/lists/*

RUN echo "xfce4-session" > /etc/skel/.xsession

COPY start.sh /start.sh
COPY .xsession /root/.xsession
RUN chmod +x /start.sh

EXPOSE 3389

# Run startup script
CMD ["/start.sh"]
