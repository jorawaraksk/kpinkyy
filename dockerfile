FROM ubuntu:22.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xfce4 xfce4-goodies xrdp dbus-x11 curl && \
    apt-get clean

RUN useradd -m -s /bin/bash ashu && echo "ashu:12345" | chpasswd

RUN curl -s -L https://get.pinggy.io | bash

EXPOSE 3389

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
