FROM ubuntu:22.04

# Install XFCE + XRDP + tools
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xfce4 xfce4-goodies xrdp dbus-x11 curl && \
    apt-get clean

# Create user with hardcoded password
RUN useradd -m -s /bin/bash ashu && echo "ashu:12345" | chpasswd

# Download Pinggy
RUN curl -s -L https://get.pinggy.io | bash

# Expose RDP port
EXPOSE 3389

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
