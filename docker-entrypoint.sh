#!/usr/bin/env bash
set -e
source /opt/ros/humble/setup.bash
cd /muto_ws
colcon build --symlink-install
exec "$@"
