#!/bin/bash
# Start system services
service dbus start
service xrdp start

# Launch Pinggy tunnel for RDP (3389)
./pinggy --tcp 3389
