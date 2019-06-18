
(cl:in-package :asdf)

(defsystem "pcl_segment-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "observationRPY" :depends-on ("_package_observationRPY"))
    (:file "_package_observationRPY" :depends-on ("_package"))
    (:file "positionRPY" :depends-on ("_package_positionRPY"))
    (:file "_package_positionRPY" :depends-on ("_package"))
  ))