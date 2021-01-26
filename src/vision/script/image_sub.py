#!/usr/bin/env python

import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import  CvBridge, CvBridgeError
import sys
import numpy as np

from vision.script.video_utils import ball_detected


class image_subscriber:
    def __init__(self):
        self.image_sub = rospy.Subscriber("image_topic", Image, self.callback)
        self.bridge = CvBridge()

    def color_filter(frame):
        hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
        # cv2.imshow("hsv image", hsv)

        #find the upper and lower bounds the yellow color
        yellowLower = (30, 150, 100)
        yellowUpper = (50, 255, 255)

        #define a mask using the lower andthe upper bounds of the yellow color
        mask = cv2.inRange(hsv, yellowLower, yellowUpper)

        cv2.imshow("mask image", mask)

        return mask

    def getContours(binary_image):      
        contours, hierarchy = cv2.findContours(binary_image, 
                                              cv2.RETR_TREE, 
                                               cv2.CHAIN_APPROX_SIMPLE)
        return contours


    def callback(self, data):
        # try:
        #     # cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        #     cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        #     # self.hsv = cv2.cvtColor(self.cv_image, cv2.COLOR_BGR2HSV)
        #     # cv2.imshow("Image window", hsv)
        #     # print(self.cv_image)
        #     # Convert the image to a Numpy array since most cv2 functions
        # # require Numpy arrays
        #     # cv_image = np.array(cv_image, dtype=np.uint8)
                        
        #     # cv2.imshow("Image window", cv_image)

        # except CvBridgeError as e:
        #     print(e)
        
        # # Convert the image to a Numpy array since most cv2 functions
        # # require Numpy arrays
        # cv_image = np.array(cv_image, dtype=np.uint8)
        # # mask = self.filter_color(self.cv_image)
        # print(cv_image)
        # cv2.imshow("Image window", cv_image)
        # while not rospy.is_shutdown():
        #     cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        #     cv2.imshow("Imagen subs", cv_image)
        #     print("hola")
        #     cv2.waitKey(0)

        #     if cv2.waitKey(25) & 0xFF == ord('q'):
        #         break
        try:
            i_sub = image_subscriber()
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
            # cv_image = np.array(cv_image, dtype=np.uint8)
            # mask = i_sub.color_filter(cv_image)
            # contours = i_sub.getContours(mask)
            # cv2.imshow("Imagen subs", contours)
            ball_detected(cv_image)
            cv2.waitKey(1)
        except CvBridgeError as e:
            print(e)

 


  
def main(args):
    i_sub = image_subscriber()
    rospy.init_node("Image_Subscriber", anonymous=True)
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main(sys.argv)
    