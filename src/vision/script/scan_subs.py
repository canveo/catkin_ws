#!/usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
import math
import time

min_distance = 0.6

def scan_callback(scan_data):
    global min_distance
    min_distance = min(scan_data.ranges[358:360])
    print(min_distance)

def move_and_rotate(avoid_obstacle):
    global min_distance
    velocity_publisher = rospy.Publisher("/cmd_vel", Twist, queue_size=10)  # "/cmd_vel_mux/input/teleop"
    
    cmd_vel = Twist()   
    loop_rate =rospy.Rate(10)

    while not rospy.is_shutdown():
        if min_distance > avoid_obstacle:
            cmd_vel.linear.x = 0.6
            cmd_vel.angular.z = 0.0
        else:
            cmd_vel.linear.x = 0.0
            cmd_vel.angular.z = 0.5

        velocity_publisher.publish(cmd_vel)
        print("cmd = {}, min dis = {}".format(cmd_vel.angular.z, min_distance))

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
 