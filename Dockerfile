FROM ros:humble

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-colcon-common-extensions \
    python3-vcstool \
    ros-humble-ackermann-msgs \
    ros-humble-demo-nodes-cpp \
    ros-humble-demo-nodes-py \
    ros-humble-*composition* \
    git \
 && rm -rf /var/lib/apt/lists/*

#COPY . /muto_ws

#RUN chmod +x /muto_ws/*.sh
#RUN /bin/sh /muto_ws/bootstrap.sh

#ENTRYPOINT ["/muto_ws/docker-entrypoint.sh"]