#!/usr/bin/env python3
import rospy
import numpy as np
import datetime
from gazebo_msgs.msg import ModelStates
from geometry_msgs.msg import Quaternion, Point, Vector3
from rosgraph_msgs.msg import Clock
from ackermann_msgs.msg import AckermannDriveStamped

dataim = str(datetime.datetime.now())
sec = 0.0
prev = -1.0
command = AckermannDriveStamped()
command.drive.speed = 0.0
command.drive.steering_angle = 0.0

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

def ackCallBack(data):
    global command
    command.drive.speed = data.drive.speed
    command.drive.steering_angle = data.drive.steering_angle
    

def callback(data):
    global dataim
    global sec
    global prev
    tempsec = int(sec * 100)
    tempprev = int(prev * 100)
    if (tempsec != tempprev):
        f = open("/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/logs/"+dataim+".txt", "a")
        psidot = psidot_func(data.pose[0].orientation.w, data.pose[1].orientation.x, data.pose[1].orientation.y, data.pose[1].orientation.z)
        f.write(str(round(sec,2)) + ", "+ str(data.pose[1].position.x)+", "+str(data.pose[1].position.y)+", "+str(psidot[0])+", "+str(psidot[1])+", "+str(psidot[2])+", "+str(data.twist[1].linear.x)+", "+str(data.twist[1].linear.y)+", "+str(data.twist[1].angular.z)+", "+str(command.drive.speed)+", "+str(command.drive.steering_angle)+"\n")
        f.close()
        prev = sec

def logger():
    rospy.init_node('logger')
    rospy.Subscriber('clock', Clock, clockCallBack)
    rospy.Subscriber('/vesc/low_level/ackermann_cmd_mux/output', AckermannDriveStamped, ackCallBack)
    rospy.Subscriber("gazebo/model_states", ModelStates, callback)
    rospy.spin()

if __name__ == '__main__':
    f = open("/home/inspacehj/dr_logger/simulation_ws/src/deepracer_simulation/logs/"+dataim+".txt", "w+")
    f.write("in order time, x, y, psix, psiy, psiz, xdot, ydot, psidot\n")
    f.close()
    logger()
