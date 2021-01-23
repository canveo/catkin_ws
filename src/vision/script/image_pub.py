#!/usr/bin/env python

import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import  CvBridge, CvBridgeError
import sys

class image_publisher:

    def __init__(self):        
        self.image_pub = rospy.Publisher("image_topic", Image, queue_size=10)
        self.cap = cv2.VideoCapture('/home/canveo/catkin_ws/src/vision/script/video/tennis-ball-video.mp4')
        self.r = rospy.Rate(100) # 10hz
        self.bridge = CvBridge()
        print("aqui 1")
        self.isRunning = True

    def detecting_ball(self, args):
        if (self.cap.isOpened()== False): 
            print("Error opening video stream or file")

        while(self.cap.isOpened() and not rospy.is_shutdown()):
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
        # try:
        #     ret, frame = self.cap.read()
        #     self.image_message = self.bridge.cv2_to_imgmsg(frame, "passthrough")
        # except CvBridgeError as e:
        #     print(e)
        
        # self.image_pub.publish(self.image_message)
        # self.r.sleep()
        # print("aqui 2")
    
        # cv2.imshow('Mask', mask)

        # Press Q on keyboard to  exit
        # if cv2.waitKey(25) & 0xFF == ord('q'):
        #     break





    

def main(args):
    rospy.init_node("Image_Publisher", anonymous=True) 
    i_pub = image_publisher()  
    # i_pub.detecting_ball() 
    # rospy.spin()      
    try:
        i_pub.detecting_ball(args)  
    except KeyboardInterrupt:
        print("Shuting down")
        i_pub.Stop()
    cv2.destroyAllWindows()      


if __name__ == "__main__":
    try:
        main(sys.argv)
    except rospy.ROSInterruptException:
        rospy.loginfo("node pub terminated")
        
    