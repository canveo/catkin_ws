#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
import math
import time
from rospy.core import loginfo
from std_srvs.srv import Empty

def move(speed, distance, is_forward):
    # declara Mensage Twist para envio de velocidad
    velocity_message = Twist()

    if (speed > 0.4):
        print("la distacia debe ser menor de 0.4")
        return
    
    if (is_forward):
        velocity_message.linear.x = abs(speed)
    else:
        velocity_message.linear.x = -abs(speed)

    distance_move = 0
    loop_rate = rospy.Rate(10)
    cmd_vel_topic = '/turtle1/cmd_vel'   #'/cmd_vel_mux/input/teleop'
    velocity_publisher = rospy.Publisher(cmd_vel_topic, Twist, queue_size=10)

    t0 = rospy.Time.now().to_sec()  #tiempo inicial

    while True:
        rospy.loginfo("Turtlesim moves forward")
        velocity_publisher.publish(velocity_message)

        loop_rate.sleep()
        t1 =rospy.Time.now().to_sec()

        distance_move = (t1-t0) * speed
        
        if not (distance_move < distance):
            rospy.loginfo("reached")
            break

    velocity_message.linear.x = 0
    velocity_publisher.publish(velocity_message)

def rotation(angular_speed_degree, relative_angel_degree, clockwise):

    velocity_message = Twist
    velocity_message.linear.x = 0
    velocity_message.linear.y = 0
    velocity_message.linear.z = 0
    velocity_message.angular.x = 0
    velocity_message.angular.y = 0
    velocity_message.angular.z = 0

    angular_speed = math.radians(abs(angular_speed_degree))

    if (clockwise):
        velocity_message.angular.z = -abs(angular_speed)
    else:
        velocity_message.angular.z = abs(angular_speed)

    angle_move = 0.0
    loop_rate = rospy.Rate(10)
    cmd_vel_topic = '/turtle1/cmd_vel'   #'/cmd_vel_mux/input/teleop'
    velocity_publisher = rospy.Publisher(cmd_vel_topic, Twist, queue_size=10)

    t0 = rospy.Time.now().to_sec()  #tiempo inicial

    while True:
        rospy.loginfo("Turtlesim rotates")
        velocity_publisher.publish(velocity_message)

        loop_rate.sleep()
        t1 =rospy.Time.now().to_sec()

        current_angle_degree = (t1-t0) * angular_speed_degree
        
        if not (current_angle_degree < relative_angel_degree):
            rospy.loginfo("reached")
            break

    velocity_message.linear.z = 0
    velocity_publisher.publish(velocity_message)

def got_to_goal(x_goal, y_goal):
    global x, y, z, yaw

    velocity_message = Twist()
    cmd_vel_topic = '/turtle1/cmd_vel'
    velocity_publisher = rospy.Publisher(cmd_vel_topic, Twist, queue_size=10)

    while True:
        K_linear = 0.5
        distance = abs(math.sqrt(((x_goal-x) ** 2) + ((y_goal-y) ** 2)))
        linear_speed = distance * K_linear

        K_angular = 0.4
        desired_angle_goal = math.atan2(y_goal, x_goal)
        angular_speed = (desired_angle_goal - yaw) * K_angular

        velocity_message.lineaer.x = linear_speed
        velocity_message.angular.z = angular_speed

        velocity_publisher.publish(velocity_message)

        if (distance < 0.1):
            break


if __name__ == "__main__":
    try:
        rospy.init_node('turtlesim_motion_pose', anonymous=True)
        move(0.3, 8, False)


    except rospy.ROSInterruptException:
        rospy.loginfo("node terminade")