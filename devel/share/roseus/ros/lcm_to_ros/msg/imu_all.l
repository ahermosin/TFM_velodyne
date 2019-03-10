;; Auto-generated. Do not edit!


(when (boundp 'lcm_to_ros::imu_all)
  (if (not (find-package "LCM_TO_ROS"))
    (make-package "LCM_TO_ROS"))
  (shadow 'imu_all (find-package "LCM_TO_ROS")))
(unless (find-package "LCM_TO_ROS::IMU_ALL")
  (make-package "LCM_TO_ROS::IMU_ALL"))

(in-package "ROS")
;;//! \htmlinclude imu_all.msg.html


(defclass lcm_to_ros::imu_all
  :super ros::object
  :slots (_Timestamp_sec _Timestamp_nsec _Roll _Pitch _Yaw _Wx _Wy _Wz _AcelX _AcelY _AcelZ _VelN _VelE _VelZ _GPSLong _GPSLat _GPSAlt _Temp _IMUTime _BITStatus ))

(defmethod lcm_to_ros::imu_all
  (:init
   (&key
    ((:Timestamp_sec __Timestamp_sec) 0)
    ((:Timestamp_nsec __Timestamp_nsec) 0)
    ((:Roll __Roll) 0.0)
    ((:Pitch __Pitch) 0.0)
    ((:Yaw __Yaw) 0.0)
    ((:Wx __Wx) 0.0)
    ((:Wy __Wy) 0.0)
    ((:Wz __Wz) 0.0)
    ((:AcelX __AcelX) 0.0)
    ((:AcelY __AcelY) 0.0)
    ((:AcelZ __AcelZ) 0.0)
    ((:VelN __VelN) 0.0)
    ((:VelE __VelE) 0.0)
    ((:VelZ __VelZ) 0.0)
    ((:GPSLong __GPSLong) 0.0)
    ((:GPSLat __GPSLat) 0.0)
    ((:GPSAlt __GPSAlt) 0.0)
    ((:Temp __Temp) 0.0)
    ((:IMUTime __IMUTime) 0)
    ((:BITStatus __BITStatus) 0)
    )
   (send-super :init)
   (setq _Timestamp_sec (round __Timestamp_sec))
   (setq _Timestamp_nsec (round __Timestamp_nsec))
   (setq _Roll (float __Roll))
   (setq _Pitch (float __Pitch))
   (setq _Yaw (float __Yaw))
   (setq _Wx (float __Wx))
   (setq _Wy (float __Wy))
   (setq _Wz (float __Wz))
   (setq _AcelX (float __AcelX))
   (setq _AcelY (float __AcelY))
   (setq _AcelZ (float __AcelZ))
   (setq _VelN (float __VelN))
   (setq _VelE (float __VelE))
   (setq _VelZ (float __VelZ))
   (setq _GPSLong (float __GPSLong))
   (setq _GPSLat (float __GPSLat))
   (setq _GPSAlt (float __GPSAlt))
   (setq _Temp (float __Temp))
   (setq _IMUTime (round __IMUTime))
   (setq _BITStatus (round __BITStatus))
   self)
  (:Timestamp_sec
   (&optional __Timestamp_sec)
   (if __Timestamp_sec (setq _Timestamp_sec __Timestamp_sec)) _Timestamp_sec)
  (:Timestamp_nsec
   (&optional __Timestamp_nsec)
   (if __Timestamp_nsec (setq _Timestamp_nsec __Timestamp_nsec)) _Timestamp_nsec)
  (:Roll
   (&optional __Roll)
   (if __Roll (setq _Roll __Roll)) _Roll)
  (:Pitch
   (&optional __Pitch)
   (if __Pitch (setq _Pitch __Pitch)) _Pitch)
  (:Yaw
   (&optional __Yaw)
   (if __Yaw (setq _Yaw __Yaw)) _Yaw)
  (:Wx
   (&optional __Wx)
   (if __Wx (setq _Wx __Wx)) _Wx)
  (:Wy
   (&optional __Wy)
   (if __Wy (setq _Wy __Wy)) _Wy)
  (:Wz
   (&optional __Wz)
   (if __Wz (setq _Wz __Wz)) _Wz)
  (:AcelX
   (&optional __AcelX)
   (if __AcelX (setq _AcelX __AcelX)) _AcelX)
  (:AcelY
   (&optional __AcelY)
   (if __AcelY (setq _AcelY __AcelY)) _AcelY)
  (:AcelZ
   (&optional __AcelZ)
   (if __AcelZ (setq _AcelZ __AcelZ)) _AcelZ)
  (:VelN
   (&optional __VelN)
   (if __VelN (setq _VelN __VelN)) _VelN)
  (:VelE
   (&optional __VelE)
   (if __VelE (setq _VelE __VelE)) _VelE)
  (:VelZ
   (&optional __VelZ)
   (if __VelZ (setq _VelZ __VelZ)) _VelZ)
  (:GPSLong
   (&optional __GPSLong)
   (if __GPSLong (setq _GPSLong __GPSLong)) _GPSLong)
  (:GPSLat
   (&optional __GPSLat)
   (if __GPSLat (setq _GPSLat __GPSLat)) _GPSLat)
  (:GPSAlt
   (&optional __GPSAlt)
   (if __GPSAlt (setq _GPSAlt __GPSAlt)) _GPSAlt)
  (:Temp
   (&optional __Temp)
   (if __Temp (setq _Temp __Temp)) _Temp)
  (:IMUTime
   (&optional __IMUTime)
   (if __IMUTime (setq _IMUTime __IMUTime)) _IMUTime)
  (:BITStatus
   (&optional __BITStatus)
   (if __BITStatus (setq _BITStatus __BITStatus)) _BITStatus)
  (:serialization-length
   ()
   (+
    ;; int32 _Timestamp_sec
    4
    ;; int32 _Timestamp_nsec
    4
    ;; float64 _Roll
    8
    ;; float64 _Pitch
    8
    ;; float64 _Yaw
    8
    ;; float64 _Wx
    8
    ;; float64 _Wy
    8
    ;; float64 _Wz
    8
    ;; float64 _AcelX
    8
    ;; float64 _AcelY
    8
    ;; float64 _AcelZ
    8
    ;; float64 _VelN
    8
    ;; float64 _VelE
    8
    ;; float64 _VelZ
    8
    ;; float64 _GPSLong
    8
    ;; float64 _GPSLat
    8
    ;; float64 _GPSAlt
    8
    ;; float64 _Temp
    8
    ;; int32 _IMUTime
    4
    ;; int16 _BITStatus
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _Timestamp_sec
       (write-long _Timestamp_sec s)
     ;; int32 _Timestamp_nsec
       (write-long _Timestamp_nsec s)
     ;; float64 _Roll
       (sys::poke _Roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Pitch
       (sys::poke _Pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Yaw
       (sys::poke _Yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Wx
       (sys::poke _Wx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Wy
       (sys::poke _Wy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Wz
       (sys::poke _Wz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _AcelX
       (sys::poke _AcelX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _AcelY
       (sys::poke _AcelY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _AcelZ
       (sys::poke _AcelZ (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _VelN
       (sys::poke _VelN (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _VelE
       (sys::poke _VelE (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _VelZ
       (sys::poke _VelZ (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _GPSLong
       (sys::poke _GPSLong (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _GPSLat
       (sys::poke _GPSLat (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _GPSAlt
       (sys::poke _GPSAlt (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Temp
       (sys::poke _Temp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _IMUTime
       (write-long _IMUTime s)
     ;; int16 _BITStatus
       (write-word _BITStatus s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _Timestamp_sec
     (setq _Timestamp_sec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Timestamp_nsec
     (setq _Timestamp_nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _Roll
     (setq _Roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Pitch
     (setq _Pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Yaw
     (setq _Yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Wx
     (setq _Wx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Wy
     (setq _Wy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Wz
     (setq _Wz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _AcelX
     (setq _AcelX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _AcelY
     (setq _AcelY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _AcelZ
     (setq _AcelZ (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _VelN
     (setq _VelN (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _VelE
     (setq _VelE (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _VelZ
     (setq _VelZ (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _GPSLong
     (setq _GPSLong (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _GPSLat
     (setq _GPSLat (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _GPSAlt
     (setq _GPSAlt (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Temp
     (setq _Temp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _IMUTime
     (setq _IMUTime (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int16 _BITStatus
     (setq _BITStatus (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get lcm_to_ros::imu_all :md5sum-) "ec9945e7705b83f3d7cbfa676d070663")
(setf (get lcm_to_ros::imu_all :datatype-) "lcm_to_ros/imu_all")
(setf (get lcm_to_ros::imu_all :definition-)
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
float64             Roll
float64             Pitch
float64             Yaw
float64             Wx
float64             Wy
float64             Wz
float64             AcelX
float64             AcelY
float64             AcelZ
float64             VelN
float64             VelE
float64             VelZ
float64             GPSLong
float64             GPSLat
float64             GPSAlt
float64             Temp
int32               IMUTime
int16               BITStatus

")



(provide :lcm_to_ros/imu_all "ec9945e7705b83f3d7cbfa676d070663")


