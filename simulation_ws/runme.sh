colcon build
# colcon bundle
source ~/dr_logger-robomaker-sample-application-deepracer/simulation_ws/install/setup.sh
roslaunch deepracer_simulation racetrack_with_racecar.launch world_name:=hard_track gui:=true


