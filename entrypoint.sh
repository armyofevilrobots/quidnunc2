#!/bin/bash
# Copyright 2021 ArmyOfEvilRobots. All rights reserved.

/usr/bin/motion -n -c /opt/motion_configs/motion.config \
  -l /var/log/motion/motion.log \
  -p /var/run/motion.pid

