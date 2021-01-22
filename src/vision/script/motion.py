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



if __name__ == "__main__":
    try:
        rospy.init_node('turtlesim_motion_pose', anonymous=True)
        move(0.3, 8, False)


    except rospy.ROSInterruptException:
        rospy.loginfo("node terminade")