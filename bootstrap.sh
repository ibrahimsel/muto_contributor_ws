#!/bin/sh
set -e
. /opt/ros/humble/local_setup.sh

# Clone workspace
mkdir -p /muto_ws/src
vcs import /muto_ws/src < /muto_ws/muto.repos

# Install dependencies
apt-get update
rosdep update
rosdep install -r -y --from-paths /muto_ws/src --ignore-src

# Build workspace
cd /muto_ws
colcon build --symlink-install --event-handlers console_direct+ --cmake-args -DCMAKE_BUILD_TYPE=Release
