
(cl:in-package :asdf)

(defsystem "robot_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ultrasonico" :depends-on ("_package_ultrasonico"))
    (:file "_package_ultrasonico" :depends-on ("_package"))
  ))