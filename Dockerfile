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
COPY build_symlink.sh .
COPY rosdep.sh .
COPY muto_bringup.sh .
RUN mkdir -p src && vcs import src < muto.repos

RUN apt-get update && rosdep update && \
    rosdep install --from-paths src --ignore-src -r -y && \
    rm -rf /var/lib/apt/lists/*

COPY launch/ launch/
COPY config/ config/

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
