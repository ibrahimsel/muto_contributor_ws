#!/bin/sh

rm -rf build install log
colcon build --symlink-install
source install/setup.sh