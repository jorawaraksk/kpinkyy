#!/bin/bash
# Start essential services
service dbus start
service xrdp start

# Dummy HTTP server for Render (keeps service alive)
# Serves "OK" on $PORT (default 10000)
python3 -m http.server ${PORT:-10000} &

echo "======================================"
echo "XRDP is running on localhost:3389"
echo "Establishing Pinggy tunnel..."
echo "======================================"

# Start Pinggy tunnel (free plan, 60 mins)
ssh -p 443 -o StrictHostKeyChecking=no -o ServerAliveInterval=30 \
    -R0:localhost:3389 tcp@a.pinggy.io | grep --line-buffered "tcp://"
