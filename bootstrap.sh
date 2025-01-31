#!/bin/sh
set -e
source /opt/ros/humble/setup.bash

mkdir -p src
vcs import src < muto.repos
