#!/usr/bin/env python

import rospy
import cv2
from rospy.client import init_node
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import  CvBridge

class image_publisher:

    def __init__(self):        
        self.image_pub = rospy.Publisher("image_topic", Image, queue_size=10)
        self.cap = cv2.VideoCapture('/home/canveo/catkin_ws/src/vision/script/video/tennis-ball-video.mp4')
        self.bridge = CvBridge()
        print("aqui 1")



    def main(self):
        rospy.init_node("Image_Publisher", anonymous=True)
        self.r = rospy.Rate(10) # 10hz
        
        if (self.cap.isOpened()== False): 
            print("Error opening video stream or file")

        while(self.cap.isOpened()):
        # Capture frame-by-frame
            ret, frame = self.cap.read()
            if ret == True: 
                self.image_message = self.bridge.cv2_to_imgmsg(frame, "passthrough")
                self.image_pub.publish(self.image_message)
                self.r.sleep()
                print("aqui 2")
            
                # cv2.imshow('Mask', mask)

                # Press Q on keyboard to  exit
                if cv2.waitKey(25) & 0xFF == ord('q'):
                    break
            else: 
                break
        cv2.destroyAllWindows()


if __name__ == "__main__":
    try:
        ip = image_publisher()
        ip.main()

    except rospy.ROSInterruptException:
        rospy.loginfo("node terminated")