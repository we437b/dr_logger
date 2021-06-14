#!/usr/bin/env python3

# 20210421
# Hancom inspace 
# Hee Jun Jang
# I wrote this code to check message communication between ros and deepracer using ackermann msg
# and I try to check python3 code use in ros melodic


# node name : key_control
# message name : /racecar/ackermann_cmd_mux/output

import rospy
import numpy as np
from rosgraph_msgs.msg import Clock
from ackermann_msgs.msg import AckermannDriveStamped
from gazebo_msgs.msg import ModelStates
from deepracer_msgs.msg import Control_input


# value from deepracer_msgs.msg
T = 0.0
delta = 0.0
em_stop = 0

speed = 0.0

dt = 0.1
V_vx = 0
sec = 0.0
prev = - dt

maxbrakeWForce = 98.1
maxmotorWForce = 49.05
speed_lower = -1.0
speed_upper = 15.0


# hj : i searched other explanation of this getkey but they said just type...
# the answer what i saw was.. for unix system we should write these types

def accel(T,dt):
    T = np.float(T)
    maxbrakeWForce = 98.1
    maxmotorWForce = 49.05
    mass = 5
    totalWForce = T * (gez(T) * maxmotorWForce + lez(T) * maxbrakeWForce )
    return totalWForce/ mass * dt

def clockCallBack(data):
    second = data.clock.to_sec()
    global sec
    sec = second   
  
def set_speed_limits(speed):
    global speed_upper, speed_lower
    if (speed > speed_upper):
      speed = speed_upper
    if (speed < speed_lower):
      speed = speed_lower
    return speed

def state_callback(data):
    global V_vx
    # V_vx = data.twist[1].linear.x
    V_x = data.twist[1].linear.x
    V_y = data.twist[1].linear.y
    w = data.pose[1].orientation.w
    x = data.pose[1].orientation.x
    y = data.pose[1].orientation.y
    z = data.pose[1].orientation.z
    psi = psi_func(w,x,y,z)
    V_vx = V_x*np.cos(psi) + V_y*np.sin(psi)
    

def psi_func(w, x, y, z):
    ysqr = y * y

    t3 = +2.0 * (w * z + x * y)
    t4 = +1.0 - 2.0 * (ysqr + z * z)
    Z = np.degrees(np.arctan2(t3, t4))

    return Z

def gez(x_in):
    alpha = 50
    x_out = 1 / (1 + np.exp(-alpha * x_in))
    return x_out

def lez(x_in):
    alpha = 50
    x_out = 1 - 1 / (1 + np.exp(-alpha * x_in))
    return x_out

def ssign(x_in):
    alpha = 100
    x_out = np.tanh(alpha * x_in)
    return x_out

def control_callback(data):
    global T, delta, em_stop
    T = data.Throttle
    delta = data.angle
    em_stop = data.Emergency_stops


if __name__== '__main__':
  command_pub = rospy.Publisher('/vesc/low_level/ackermann_cmd_mux/output', AckermannDriveStamped, queue_size = 1)
  rospy.init_node('ackermann_control', anonymous = True)
    # node name :key_control

  
  Rate = rospy.Rate(10) # sampling 10 Hz
  

  while not rospy.is_shutdown():
      time = sec
      command                = AckermannDriveStamped()
      # rospy.loginfo("angle : %s", np.rad2deg(delta))
      rospy.loginfo("dt : %s", dt )
      # rospy.loginfo("V_vx : %s", V_vx)

      speed = speed + accel(T,dt)
      speed = set_speed_limits(speed)

      if (em_stop==1):
        speed = 0
        delta = 0

      command.drive.steering_angle = delta
      command.drive.speed           = speed
      command_pub.publish(command)

      rospy.Subscriber('clock', Clock, clockCallBack)
      rospy.Subscriber("gazebo/model_states", ModelStates, state_callback)
      rospy.Subscriber("/Control_inputs", Control_input, control_callback)
      Rate.sleep()
      dt = sec - time
      
