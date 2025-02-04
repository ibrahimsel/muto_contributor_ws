#!/usr/bin/sh
set -e
. /opt/ros/humble/local_setup.sh
/bin/sh -c "/muto_ws/bootstrap.sh"
. /muto_ws/install/local_setup.sh

echo "source /opt/ros/$ROS_DISTRO/setup.sh" >> ~/.bashrc
echo "source /muto_ws/install/setup.sh" >> ~/.bashrc
/bin/sh /muto_ws/start_debug.sh
exec "$@"
