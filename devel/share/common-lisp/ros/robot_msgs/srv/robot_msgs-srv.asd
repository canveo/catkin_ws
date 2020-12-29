
(cl:in-package :asdf)

(defsystem "robot_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "cambiar_vel" :depends-on ("_package_cambiar_vel"))
    (:file "_package_cambiar_vel" :depends-on ("_package"))
  ))