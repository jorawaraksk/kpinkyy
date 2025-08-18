#!/bin/bash
# Start essential services
service dbus start
service xrdp start

echo "======================================"
echo "XRDP is running on localhost:3389"
echo "Establishing Pinggy tunnel..."
echo "======================================"

# Launch Pinggy tunnel via SSH
ssh -p 443 -o StrictHostKeyChecking=no -o ServerAliveInterval=30 \
    -R0:localhost:3389 tcp@a.pinggy.io
