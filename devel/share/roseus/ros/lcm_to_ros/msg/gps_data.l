;; Auto-generated. Do not edit!


(when (boundp 'lcm_to_ros::gps_data)
  (if (not (find-package "LCM_TO_ROS"))
    (make-package "LCM_TO_ROS"))
  (shadow 'gps_data (find-package "LCM_TO_ROS")))
(unless (find-package "LCM_TO_ROS::GPS_DATA")
  (make-package "LCM_TO_ROS::GPS_DATA"))

(in-package "ROS")
;;//! \htmlinclude gps_data.msg.html


(defclass lcm_to_ros::gps_data
  :super ros::object
  :slots (_timestamp_sec _timestamp_nsec _hora _utm_este _utm_norte _longitud _latitud _altura _hdop _velocidad _heading_vel _semi_major_desv _semi_minor_desv _semi_major_orien _calidad _nro_satelites ))

(defmethod lcm_to_ros::gps_data
  (:init
   (&key
    ((:timestamp_sec __timestamp_sec) 0)
    ((:timestamp_nsec __timestamp_nsec) 0)
    ((:hora __hora) 0.0)
    ((:utm_este __utm_este) 0.0)
    ((:utm_norte __utm_norte) 0.0)
    ((:longitud __longitud) 0.0)
    ((:latitud __latitud) 0.0)
    ((:altura __altura) 0.0)
    ((:hdop __hdop) 0.0)
    ((:velocidad __velocidad) 0.0)
    ((:heading_vel __heading_vel) 0.0)
    ((:semi_major_desv __semi_major_desv) 0.0)
    ((:semi_minor_desv __semi_minor_desv) 0.0)
    ((:semi_major_orien __semi_major_orien) 0.0)
    ((:calidad __calidad) 0)
    ((:nro_satelites __nro_satelites) 0)
    )
   (send-super :init)
   (setq _timestamp_sec (round __timestamp_sec))
   (setq _timestamp_nsec (round __timestamp_nsec))
   (setq _hora (float __hora))
   (setq _utm_este (float __utm_este))
   (setq _utm_norte (float __utm_norte))
   (setq _longitud (float __longitud))
   (setq _latitud (float __latitud))
   (setq _altura (float __altura))
   (setq _hdop (float __hdop))
   (setq _velocidad (float __velocidad))
   (setq _heading_vel (float __heading_vel))
   (setq _semi_major_desv (float __semi_major_desv))
   (setq _semi_minor_desv (float __semi_minor_desv))
   (setq _semi_major_orien (float __semi_major_orien))
   (setq _calidad (round __calidad))
   (setq _nro_satelites (round __nro_satelites))
   self)
  (:timestamp_sec
   (&optional __timestamp_sec)
   (if __timestamp_sec (setq _timestamp_sec __timestamp_sec)) _timestamp_sec)
  (:timestamp_nsec
   (&optional __timestamp_nsec)
   (if __timestamp_nsec (setq _timestamp_nsec __timestamp_nsec)) _timestamp_nsec)
  (:hora
   (&optional __hora)
   (if __hora (setq _hora __hora)) _hora)
  (:utm_este
   (&optional __utm_este)
   (if __utm_este (setq _utm_este __utm_este)) _utm_este)
  (:utm_norte
   (&optional __utm_norte)
   (if __utm_norte (setq _utm_norte __utm_norte)) _utm_norte)
  (:longitud
   (&optional __longitud)
   (if __longitud (setq _longitud __longitud)) _longitud)
  (:latitud
   (&optional __latitud)
   (if __latitud (setq _latitud __latitud)) _latitud)
  (:altura
   (&optional __altura)
   (if __altura (setq _altura __altura)) _altura)
  (:hdop
   (&optional __hdop)
   (if __hdop (setq _hdop __hdop)) _hdop)
  (:velocidad
   (&optional __velocidad)
   (if __velocidad (setq _velocidad __velocidad)) _velocidad)
  (:heading_vel
   (&optional __heading_vel)
   (if __heading_vel (setq _heading_vel __heading_vel)) _heading_vel)
  (:semi_major_desv
   (&optional __semi_major_desv)
   (if __semi_major_desv (setq _semi_major_desv __semi_major_desv)) _semi_major_desv)
  (:semi_minor_desv
   (&optional __semi_minor_desv)
   (if __semi_minor_desv (setq _semi_minor_desv __semi_minor_desv)) _semi_minor_desv)
  (:semi_major_orien
   (&optional __semi_major_orien)
   (if __semi_major_orien (setq _semi_major_orien __semi_major_orien)) _semi_major_orien)
  (:calidad
   (&optional __calidad)
   (if __calidad (setq _calidad __calidad)) _calidad)
  (:nro_satelites
   (&optional __nro_satelites)
   (if __nro_satelites (setq _nro_satelites __nro_satelites)) _nro_satelites)
  (:serialization-length
   ()
   (+
    ;; int32 _timestamp_sec
    4
    ;; int32 _timestamp_nsec
    4
    ;; float64 _hora
    8
    ;; float64 _utm_este
    8
    ;; float64 _utm_norte
    8
    ;; float64 _longitud
    8
    ;; float64 _latitud
    8
    ;; float64 _altura
    8
    ;; float64 _hdop
    8
    ;; float64 _velocidad
    8
    ;; float64 _heading_vel
    8
    ;; float64 _semi_major_desv
    8
    ;; float64 _semi_minor_desv
    8
    ;; float64 _semi_major_orien
    8
    ;; int8 _calidad
    1
    ;; int8 _nro_satelites
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
     ;; float64 _hora
       (sys::poke _hora (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _utm_este
       (sys::poke _utm_este (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _utm_norte
       (sys::poke _utm_norte (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitud
       (sys::poke _longitud (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _latitud
       (sys::poke _latitud (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _altura
       (sys::poke _altura (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _hdop
       (sys::poke _hdop (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocidad
       (sys::poke _velocidad (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _heading_vel
       (sys::poke _heading_vel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _semi_major_desv
       (sys::poke _semi_major_desv (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _semi_minor_desv
       (sys::poke _semi_minor_desv (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _semi_major_orien
       (sys::poke _semi_major_orien (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _calidad
       (write-byte _calidad s)
     ;; int8 _nro_satelites
       (write-byte _nro_satelites s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _timestamp_sec
     (setq _timestamp_sec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _timestamp_nsec
     (setq _timestamp_nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _hora
     (setq _hora (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _utm_este
     (setq _utm_este (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _utm_norte
     (setq _utm_norte (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitud
     (setq _longitud (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _latitud
     (setq _latitud (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _altura
     (setq _altura (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _hdop
     (setq _hdop (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocidad
     (setq _velocidad (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _heading_vel
     (setq _heading_vel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _semi_major_desv
     (setq _semi_major_desv (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _semi_minor_desv
     (setq _semi_minor_desv (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _semi_major_orien
     (setq _semi_major_orien (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _calidad
     (setq _calidad (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _calidad 127) (setq _calidad (- _calidad 256)))
   ;; int8 _nro_satelites
     (setq _nro_satelites (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _nro_satelites 127) (setq _nro_satelites (- _nro_satelites 256)))
   ;;
   self)
  )

(setf (get lcm_to_ros::gps_data :md5sum-) "e21f09763c07512fc7b4f32331812cbc")
(setf (get lcm_to_ros::gps_data :datatype-) "lcm_to_ros/gps_data")
(setf (get lcm_to_ros::gps_data :definition-)
      "#######################################################################
# This message was automatically generated by the lcm_to_ros package
# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu
#######################################################################
#
# Source message:    .msg
# Creation:          lun 18 feb 2019 17:14:16 CET
#
#######################################################################
int32               timestamp_sec
int32               timestamp_nsec
float64             hora
float64             utm_este
float64             utm_norte
float64             longitud
float64             latitud
float64             altura
float64             hdop
float64             velocidad
float64             heading_vel
float64             semi_major_desv
float64             semi_minor_desv
float64             semi_major_orien
int8                calidad
int8                nro_satelites

")



(provide :lcm_to_ros/gps_data "e21f09763c07512fc7b4f32331812cbc")


