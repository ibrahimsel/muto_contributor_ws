#!/bin/sh

. /opt/ros/humble/setup.sh
. /muto_ws/install/setup.sh

python3 -m debugpy --listen localhost:5678 --wait-for-client /muto_ws/launch/muto.launch.py