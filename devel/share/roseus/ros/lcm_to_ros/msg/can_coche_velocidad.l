;; Auto-generated. Do not edit!


(when (boundp 'lcm_to_ros::can_coche_velocidad)
  (if (not (find-package "LCM_TO_ROS"))
    (make-package "LCM_TO_ROS"))
  (shadow 'can_coche_velocidad (find-package "LCM_TO_ROS")))
(unless (find-package "LCM_TO_ROS::CAN_COCHE_VELOCIDAD")
  (make-package "LCM_TO_ROS::CAN_COCHE_VELOCIDAD"))

(in-package "ROS")
;;//! \htmlinclude can_coche_velocidad.msg.html


(defclass lcm_to_ros::can_coche_velocidad
  :super ros::object
  :slots (_timestamp_sec _timestamp_nsec _velocidad _aceleracion _velocidad_ruedas_delanteras _velocidad_trasera_izquierda _velocidad_trasera_derecha ))

(defmethod lcm_to_ros::can_coche_velocidad
  (:init
   (&key
    ((:timestamp_sec __timestamp_sec) 0)
    ((:timestamp_nsec __timestamp_nsec) 0)
    ((:velocidad __velocidad) 0.0)
    ((:aceleracion __aceleracion) 0.0)
    ((:velocidad_ruedas_delanteras __velocidad_ruedas_delanteras) 0.0)
    ((:velocidad_trasera_izquierda __velocidad_trasera_izquierda) 0.0)
    ((:velocidad_trasera_derecha __velocidad_trasera_derecha) 0.0)
    )
   (send-super :init)
   (setq _timestamp_sec (round __timestamp_sec))
   (setq _timestamp_nsec (round __timestamp_nsec))
   (setq _velocidad (float __velocidad))
   (setq _aceleracion (float __aceleracion))
   (setq _velocidad_ruedas_delanteras (float __velocidad_ruedas_delanteras))
   (setq _velocidad_trasera_izquierda (float __velocidad_trasera_izquierda))
   (setq _velocidad_trasera_derecha (float __velocidad_trasera_derecha))
   self)
  (:timestamp_sec
   (&optional __timestamp_sec)
   (if __timestamp_sec (setq _timestamp_sec __timestamp_sec)) _timestamp_sec)
  (:timestamp_nsec
   (&optional __timestamp_nsec)
   (if __timestamp_nsec (setq _timestamp_nsec __timestamp_nsec)) _timestamp_nsec)
  (:velocidad
   (&optional __velocidad)
   (if __velocidad (setq _velocidad __velocidad)) _velocidad)
  (:aceleracion
   (&optional __aceleracion)
   (if __aceleracion (setq _aceleracion __aceleracion)) _aceleracion)
  (:velocidad_ruedas_delanteras
   (&optional __velocidad_ruedas_delanteras)
   (if __velocidad_ruedas_delanteras (setq _velocidad_ruedas_delanteras __velocidad_ruedas_delanteras)) _velocidad_ruedas_delanteras)
  (:velocidad_trasera_izquierda
   (&optional __velocidad_trasera_izquierda)
   (if __velocidad_trasera_izquierda (setq _velocidad_trasera_izquierda __velocidad_trasera_izquierda)) _velocidad_trasera_izquierda)
  (:velocidad_trasera_derecha
   (&optional __velocidad_trasera_derecha)
   (if __velocidad_trasera_derecha (setq _velocidad_trasera_derecha __velocidad_trasera_derecha)) _velocidad_trasera_derecha)
  (:serialization-length
   ()
   (+
    ;; int32 _timestamp_sec
    4
    ;; int32 _timestamp_nsec
    4
    ;; float64 _velocidad
    8
    ;; float64 _aceleracion
    8
    ;; float64 _velocidad_ruedas_delanteras
    8
    ;; float64 _velocidad_trasera_izquierda
    8
    ;; float64 _velocidad_trasera_derecha
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _timestamp_sec
       (write-long _timestamp_sec s)
     ;; int32 _timestamp_nsec
       (write-long _timestamp_nsec s)
     ;; float64 _velocidad
       (sys::poke _velocidad (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _aceleracion
       (sys::poke _aceleracion (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocidad_ruedas_delanteras
       (sys::poke _velocidad_ruedas_delanteras (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocidad_trasera_izquierda
       (sys::poke _velocidad_trasera_izquierda (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocidad_trasera_derecha
       (sys::poke _velocidad_trasera_derecha (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _timestamp_sec
     (setq _timestamp_sec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _timestamp_nsec
     (setq _timestamp_nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _velocidad
     (setq _velocidad (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _aceleracion
     (setq _aceleracion (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocidad_ruedas_delanteras
     (setq _velocidad_ruedas_delanteras (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocidad_trasera_izquierda
     (setq _velocidad_trasera_izquierda (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocidad_trasera_derecha
     (setq _velocidad_trasera_derecha (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get lcm_to_ros::can_coche_velocidad :md5sum-) "b0b5e19e1c76075e25f358480988c020")
(setf (get lcm_to_ros::can_coche_velocidad :datatype-) "lcm_to_ros/can_coche_velocidad")
(setf (get lcm_to_ros::can_coche_velocidad :definition-)
      "#######################################################################
# This message was automatically generated by the lcm_to_ros package
# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu
#######################################################################
#
# Source message:    .msg
# Creation:          lun 18 feb 2019 17:14:15 CET
#
#######################################################################
int32               timestamp_sec
int32               timestamp_nsec
float64             velocidad
float64             aceleracion
float64             velocidad_ruedas_delanteras
float64             velocidad_trasera_izquierda
float64             velocidad_trasera_derecha

")



(provide :lcm_to_ros/can_coche_velocidad "b0b5e19e1c76075e25f358480988c020")


