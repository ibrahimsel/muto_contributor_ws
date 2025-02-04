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

COPY . /muto_ws

RUN chmod +x /muto_ws/*.sh
RUN pip install debugpy


ENTRYPOINT ["/muto_ws/docker-entrypoint.sh"]