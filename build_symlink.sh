#!/bin/sh

rm -rf build install log
colcon build --symlink-install --event-handlers console_direct+ --cmake-args -DCMAKE_BUILD_TYPE=Release
. install/setup.sh
