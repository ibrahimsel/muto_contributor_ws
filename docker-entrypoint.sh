#!/usr/bin/sh
set -e
echo "source /opt/ros/humble/setup.sh" >> ~/.bashrc
echo "source /muto_ws/install/setup.sh" >> ~/.bashrc
exec "$@"
