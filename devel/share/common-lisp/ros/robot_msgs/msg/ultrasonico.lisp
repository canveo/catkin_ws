; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude ultrasonico.msg.html

(cl:defclass <ultrasonico> (roslisp-msg-protocol:ros-message)
  ((metrico
    :reader metrico
    :initarg :metrico
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool))
   (ultrasonico
    :reader ultrasonico
    :initarg :ultrasonico
    :type sensor_msgs-msg:Range
    :initform (cl:make-instance 'sensor_msgs-msg:Range)))
)

(cl:defclass ultrasonico (<ultrasonico>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ultrasonico>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ultrasonico)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<ultrasonico> is deprecated: use robot_msgs-msg:ultrasonico instead.")))

(cl:ensure-generic-function 'metrico-val :lambda-list '(m))
(cl:defmethod metrico-val ((m <ultrasonico>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:metrico-val is deprecated.  Use robot_msgs-msg:metrico instead.")
  (metrico m))

(cl:ensure-generic-function 'ultrasonico-val :lambda-list '(m))
(cl:defmethod ultrasonico-val ((m <ultrasonico>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:ultrasonico-val is deprecated.  Use robot_msgs-msg:ultrasonico instead.")
  (ultrasonico m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ultrasonico>) ostream)
  "Serializes a message object of type '<ultrasonico>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'metrico) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ultrasonico) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ultrasonico>) istream)
  "Deserializes a message object of type '<ultrasonico>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'metrico) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ultrasonico) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ultrasonico>)))
  "Returns string type for a message object of type '<ultrasonico>"
  "robot_msgs/ultrasonico")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ultrasonico)))
  "Returns string type for a message object of type 'ultrasonico"
  "robot_msgs/ultrasonico")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ultrasonico>)))
  "Returns md5sum for a message object of type '<ultrasonico>"
  "4d215fc6d958a6fc2548282e53b7769e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ultrasonico)))
  "Returns md5sum for a message object of type 'ultrasonico"
  "4d215fc6d958a6fc2548282e53b7769e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ultrasonico>)))
  "Returns full string definition for message of type '<ultrasonico>"
  (cl:format cl:nil "std_msgs/Bool metrico~%sensor_msgs/Range ultrasonico~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%================================================================================~%MSG: sensor_msgs/Range~%# Single range reading from an active ranger that emits energy and reports~%# one range reading that is valid along an arc at the distance measured. ~%# This message is  not appropriate for laser scanners. See the LaserScan~%# message if you are working with a laser scanner.~%~%# This message also can represent a fixed-distance (binary) ranger.  This~%# sensor will have min_range===max_range===distance of detection.~%# These sensors follow REP 117 and will output -Inf if the object is detected~%# and +Inf if the object is outside of the detection range.~%~%Header header           # timestamp in the header is the time the ranger~%                        # returned the distance reading~%~%# Radiation type enums~%# If you want a value added to this list, send an email to the ros-users list~%uint8 ULTRASOUND=0~%uint8 INFRARED=1~%~%uint8 radiation_type    # the type of radiation used by the sensor~%                        # (sound, IR, etc) [enum]~%~%float32 field_of_view   # the size of the arc that the distance reading is~%                        # valid for [rad]~%                        # the object causing the range reading may have~%                        # been anywhere within -field_of_view/2 and~%                        # field_of_view/2 at the measured range. ~%                        # 0 angle corresponds to the x-axis of the sensor.~%~%float32 min_range       # minimum range value [m]~%float32 max_range       # maximum range value [m]~%                        # Fixed distance rangers require min_range==max_range~%~%float32 range           # range data [m]~%                        # (Note: values < range_min or > range_max~%                        # should be discarded)~%                        # Fixed distance rangers only output -Inf or +Inf.~%                        # -Inf represents a detection within fixed distance.~%                        # (Detection too close to the sensor to quantify)~%                        # +Inf represents no detection within the fixed distance.~%                        # (Object out of range)~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ultrasonico)))
  "Returns full string definition for message of type 'ultrasonico"
  (cl:format cl:nil "std_msgs/Bool metrico~%sensor_msgs/Range ultrasonico~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%================================================================================~%MSG: sensor_msgs/Range~%# Single range reading from an active ranger that emits energy and reports~%# one range reading that is valid along an arc at the distance measured. ~%# This message is  not appropriate for laser scanners. See the LaserScan~%# message if you are working with a laser scanner.~%~%# This message also can represent a fixed-distance (binary) ranger.  This~%# sensor will have min_range===max_range===distance of detection.~%# These sensors follow REP 117 and will output -Inf if the object is detected~%# and +Inf if the object is outside of the detection range.~%~%Header header           # timestamp in the header is the time the ranger~%                        # returned the distance reading~%~%# Radiation type enums~%# If you want a value added to this list, send an email to the ros-users list~%uint8 ULTRASOUND=0~%uint8 INFRARED=1~%~%uint8 radiation_type    # the type of radiation used by the sensor~%                        # (sound, IR, etc) [enum]~%~%float32 field_of_view   # the size of the arc that the distance reading is~%                        # valid for [rad]~%                        # the object causing the range reading may have~%                        # been anywhere within -field_of_view/2 and~%                        # field_of_view/2 at the measured range. ~%                        # 0 angle corresponds to the x-axis of the sensor.~%~%float32 min_range       # minimum range value [m]~%float32 max_range       # maximum range value [m]~%                        # Fixed distance rangers require min_range==max_range~%~%float32 range           # range data [m]~%                        # (Note: values < range_min or > range_max~%                        # should be discarded)~%                        # Fixed distance rangers only output -Inf or +Inf.~%                        # -Inf represents a detection within fixed distance.~%                        # (Detection too close to the sensor to quantify)~%                        # +Inf represents no detection within the fixed distance.~%                        # (Object out of range)~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ultrasonico>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'metrico))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ultrasonico))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ultrasonico>))
  "Converts a ROS message object to a list"
  (cl:list 'ultrasonico
    (cl:cons ':metrico (metrico msg))
    (cl:cons ':ultrasonico (ultrasonico msg))
))
