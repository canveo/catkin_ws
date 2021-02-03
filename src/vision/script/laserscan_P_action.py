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

linear_pid = PID(kp=0.5, ki=0, kd=0, output_limits=(-1, 1))
angular_pid = PID(kp=0.5, ki=0, kd=0, output_limits=(-1, 1))

linear_pid.setpoint = 0.6
angular_pid.setpoint = 0

linear_pid.sample_time = 0.01
angular_pid.sample_time = 0.01


def scan_callback(scan_data):
    global front, left, rigth
    # min_distance = min(scan_data.ranges[358:360])
    front = scan_data.ranges[360]
    left = scan_data.ranges[90]
    rigth = scan_data.ranges[270]
    print("f:{}  l:{}  r:{}".format(front, left, rigth))

def move_and_rotate(avoid_obstacle):
    global front, left, rigth
    velocity_publisher = rospy.Publisher("/cmd_vel", Twist, queue_size=10)  # "/cmd_vel_mux/input/teleop"
    
    cmd_vel = Twist()   
    loop_rate =rospy.Rate(10)

    while not rospy.is_shutdown():
        cmd_vel.linear.x = linear_pid(front)          # output linear
        cmd_vel.angular.z = angular_pid(left-rigth)   # output angular

        velocity_publisher.publish(cmd_vel)
        # print("cmd = {}, min dis = {}".format(cmd_vel.angular.z, min_distance))

    cmd_vel.linear.x = 0.0
    cmd_vel.angular.z = 0.0
    velocity_publisher(cmd_vel)

def calc_error():
    global front, left, rigth
    error_c = (left - rigth)

            
if __name__ == '__main__':
    
    avoid_obstacle = 0.6
    
    rospy.init_node("Scan_subs", anonymous=True)
    
    try:
        rospy.Subscriber("scan", LaserScan, scan_callback)
        move_and_rotate(avoid_obstacle)
        rospy.spin()
    except rospy.ROSInterruptException as e:
        print(e)
 