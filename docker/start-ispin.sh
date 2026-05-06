#!/usr/bin/env bash
set -e

export DISPLAY=:0

# Virtual display
Xvfb :0 -screen 0 1280x900x24 &

# Lightweight window manager
fluxbox &

# VNC server
x11vnc \
  -display :0 \
  -forever \
  -shared \
  -nopw \
  -listen 0.0.0.0 \
  -xkb &

# Browser-based VNC at http://localhost:6080
websockify \
  --web=/usr/share/novnc/ \
  6080 \
  localhost:5900 &

# Give X a moment to come up
sleep 2

# Start iSpin
exec wish /usr/local/bin/ispin.tcl