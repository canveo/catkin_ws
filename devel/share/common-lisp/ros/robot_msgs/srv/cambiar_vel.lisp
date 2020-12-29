; Auto-generated. Do not edit!


(cl:in-package robot_msgs-srv)


;//! \htmlinclude cambiar_vel-request.msg.html

(cl:defclass <cambiar_vel-request> (roslisp-msg-protocol:ros-message)
  ((velocidad
    :reader velocidad
    :initarg :velocidad
    :type cl:float
    :initform 0.0))
)

(cl:defclass cambiar_vel-request (<cambiar_vel-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cambiar_vel-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cambiar_vel-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<cambiar_vel-request> is deprecated: use robot_msgs-srv:cambiar_vel-request instead.")))

(cl:ensure-generic-function 'velocidad-val :lambda-list '(m))
(cl:defmethod velocidad-val ((m <cambiar_vel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:velocidad-val is deprecated.  Use robot_msgs-srv:velocidad instead.")
  (velocidad m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cambiar_vel-request>) ostream)
  "Serializes a message object of type '<cambiar_vel-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocidad))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cambiar_vel-request>) istream)
  "Deserializes a message object of type '<cambiar_vel-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cambiar_vel-request>)))
  "Returns string type for a service object of type '<cambiar_vel-request>"
  "robot_msgs/cambiar_velRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cambiar_vel-request)))
  "Returns string type for a service object of type 'cambiar_vel-request"
  "robot_msgs/cambiar_velRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cambiar_vel-request>)))
  "Returns md5sum for a message object of type '<cambiar_vel-request>"
  "8741f5a26630d67b17b5a382a1c74988")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cambiar_vel-request)))
  "Returns md5sum for a message object of type 'cambiar_vel-request"
  "8741f5a26630d67b17b5a382a1c74988")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cambiar_vel-request>)))
  "Returns full string definition for message of type '<cambiar_vel-request>"
  (cl:format cl:nil "float32 velocidad~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cambiar_vel-request)))
  "Returns full string definition for message of type 'cambiar_vel-request"
  (cl:format cl:nil "float32 velocidad~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cambiar_vel-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cambiar_vel-request>))
  "Converts a ROS message object to a list"
  (cl:list 'cambiar_vel-request
    (cl:cons ':velocidad (velocidad msg))
))
;//! \htmlinclude cambiar_vel-response.msg.html

(cl:defclass <cambiar_vel-response> (roslisp-msg-protocol:ros-message)
  ((Mensaje
    :reader Mensaje
    :initarg :Mensaje
    :type cl:string
    :initform ""))
)

(cl:defclass cambiar_vel-response (<cambiar_vel-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cambiar_vel-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cambiar_vel-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<cambiar_vel-response> is deprecated: use robot_msgs-srv:cambiar_vel-response instead.")))

(cl:ensure-generic-function 'Mensaje-val :lambda-list '(m))
(cl:defmethod Mensaje-val ((m <cambiar_vel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:Mensaje-val is deprecated.  Use robot_msgs-srv:Mensaje instead.")
  (Mensaje m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cambiar_vel-response>) ostream)
  "Serializes a message object of type '<cambiar_vel-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'Mensaje))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'Mensaje))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cambiar_vel-response>) istream)
  "Deserializes a message object of type '<cambiar_vel-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Mensaje) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'Mensaje) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cambiar_vel-response>)))
  "Returns string type for a service object of type '<cambiar_vel-response>"
  "robot_msgs/cambiar_velResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cambiar_vel-response)))
  "Returns string type for a service object of type 'cambiar_vel-response"
  "robot_msgs/cambiar_velResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cambiar_vel-response>)))
  "Returns md5sum for a message object of type '<cambiar_vel-response>"
  "8741f5a26630d67b17b5a382a1c74988")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cambiar_vel-response)))
  "Returns md5sum for a message object of type 'cambiar_vel-response"
  "8741f5a26630d67b17b5a382a1c74988")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cambiar_vel-response>)))
  "Returns full string definition for message of type '<cambiar_vel-response>"
  (cl:format cl:nil "string Mensaje~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cambiar_vel-response)))
  "Returns full string definition for message of type 'cambiar_vel-response"
  (cl:format cl:nil "string Mensaje~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cambiar_vel-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'Mensaje))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cambiar_vel-response>))
  "Converts a ROS message object to a list"
  (cl:list 'cambiar_vel-response
    (cl:cons ':Mensaje (Mensaje msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'cambiar_vel)))
  'cambiar_vel-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'cambiar_vel)))
  'cambiar_vel-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cambiar_vel)))
  "Returns string type for a service object of type '<cambiar_vel>"
  "robot_msgs/cambiar_vel")