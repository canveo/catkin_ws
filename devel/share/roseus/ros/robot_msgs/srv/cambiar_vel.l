;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::cambiar_vel)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'cambiar_vel (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::CAMBIAR_VEL")
  (make-package "ROBOT_MSGS::CAMBIAR_VEL"))
(unless (find-package "ROBOT_MSGS::CAMBIAR_VELREQUEST")
  (make-package "ROBOT_MSGS::CAMBIAR_VELREQUEST"))
(unless (find-package "ROBOT_MSGS::CAMBIAR_VELRESPONSE")
  (make-package "ROBOT_MSGS::CAMBIAR_VELRESPONSE"))

(in-package "ROS")





(defclass robot_msgs::cambiar_velRequest
  :super ros::object
  :slots (_velocidad ))

(defmethod robot_msgs::cambiar_velRequest
  (:init
   (&key
    ((:velocidad __velocidad) 0.0)
    )
   (send-super :init)
   (setq _velocidad (float __velocidad))
   self)
  (:velocidad
   (&optional __velocidad)
   (if __velocidad (setq _velocidad __velocidad)) _velocidad)
  (:serialization-length
   ()
   (+
    ;; float32 _velocidad
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _velocidad
       (sys::poke _velocidad (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _velocidad
     (setq _velocidad (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass robot_msgs::cambiar_velResponse
  :super ros::object
  :slots (_Mensaje ))

(defmethod robot_msgs::cambiar_velResponse
  (:init
   (&key
    ((:Mensaje __Mensaje) "")
    )
   (send-super :init)
   (setq _Mensaje (string __Mensaje))
   self)
  (:Mensaje
   (&optional __Mensaje)
   (if __Mensaje (setq _Mensaje __Mensaje)) _Mensaje)
  (:serialization-length
   ()
   (+
    ;; string _Mensaje
    4 (length _Mensaje)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _Mensaje
       (write-long (length _Mensaje) s) (princ _Mensaje s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _Mensaje
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _Mensaje (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_msgs::cambiar_vel
  :super ros::object
  :slots ())

(setf (get robot_msgs::cambiar_vel :md5sum-) "8741f5a26630d67b17b5a382a1c74988")
(setf (get robot_msgs::cambiar_vel :datatype-) "robot_msgs/cambiar_vel")
(setf (get robot_msgs::cambiar_vel :request) robot_msgs::cambiar_velRequest)
(setf (get robot_msgs::cambiar_vel :response) robot_msgs::cambiar_velResponse)

(defmethod robot_msgs::cambiar_velRequest
  (:response () (instance robot_msgs::cambiar_velResponse :init)))

(setf (get robot_msgs::cambiar_velRequest :md5sum-) "8741f5a26630d67b17b5a382a1c74988")
(setf (get robot_msgs::cambiar_velRequest :datatype-) "robot_msgs/cambiar_velRequest")
(setf (get robot_msgs::cambiar_velRequest :definition-)
      "float32 velocidad
---
string Mensaje



")

(setf (get robot_msgs::cambiar_velResponse :md5sum-) "8741f5a26630d67b17b5a382a1c74988")
(setf (get robot_msgs::cambiar_velResponse :datatype-) "robot_msgs/cambiar_velResponse")
(setf (get robot_msgs::cambiar_velResponse :definition-)
      "float32 velocidad
---
string Mensaje



")



(provide :robot_msgs/cambiar_vel "8741f5a26630d67b17b5a382a1c74988")


