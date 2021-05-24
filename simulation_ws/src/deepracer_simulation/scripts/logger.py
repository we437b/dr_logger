#!/usr/bin/env python3
import rospy
import numpy as np
from gazebo_msgs.msg import ModelStates
from geometry_msgs.msg import Quaternion, Point, Vector3

counter = 0

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

def callback(data):
    f = open("/home/inspace/Documents/log.txt", "a")
    psidot = psidot_func(data.pose[0].orientation.w, data.pose[1].orientation.x, data.pose[1].orientation.y, data.pose[1].orientation.z)
    f.write(str(counter) + ", " + str(data.pose[1].position.x)+", "+str(data.pose[1].position.y)+", "+str(data.pose[1].position.z)+", "+str(psidot[0])+", "+str(psidot[1])+", "+str(psidot[2])+", "+str(data.twist[1].linear.x)+", "+str(data.twist[1].linear.y)+", "+str(data.twist[1].angular.z)+"\n")
    f.close()

def logger():
    rospy.init_node('logger')
    rospy.Subscriber("gazebo/model_states", ModelStates, callback)
    rospy.spin()

if __name__ == '__main__':
    f = open("/home/inspace/Documents/log.txt", "w+")
    f.write("in order index, x, y, psix, psiy, psiz, xdot, ydot, psidot\n")
    f.close()
    logger()
