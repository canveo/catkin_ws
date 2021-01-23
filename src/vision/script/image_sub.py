#!/usr/bin/env python

import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import  CvBridge, CvBridgeError
import sys

class image_subscriber:
    def __init__(self):
        self.image_sub = rospy.Subscriber("image_topic", Image, self.callback)
        self.bridge = CvBridge()

    def callback(self, data):
        try:
            # cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
            cv_image = self.bridge.imgmsg_to_cv2(data, "passthrough")
            # hsv = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV)
            
            print(cv_image)
        except CvBridgeError as e:
            print(e)
        cv2.imshow("Image window", cv_image)

def main(args):
    i_sub = image_subscriber()
    rospy.init_node("Image_publisher", anonymous=True)
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()


if __name__ == "__main__":
    try:
        # rospy.init_node("Image Publisher", anonymous=True)
        
        main(sys.argv)
        # i_sub.callback()
        # rospy.spin()

    except rospy.ROSInterruptException:
        rospy.loginfo("node subs terminated")
    