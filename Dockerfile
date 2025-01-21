FROM ros:humble

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-colcon-common-extensions \
    python3-vcstool \
    ros-humble-ackermann-msgs \
    ros-humble-demo-nodes-cpp \
    ros-humble-demo-nodes-py \
    git \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /muto_ws

COPY muto.repos .
RUN mkdir -p src && vcs import src < muto.repos

RUN apt-get update && rosdep update && \
    rosdep install --from-paths src --ignore-src -r -y && \
    rm -rf /var/lib/apt/lists/*

RUN . /opt/ros/humble/setup.sh && colcon build --symlink-install --event-handlers console_direct+

COPY launch/ launch/
COPY config/ config/

CMD ["/bin/bash", "-c", "source /muto_ws/install/setup.sh && ros2 launch /muto_ws/launch/muto.launch.py vehicle_id:=contributor-01"]
