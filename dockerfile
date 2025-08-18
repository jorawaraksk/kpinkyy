FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xrdp \
    dbus-x11 \
    xfce4 \
    xfce4-terminal \
    sudo \
    curl \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash ashu && echo "ashu:12345" | chpasswd && adduser ashu sudo

RUN echo "startxfce4" > /home/ashu/.xsession && \
    chown ashu:ashu /home/ashu/.xsession

RUN sed -i.bak '/^test -x \/etc\/X11\/Xsession/ s/^/#/' /etc/xrdp/startwm.sh && \
    echo "startxfce4" >> /etc/xrdp/startwm.sh

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
