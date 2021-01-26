import cv2
from vision.script.video_utils import ball_detected


cap = cv2.VideoCapture('/home/canveo/catkin_ws/src/vision/script/video/tennis-ball-video.mp4')


if (cap.isOpened()== False): 
  print("Error opening video stream or file")

while(cap.isOpened()):
  ret, frame = cap.read()
  if ret == True:    
    ball_detected(frame)  
    if cv2.waitKey(25) & 0xFF == ord('q'):
      break
  else: 
    break
cap.release()
cv2.destroyAllWindows()