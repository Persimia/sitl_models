#!/bin/bash

xterm -e "GZ_SIM_RESOURCE_PATH=/home/skemp32/ros2_ws/src/sitl_models/models:\$GZ_SIM_RESOURCE_PATH; gz sim -v4 -r /home/skemp32/ros2_ws/src/sitl_models/worlds/js_turbine.sdf; exec bash" &
xterm -e "ros2 run ros_gz_bridge parameter_bridge --ros-args -p config_file:=/home/skemp32/ros2_ws/src/sitl_models/config/doe_lidar_bridge.yaml; exec bash" &
xterm -e "/home/skemp32/ros2_ws/install/micro_ros_agent/lib/micro_ros_agent/micro_ros_agent udp4 --middleware dds --verbose 4 --port 2019 --ros-args -r __node:=micro_ros_agent -r __ns:=/; exec bash" &
xterm -e "cd /home/skemp32/ros2_ws/src/sitl_models/doe-pd-data; sim_vehicle.py -v ArduCopter --model=json -G -D --add-param-file=/home/skemp32/ros2_ws/src/sitl_models/config/gazebo-doe.parm --speedup=1 --slave=0 --sim-address=127.0.0.1 --instance=0 --enable-dds --console -A --synthetic-clock -A --serial5=sim:sf45b; exec bash" &
