#!/usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
import math
import time
from simple_pid import PID


# sensor data
front = 0.5
left = 0.5
rigth = 0.5

# pid data
linear_pid = PID(0.5, 0, 0, output_limits=(-1.0, 1.0), auto_mode=True)
angular_pid = PID(0.5, 0, 0, output_limits=(-1.0, 1.0))

linear_pid.setpoint = 0.8
angular_pid.setpoint = 0

linear_pid.sample_time = 0.01
angular_pid.sample_time = 0.01


def scan_callback(scan_data):
    global front, left, rigth
    # min_distance = min(scan_data.ranges[358:360])
    front = scan_data.ranges[359]
    if front == math.inf:
        front = 2
    left = scan_data.ranges[90]
    if left == math.inf:
        left = 2.0
    rigth = scan_data.ranges[270]
    if rigth == math.inf:
        rigth = 2.0
    print("f:{}  l:{}  r:{}".format(front, left, rigth))

def move_and_rotate(avoid_obstacle):
    global front, left, rigth
    velocity_publisher = rospy.Publisher("/cmd_vel", Twist, queue_size=10)  # "/cmd_vel_mux/input/teleop"
    
    cmd_vel = Twist()   
    loop_rate =rospy.Rate(10)

    while not rospy.is_shutdown():
        cmd_vel.linear.x = -linear_pid(front)          # output linear
        cmd_vel.angular.z = angular_pid(left-rigth)   # output angular

        velocity_publisher.publish(cmd_vel)
        print("linear out= {}, angular out = {}".format(cmd_vel.linear.x, cmd_vel.angular.z))

    cmd_vel.linear.x = 0.0
    cmd_vel.angular.z = 0.0
    velocity_publisher(cmd_vel)

            
if __name__ == '__main__':
    
    avoid_obstacle = 0.6
    
    rospy.init_node("Scan_subs", anonymous=True)
    
    try:
        rospy.Subscriber("scan", LaserScan, scan_callback)
        move_and_rotate(avoid_obstacle)
        rospy.spin()
    except rospy.ROSInterruptException as e:
        print(e)
 