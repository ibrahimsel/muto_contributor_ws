#!/bin/sh

rosdep update
rosdep install -r -y --from-paths src --ignore-src

