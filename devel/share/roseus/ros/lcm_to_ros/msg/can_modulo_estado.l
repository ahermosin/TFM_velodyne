;; Auto-generated. Do not edit!


(when (boundp 'lcm_to_ros::can_modulo_estado)
  (if (not (find-package "LCM_TO_ROS"))
    (make-package "LCM_TO_ROS"))
  (shadow 'can_modulo_estado (find-package "LCM_TO_ROS")))
(unless (find-package "LCM_TO_ROS::CAN_MODULO_ESTADO")
  (make-package "LCM_TO_ROS::CAN_MODULO_ESTADO"))

(in-package "ROS")
;;//! \htmlinclude can_modulo_estado.msg.html


(defclass lcm_to_ros::can_modulo_estado
  :super ros::object
  :slots (_Timestamp_sec _Timestamp_nsec _IdModulo _InputVolA _InputVolB _InputCorrA _InputCorrB _OutputAnlg1 _OutputAnlg2 _InputDig1 _InputDig2 _InputDig3 _InputDig4 _OutputDig1 _OutputDig2 _OutputDig3 _OutputDig4 _OutputDig5 _OutputDig6 _OutputDig7 _OutputDig8 ))

(defmethod lcm_to_ros::can_modulo_estado
  (:init
   (&key
    ((:Timestamp_sec __Timestamp_sec) 0)
    ((:Timestamp_nsec __Timestamp_nsec) 0)
    ((:IdModulo __IdModulo) 0)
    ((:InputVolA __InputVolA) 0.0)
    ((:InputVolB __InputVolB) 0.0)
    ((:InputCorrA __InputCorrA) 0.0)
    ((:InputCorrB __InputCorrB) 0.0)
    ((:OutputAnlg1 __OutputAnlg1) 0.0)
    ((:OutputAnlg2 __OutputAnlg2) 0.0)
    ((:InputDig1 __InputDig1) nil)
    ((:InputDig2 __InputDig2) nil)
    ((:InputDig3 __InputDig3) nil)
    ((:InputDig4 __InputDig4) nil)
    ((:OutputDig1 __OutputDig1) nil)
    ((:OutputDig2 __OutputDig2) nil)
    ((:OutputDig3 __OutputDig3) nil)
    ((:OutputDig4 __OutputDig4) nil)
    ((:OutputDig5 __OutputDig5) nil)
    ((:OutputDig6 __OutputDig6) nil)
    ((:OutputDig7 __OutputDig7) nil)
    ((:OutputDig8 __OutputDig8) nil)
    )
   (send-super :init)
   (setq _Timestamp_sec (round __Timestamp_sec))
   (setq _Timestamp_nsec (round __Timestamp_nsec))
   (setq _IdModulo (round __IdModulo))
   (setq _InputVolA (float __InputVolA))
   (setq _InputVolB (float __InputVolB))
   (setq _InputCorrA (float __InputCorrA))
   (setq _InputCorrB (float __InputCorrB))
   (setq _OutputAnlg1 (float __OutputAnlg1))
   (setq _OutputAnlg2 (float __OutputAnlg2))
   (setq _InputDig1 __InputDig1)
   (setq _InputDig2 __InputDig2)
   (setq _InputDig3 __InputDig3)
   (setq _InputDig4 __InputDig4)
   (setq _OutputDig1 __OutputDig1)
   (setq _OutputDig2 __OutputDig2)
   (setq _OutputDig3 __OutputDig3)
   (setq _OutputDig4 __OutputDig4)
   (setq _OutputDig5 __OutputDig5)
   (setq _OutputDig6 __OutputDig6)
   (setq _OutputDig7 __OutputDig7)
   (setq _OutputDig8 __OutputDig8)
   self)
  (:Timestamp_sec
   (&optional __Timestamp_sec)
   (if __Timestamp_sec (setq _Timestamp_sec __Timestamp_sec)) _Timestamp_sec)
  (:Timestamp_nsec
   (&optional __Timestamp_nsec)
   (if __Timestamp_nsec (setq _Timestamp_nsec __Timestamp_nsec)) _Timestamp_nsec)
  (:IdModulo
   (&optional __IdModulo)
   (if __IdModulo (setq _IdModulo __IdModulo)) _IdModulo)
  (:InputVolA
   (&optional __InputVolA)
   (if __InputVolA (setq _InputVolA __InputVolA)) _InputVolA)
  (:InputVolB
   (&optional __InputVolB)
   (if __InputVolB (setq _InputVolB __InputVolB)) _InputVolB)
  (:InputCorrA
   (&optional __InputCorrA)
   (if __InputCorrA (setq _InputCorrA __InputCorrA)) _InputCorrA)
  (:InputCorrB
   (&optional __InputCorrB)
   (if __InputCorrB (setq _InputCorrB __InputCorrB)) _InputCorrB)
  (:OutputAnlg1
   (&optional __OutputAnlg1)
   (if __OutputAnlg1 (setq _OutputAnlg1 __OutputAnlg1)) _OutputAnlg1)
  (:OutputAnlg2
   (&optional __OutputAnlg2)
   (if __OutputAnlg2 (setq _OutputAnlg2 __OutputAnlg2)) _OutputAnlg2)
  (:InputDig1
   (&optional __InputDig1)
   (if __InputDig1 (setq _InputDig1 __InputDig1)) _InputDig1)
  (:InputDig2
   (&optional __InputDig2)
   (if __InputDig2 (setq _InputDig2 __InputDig2)) _InputDig2)
  (:InputDig3
   (&optional __InputDig3)
   (if __InputDig3 (setq _InputDig3 __InputDig3)) _InputDig3)
  (:InputDig4
   (&optional __InputDig4)
   (if __InputDig4 (setq _InputDig4 __InputDig4)) _InputDig4)
  (:OutputDig1
   (&optional __OutputDig1)
   (if __OutputDig1 (setq _OutputDig1 __OutputDig1)) _OutputDig1)
  (:OutputDig2
   (&optional __OutputDig2)
   (if __OutputDig2 (setq _OutputDig2 __OutputDig2)) _OutputDig2)
  (:OutputDig3
   (&optional __OutputDig3)
   (if __OutputDig3 (setq _OutputDig3 __OutputDig3)) _OutputDig3)
  (:OutputDig4
   (&optional __OutputDig4)
   (if __OutputDig4 (setq _OutputDig4 __OutputDig4)) _OutputDig4)
  (:OutputDig5
   (&optional __OutputDig5)
   (if __OutputDig5 (setq _OutputDig5 __OutputDig5)) _OutputDig5)
  (:OutputDig6
   (&optional __OutputDig6)
   (if __OutputDig6 (setq _OutputDig6 __OutputDig6)) _OutputDig6)
  (:OutputDig7
   (&optional __OutputDig7)
   (if __OutputDig7 (setq _OutputDig7 __OutputDig7)) _OutputDig7)
  (:OutputDig8
   (&optional __OutputDig8)
   (if __OutputDig8 (setq _OutputDig8 __OutputDig8)) _OutputDig8)
  (:serialization-length
   ()
   (+
    ;; int32 _Timestamp_sec
    4
    ;; int32 _Timestamp_nsec
    4
    ;; byte _IdModulo
    1
    ;; float64 _InputVolA
    8
    ;; float64 _InputVolB
    8
    ;; float64 _InputCorrA
    8
    ;; float64 _InputCorrB
    8
    ;; float64 _OutputAnlg1
    8
    ;; float64 _OutputAnlg2
    8
    ;; bool _InputDig1
    1
    ;; bool _InputDig2
    1
    ;; bool _InputDig3
    1
    ;; bool _InputDig4
    1
    ;; bool _OutputDig1
    1
    ;; bool _OutputDig2
    1
    ;; bool _OutputDig3
    1
    ;; bool _OutputDig4
    1
    ;; bool _OutputDig5
    1
    ;; bool _OutputDig6
    1
    ;; bool _OutputDig7
    1
    ;; bool _OutputDig8
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _Timestamp_sec
       (write-long _Timestamp_sec s)
     ;; int32 _Timestamp_nsec
       (write-long _Timestamp_nsec s)
     ;; byte _IdModulo
       (write-byte _IdModulo s)
     ;; float64 _InputVolA
       (sys::poke _InputVolA (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _InputVolB
       (sys::poke _InputVolB (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _InputCorrA
       (sys::poke _InputCorrA (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _InputCorrB
       (sys::poke _InputCorrB (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _OutputAnlg1
       (sys::poke _OutputAnlg1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _OutputAnlg2
       (sys::poke _OutputAnlg2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _InputDig1
       (if _InputDig1 (write-byte -1 s) (write-byte 0 s))
     ;; bool _InputDig2
       (if _InputDig2 (write-byte -1 s) (write-byte 0 s))
     ;; bool _InputDig3
       (if _InputDig3 (write-byte -1 s) (write-byte 0 s))
     ;; bool _InputDig4
       (if _InputDig4 (write-byte -1 s) (write-byte 0 s))
     ;; bool _OutputDig1
       (if _OutputDig1 (write-byte -1 s) (write-byte 0 s))
     ;; bool _OutputDig2
       (if _OutputDig2 (write-byte -1 s) (write-byte 0 s))
     ;; bool _OutputDig3
       (if _OutputDig3 (write-byte -1 s) (write-byte 0 s))
     ;; bool _OutputDig4
       (if _OutputDig4 (write-byte -1 s) (write-byte 0 s))
     ;; bool _OutputDig5
       (if _OutputDig5 (write-byte -1 s) (write-byte 0 s))
     ;; bool _OutputDig6
       (if _OutputDig6 (write-byte -1 s) (write-byte 0 s))
     ;; bool _OutputDig7
       (if _OutputDig7 (write-byte -1 s) (write-byte 0 s))
     ;; bool _OutputDig8
       (if _OutputDig8 (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _Timestamp_sec
     (setq _Timestamp_sec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Timestamp_nsec
     (setq _Timestamp_nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; byte _IdModulo
     (setq _IdModulo (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _IdModulo 127) (setq _IdModulo (- _IdModulo 256)))
   ;; float64 _InputVolA
     (setq _InputVolA (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _InputVolB
     (setq _InputVolB (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _InputCorrA
     (setq _InputCorrA (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _InputCorrB
     (setq _InputCorrB (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _OutputAnlg1
     (setq _OutputAnlg1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _OutputAnlg2
     (setq _OutputAnlg2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _InputDig1
     (setq _InputDig1 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _InputDig2
     (setq _InputDig2 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _InputDig3
     (setq _InputDig3 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _InputDig4
     (setq _InputDig4 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _OutputDig1
     (setq _OutputDig1 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _OutputDig2
     (setq _OutputDig2 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _OutputDig3
     (setq _OutputDig3 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _OutputDig4
     (setq _OutputDig4 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _OutputDig5
     (setq _OutputDig5 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _OutputDig6
     (setq _OutputDig6 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _OutputDig7
     (setq _OutputDig7 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _OutputDig8
     (setq _OutputDig8 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get lcm_to_ros::can_modulo_estado :md5sum-) "e6f65a6fba4df534967c07b0198c1dba")
(setf (get lcm_to_ros::can_modulo_estado :datatype-) "lcm_to_ros/can_modulo_estado")
(setf (get lcm_to_ros::can_modulo_estado :definition-)
      "#######################################################################
# This message was automatically generated by the lcm_to_ros package
# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu
#######################################################################
#
# Source message:    .msg
# Creation:          lun 18 feb 2019 17:14:16 CET
#
#######################################################################
int32               Timestamp_sec
int32               Timestamp_nsec
byte                IdModulo
float64             InputVolA
float64             InputVolB
float64             InputCorrA
float64             InputCorrB
float64             OutputAnlg1
float64             OutputAnlg2
bool                InputDig1
bool                InputDig2
bool                InputDig3
bool                InputDig4
bool                OutputDig1
bool                OutputDig2
bool                OutputDig3
bool                OutputDig4
bool                OutputDig5
bool                OutputDig6
bool                OutputDig7
bool                OutputDig8

")



(provide :lcm_to_ros/can_modulo_estado "e6f65a6fba4df534967c07b0198c1dba")


