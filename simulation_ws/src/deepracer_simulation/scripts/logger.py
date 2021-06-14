#!/usr/bin/env python3
import rospy
import numpy as np
import datetime
import math
from gazebo_msgs.msg import ModelStates
from geometry_msgs.msg import Quaternion, Point, Vector3
from rosgraph_msgs.msg import Clock
# from ackermann_msgs.msg import AckermannDriveStamped
from deepracer_msgs.msg import Control_input

dataim = str(datetime.datetime.now())
sec = 0.0
prev = -1.0
# command = AckermannDriveStamped()
# command.drive.speed = 0.0
# command.drive.steering_angle = 0.0
delta_speed = 0.0
delta_steering = 0.0

command = Control_input()
command.Throttle = 0.0
command.angle = 0.0

T = 0.0
delta = 0.0
d_T = 0.01
d_delta = np.rad2deg(1)
prev_delta = 0.0
prev_T = 0.0


def psidot_func(w, x, y, z):
    ysqr = y * y

    t0 = +2.0 * (w * x + y * z)
    t1 = +1.0 - 2.0 * (x * x + ysqr)
    X = np.degrees(np.arctan2(t0, t1))

    t2 = +2.0 * (w * y - z * x)
    t2 = np.where(t2>+1.0,+1.0,t2)

    t2 = np.where(t2<-1.0, -1.0, t2)
    Y = np.degrees(np.arcsin(t2))

    t3 = +2.0 * (w * z + x * y)
    t4 = +1.0 - 2.0 * (ysqr + z * z)
    Z = np.degrees(np.arctan2(t3, t4))

    return X, Y, Z 

def clockCallBack(data):
    second = data.clock.to_sec()
    global sec 
    sec = second

def Control_callback(data):
    global d_T, d_delta, command
    # T = data.Throttle
    # delta = data.angle
    d_T += data.Throttle - command.Throttle
    d_delta += data.angle - command.angle
    command.Throttle = data.Throttle
    command.angle = data.angle


def callback(data):
    global dataim
    global sec
    global prev
    global prev_delta, prev_T
    global delta, T, d_delta, d_T
    interval = 0.01
    timeval = 1/interval
    tempsec = int(sec * timeval)
    tempprev = int(prev * timeval)
    if (tempsec != tempprev):
        f = open("/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/logs/"+dataim+".txt", "a")
        psidot = psidot_func(data.pose[1].orientation.w, data.pose[1].orientation.x, data.pose[1].orientation.y, data.pose[1].orientation.z)
        f.write(str(round(sec,int(math.log10(timeval)))) + ", "+ str(data.pose[1].position.x)+", "+str(data.pose[1].position.y)+", "+str(psidot[2])+", "+str(data.twist[1].linear.x)+", "+str(data.twist[1].linear.y)+", "+str(data.twist[1].angular.z)+", "+str(command.angle)+", "+str(command.Throttle)+"\n")
        f.close()
        f = open("/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/logs/"+dataim+"_U.txt", "a")
        f.write(str(round(sec,int(math.log10(timeval)))) + ", " + str(d_delta)+", "+str(d_T)+"\n")
        f.close()
        rospy.loginfo("d_delta = %s", d_delta )
        rospy.loginfo("d_T = %s", d_T)
        d_T = 0.0
        d_delta = 0.0
        prev = sec

def logger():
    rospy.init_node('logger')
    rospy.Subscriber('clock', Clock, clockCallBack)
    rospy.Subscriber("/Control_inputs", Control_input, Control_callback)
    rospy.Subscriber("gazebo/model_states", ModelStates, callback)
    rospy.spin()

if __name__ == '__main__':
    f = open("/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/logs/"+dataim+".txt", "w")
    f.write("in order time, x, y, psiz, xdot, ydot, psidot, speed, steering \n")
    f.close()
    f = open("/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/logs/"+dataim+"_U.txt", "w")
    f.write("in order time, d_angle, d_steering \n")
    f.close()
    logger()