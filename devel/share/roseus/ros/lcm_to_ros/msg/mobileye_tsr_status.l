;; Auto-generated. Do not edit!


(when (boundp 'lcm_to_ros::mobileye_tsr_status)
  (if (not (find-package "LCM_TO_ROS"))
    (make-package "LCM_TO_ROS"))
  (shadow 'mobileye_tsr_status (find-package "LCM_TO_ROS")))
(unless (find-package "LCM_TO_ROS::MOBILEYE_TSR_STATUS")
  (make-package "LCM_TO_ROS::MOBILEYE_TSR_STATUS"))

(in-package "ROS")
;;//! \htmlinclude mobileye_tsr_status.msg.html


(defclass lcm_to_ros::mobileye_tsr_status
  :super ros::object
  :slots (_timestamp_sec _timestamp_nsec _tsr1_tipo _tsr1_valor _tsr2_tipo _tsr2_valor _tsr3_tipo _tsr3_valor _tsr4_tipo _tsr4_valor ))

(defmethod lcm_to_ros::mobileye_tsr_status
  (:init
   (&key
    ((:timestamp_sec __timestamp_sec) 0)
    ((:timestamp_nsec __timestamp_nsec) 0)
    ((:tsr1_tipo __tsr1_tipo) 0)
    ((:tsr1_valor __tsr1_valor) 0)
    ((:tsr2_tipo __tsr2_tipo) 0)
    ((:tsr2_valor __tsr2_valor) 0)
    ((:tsr3_tipo __tsr3_tipo) 0)
    ((:tsr3_valor __tsr3_valor) 0)
    ((:tsr4_tipo __tsr4_tipo) 0)
    ((:tsr4_valor __tsr4_valor) 0)
    )
   (send-super :init)
   (setq _timestamp_sec (round __timestamp_sec))
   (setq _timestamp_nsec (round __timestamp_nsec))
   (setq _tsr1_tipo (round __tsr1_tipo))
   (setq _tsr1_valor (round __tsr1_valor))
   (setq _tsr2_tipo (round __tsr2_tipo))
   (setq _tsr2_valor (round __tsr2_valor))
   (setq _tsr3_tipo (round __tsr3_tipo))
   (setq _tsr3_valor (round __tsr3_valor))
   (setq _tsr4_tipo (round __tsr4_tipo))
   (setq _tsr4_valor (round __tsr4_valor))
   self)
  (:timestamp_sec
   (&optional __timestamp_sec)
   (if __timestamp_sec (setq _timestamp_sec __timestamp_sec)) _timestamp_sec)
  (:timestamp_nsec
   (&optional __timestamp_nsec)
   (if __timestamp_nsec (setq _timestamp_nsec __timestamp_nsec)) _timestamp_nsec)
  (:tsr1_tipo
   (&optional __tsr1_tipo)
   (if __tsr1_tipo (setq _tsr1_tipo __tsr1_tipo)) _tsr1_tipo)
  (:tsr1_valor
   (&optional __tsr1_valor)
   (if __tsr1_valor (setq _tsr1_valor __tsr1_valor)) _tsr1_valor)
  (:tsr2_tipo
   (&optional __tsr2_tipo)
   (if __tsr2_tipo (setq _tsr2_tipo __tsr2_tipo)) _tsr2_tipo)
  (:tsr2_valor
   (&optional __tsr2_valor)
   (if __tsr2_valor (setq _tsr2_valor __tsr2_valor)) _tsr2_valor)
  (:tsr3_tipo
   (&optional __tsr3_tipo)
   (if __tsr3_tipo (setq _tsr3_tipo __tsr3_tipo)) _tsr3_tipo)
  (:tsr3_valor
   (&optional __tsr3_valor)
   (if __tsr3_valor (setq _tsr3_valor __tsr3_valor)) _tsr3_valor)
  (:tsr4_tipo
   (&optional __tsr4_tipo)
   (if __tsr4_tipo (setq _tsr4_tipo __tsr4_tipo)) _tsr4_tipo)
  (:tsr4_valor
   (&optional __tsr4_valor)
   (if __tsr4_valor (setq _tsr4_valor __tsr4_valor)) _tsr4_valor)
  (:serialization-length
   ()
   (+
    ;; int32 _timestamp_sec
    4
    ;; int32 _timestamp_nsec
    4
    ;; byte _tsr1_tipo
    1
    ;; byte _tsr1_valor
    1
    ;; byte _tsr2_tipo
    1
    ;; byte _tsr2_valor
    1
    ;; byte _tsr3_tipo
    1
    ;; byte _tsr3_valor
    1
    ;; byte _tsr4_tipo
    1
    ;; byte _tsr4_valor
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _timestamp_sec
       (write-long _timestamp_sec s)
     ;; int32 _timestamp_nsec
       (write-long _timestamp_nsec s)
     ;; byte _tsr1_tipo
       (write-byte _tsr1_tipo s)
     ;; byte _tsr1_valor
       (write-byte _tsr1_valor s)
     ;; byte _tsr2_tipo
       (write-byte _tsr2_tipo s)
     ;; byte _tsr2_valor
       (write-byte _tsr2_valor s)
     ;; byte _tsr3_tipo
       (write-byte _tsr3_tipo s)
     ;; byte _tsr3_valor
       (write-byte _tsr3_valor s)
     ;; byte _tsr4_tipo
       (write-byte _tsr4_tipo s)
     ;; byte _tsr4_valor
       (write-byte _tsr4_valor s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _timestamp_sec
     (setq _timestamp_sec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _timestamp_nsec
     (setq _timestamp_nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; byte _tsr1_tipo
     (setq _tsr1_tipo (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _tsr1_tipo 127) (setq _tsr1_tipo (- _tsr1_tipo 256)))
   ;; byte _tsr1_valor
     (setq _tsr1_valor (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _tsr1_valor 127) (setq _tsr1_valor (- _tsr1_valor 256)))
   ;; byte _tsr2_tipo
     (setq _tsr2_tipo (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _tsr2_tipo 127) (setq _tsr2_tipo (- _tsr2_tipo 256)))
   ;; byte _tsr2_valor
     (setq _tsr2_valor (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _tsr2_valor 127) (setq _tsr2_valor (- _tsr2_valor 256)))
   ;; byte _tsr3_tipo
     (setq _tsr3_tipo (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _tsr3_tipo 127) (setq _tsr3_tipo (- _tsr3_tipo 256)))
   ;; byte _tsr3_valor
     (setq _tsr3_valor (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _tsr3_valor 127) (setq _tsr3_valor (- _tsr3_valor 256)))
   ;; byte _tsr4_tipo
     (setq _tsr4_tipo (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _tsr4_tipo 127) (setq _tsr4_tipo (- _tsr4_tipo 256)))
   ;; byte _tsr4_valor
     (setq _tsr4_valor (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _tsr4_valor 127) (setq _tsr4_valor (- _tsr4_valor 256)))
   ;;
   self)
  )

(setf (get lcm_to_ros::mobileye_tsr_status :md5sum-) "8ddb6df2c3438877c3e5e4ec2624a854")
(setf (get lcm_to_ros::mobileye_tsr_status :datatype-) "lcm_to_ros/mobileye_tsr_status")
(setf (get lcm_to_ros::mobileye_tsr_status :definition-)
      "#######################################################################
# This message was automatically generated by the lcm_to_ros package
# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu
#######################################################################
#
# Source message:    .msg
# Creation:          lun 18 feb 2019 17:14:17 CET
#
#######################################################################
int32               timestamp_sec
int32               timestamp_nsec
byte                tsr1_tipo
byte                tsr1_valor
byte                tsr2_tipo
byte                tsr2_valor
byte                tsr3_tipo
byte                tsr3_valor
byte                tsr4_tipo
byte                tsr4_valor

")



(provide :lcm_to_ros/mobileye_tsr_status "8ddb6df2c3438877c3e5e4ec2624a854")


