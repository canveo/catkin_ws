;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::ultrasonico)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'ultrasonico (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::ULTRASONICO")
  (make-package "ROBOT_MSGS::ULTRASONICO"))

(in-package "ROS")
;;//! \htmlinclude ultrasonico.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robot_msgs::ultrasonico
  :super ros::object
  :slots (_metrico _ultrasonico ))

(defmethod robot_msgs::ultrasonico
  (:init
   (&key
    ((:metrico __metrico) (instance std_msgs::Bool :init))
    ((:ultrasonico __ultrasonico) (instance sensor_msgs::Range :init))
    )
   (send-super :init)
   (setq _metrico __metrico)
   (setq _ultrasonico __ultrasonico)
   self)
  (:metrico
   (&rest __metrico)
   (if (keywordp (car __metrico))
       (send* _metrico __metrico)
     (progn
       (if __metrico (setq _metrico (car __metrico)))
       _metrico)))
  (:ultrasonico
   (&rest __ultrasonico)
   (if (keywordp (car __ultrasonico))
       (send* _ultrasonico __ultrasonico)
     (progn
       (if __ultrasonico (setq _ultrasonico (car __ultrasonico)))
       _ultrasonico)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Bool _metrico
    (send _metrico :serialization-length)
    ;; sensor_msgs/Range _ultrasonico
    (send _ultrasonico :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Bool _metrico
       (send _metrico :serialize s)
     ;; sensor_msgs/Range _ultrasonico
       (send _ultrasonico :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Bool _metrico
     (send _metrico :deserialize buf ptr-) (incf ptr- (send _metrico :serialization-length))
   ;; sensor_msgs/Range _ultrasonico
     (send _ultrasonico :deserialize buf ptr-) (incf ptr- (send _ultrasonico :serialization-length))
   ;;
   self)
  )

(setf (get robot_msgs::ultrasonico :md5sum-) "4d215fc6d958a6fc2548282e53b7769e")
(setf (get robot_msgs::ultrasonico :datatype-) "robot_msgs/ultrasonico")
(setf (get robot_msgs::ultrasonico :definition-)
      "std_msgs/Bool metrico
sensor_msgs/Range ultrasonico

================================================================================
MSG: std_msgs/Bool
bool data
================================================================================
MSG: sensor_msgs/Range
# Single range reading from an active ranger that emits energy and reports
# one range reading that is valid along an arc at the distance measured. 
# This message is  not appropriate for laser scanners. See the LaserScan
# message if you are working with a laser scanner.

# This message also can represent a fixed-distance (binary) ranger.  This
# sensor will have min_range===max_range===distance of detection.
# These sensors follow REP 117 and will output -Inf if the object is detected
# and +Inf if the object is outside of the detection range.

Header header           # timestamp in the header is the time the ranger
                        # returned the distance reading

# Radiation type enums
# If you want a value added to this list, send an email to the ros-users list
uint8 ULTRASOUND=0
uint8 INFRARED=1

uint8 radiation_type    # the type of radiation used by the sensor
                        # (sound, IR, etc) [enum]

float32 field_of_view   # the size of the arc that the distance reading is
                        # valid for [rad]
                        # the object causing the range reading may have
                        # been anywhere within -field_of_view/2 and
                        # field_of_view/2 at the measured range. 
                        # 0 angle corresponds to the x-axis of the sensor.

float32 min_range       # minimum range value [m]
float32 max_range       # maximum range value [m]
                        # Fixed distance rangers require min_range==max_range

float32 range           # range data [m]
                        # (Note: values < range_min or > range_max
                        # should be discarded)
                        # Fixed distance rangers only output -Inf or +Inf.
                        # -Inf represents a detection within fixed distance.
                        # (Detection too close to the sensor to quantify)
                        # +Inf represents no detection within the fixed distance.
                        # (Object out of range)
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :robot_msgs/ultrasonico "4d215fc6d958a6fc2548282e53b7769e")


