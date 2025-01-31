#!/bin/sh

sudo rosdep init
rosdep update
rosdep install -r -y --from-paths src --ignore-src

