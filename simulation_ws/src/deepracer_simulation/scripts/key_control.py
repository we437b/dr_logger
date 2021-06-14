#!/usr/bin/env python3

# 20210421
# Hancom inspace 
# Hee Jun Jang
# I wrote this code to check message communication between ros and deepracer using ackermann msg
# and I try to check python3 code using in ros melodic


# node name : key_control
# message name : /racecar/ackermann_cmd_mux/output

import rospy
import sys
import select
import termios
import tty
import numpy as np
from rosgraph_msgs.msg import Clock
from ackermann_msgs.msg import AckermannDriveStamped
from gazebo_msgs.msg import ModelStates
import threading
from std_msgs.msg import Float64 
from deepracer_msgs.msg import Control_input


# hj : AckermannDriveStamped is parent message of AckermanDrive 



T = 0.0
delta = 0.0
d_T = 0.01
d_delta = np.deg2rad(2)
em_stop = 0

keyBindings = {'w':(1.0,  0.0),  # move forward
               'd':(0.0, -1.0), # move foward and right
               'a':(0.0 , 1.0),  # move forward and left
               's':(-1.0, 0.0),
               'e':(0.0,  0.0),
               'q':(0.0,  0.0)} # all stop

delta_upper = np.deg2rad(30)
delta_lowwer = -np.deg2rad(30)
T_upper = 1.0
T_lowwer = -1.0
# hj : i searched other explanation of this getkey but they said just type...
# the answer what i saw was.. for unix system we should write these types
def getKey():
   tty.setraw(sys.stdin.fileno())
   select.select([sys.stdin], [], [], 0)
   key = sys.stdin.read(1)
   termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
   return key

def vels(speed, turn):
  return 'currently:\tspeed {}\tturn {}'.format(speed, turn)

def set_upp_low(delta, T):
    global delta_upper, delta_lower, T_upper, T_lowwer
    
    if (T > T_upper):
      T = T_upper

    if (T < T_lowwer):
      T  =T_lowwer
    
    if (delta > delta_upper):
      delta = delta_upper
    
    if (delta < delta_lowwer):
      delta = delta_lowwer

    return  delta, T
  
def down_alarm():
    print("shutdown now!")

if __name__== '__main__':
  rospy.loginfo('Control_topic is on ROS')
  settings    = termios.tcgetattr(sys.stdin)
  control_pub = rospy.Publisher('/Control_inputs',Control_input, queue_size = 1)


  rospy.init_node('key_control', anonymous = True)
  # rate = rospy.Rate(1000) # 10Hz

  try:
    while True:
        key = getKey()
        if key in keyBindings.keys():
              T += d_T * keyBindings[key][0]
              delta += d_delta * keyBindings[key][1]   
              if key =='e':
                #  speed = 0.0
                  em_stop = 1
                  T = 0.0
                  delta = 0.0
              if key =='q':
                  rospy.signal_shutdown("quit this node now plz!")
                  rospy.on_shutdown(down_alarm)
                  break

        rospy.loginfo("throttle : %s", T )
        rospy.loginfo("delta : %s", np.rad2deg(delta))
        rospy.loginfo("emergency stop : %s", em_stop)
        
        
        delta, T = set_upp_low(delta, T)   

        
        command = Control_input()

        command.Throttle = T
        command.angle = delta
        command.Emergency_stops = em_stop
        control_pub.publish(command)
        
        
        # T_pub.publish(T)
        em_stop = 0
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)


  except:
    print('raise exception: key binding error')

  finally:
  
    command = Control_input()
    command.Throttle = T
    command.angle = delta
    command.Emergency_stops = em_stop
    control_pub.publish(command)
          
    rospy.spin()

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)

        
        