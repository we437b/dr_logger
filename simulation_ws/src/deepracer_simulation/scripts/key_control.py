#!/usr/bin/env python3

# 20210421
# Hancom inspace 
# Hee Jun Jang
# I wrote this code to check message communication between ros and deepracer using ackermann msg
# and I try to check python3 code use in ros melodic


# node name : key_control
# message name : /racecar/ackermann_cmd_mux/output

import rospy
import sys
import select
import termios
import tty
import numpy as np

from ackermann_msgs.msg import AckermannDriveStamped
# hj : AckermannDriveStamped is parent message of AckermanDrive 


keyBindings = {'w':(1.0,  0.0),  # move forward
               'd':(0.0, -1.0), # move foward and right
               'a':(0.0 , 1.0),  # move forward and left
               's':(-1.5, 0.0), # move reverse
               'q':(0.0,  0.0),  # all stop
               'e':(0.0, 0.0)}

speed_limit = 1 # <- Change this value to control car's maximum speed
angle_limit = np.deg2rad(40)
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

def checkpy3():
       # to check python3 ----------------------------------------
    try:
      import PIL.Image
      rospy.loginfo("import pillow done!")
    except ImportError:
      rospy.loginfo("Missing library(PilkeyBindings ")
      rospy.loginfo("import numpy done!")
    except ImportError:
      rospy.loginfo("Missing library(numpy)! you can install it using pip3 install numpy")
    return 0
# ------------------------------------------------------

if __name__== '__main__':
  settings    = termios.tcgetattr(sys.stdin)
  command_pub = rospy.Publisher('/vesc/low_level/ackermann_cmd_mux/output', AckermannDriveStamped, queue_size = 1)
  # hj : in servo_commands.py, message name was /racecar/ackermann_cmd_mux/output but in launch file(racecar_control.launch) 
  # the message changed to line 34 value
  rospy.init_node('key_control', anonymous = True)
    # node name :key_control
  speed  = 0.0 # <- Change this value to control car speed
  angle  = 0.0
  status = 0.0
  d_speed = 0.05
  d_angle = np.deg2rad(5)
  
  try:
    while True:
       key = getKey()
       if key in keyBindings.keys():
          speed += d_speed * keyBindings[key][0]
          angle += d_angle * keyBindings[key][1]
          if key =='e':
            angle = 0.0
          if key =='q':
             speed = 0.0
             angle = 0.0
       else:
          speed = 0.0
          angle = 0.0
          if (key == '\x03'):
             break
       if (angle >= angle_limit):
        angle= angle_limit

       if (speed >= speed_limit):
        speed = speed_limit
          
       command                = AckermannDriveStamped()
       rospy.loginfo("speed : %s", speed )
       rospy.loginfo("angle : %s", np.rad2deg(angle))
       command.drive.speed          = speed * speed_limit
       command.drive.steering_angle = angle * angle_limit
       command_pub.publish(command)

  except:
    print('raise exception: key binding error')

  finally:
    command = AckermannDriveStamped()
    command.drive.speed = speed * speed_limit
    command.drive.steering_angle = angle * angle_limit
    command_pub.publish(command)
    # checkpy3()
    # hj : i added rospy.spin() to run repeatly this python file
    # rospy.spin() (in roswiki) : simply keeps python from exiting until this node is stopped
    rospy.spin() 
    # this is just typed value to use keyboard ..
    # when we make code for car LMPC this part is not regarded part (about keyboard)
    # if we want to change ackermann input, just change 
    # command.drive.speed = [speed what we want]
    # command.dirve.steering_angle = [angle what we want]
    
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)