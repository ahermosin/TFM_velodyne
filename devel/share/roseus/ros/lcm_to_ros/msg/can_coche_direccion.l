;; Auto-generated. Do not edit!


(when (boundp 'lcm_to_ros::can_coche_direccion)
  (if (not (find-package "LCM_TO_ROS"))
    (make-package "LCM_TO_ROS"))
  (shadow 'can_coche_direccion (find-package "LCM_TO_ROS")))
(unless (find-package "LCM_TO_ROS::CAN_COCHE_DIRECCION")
  (make-package "LCM_TO_ROS::CAN_COCHE_DIRECCION"))

(in-package "ROS")
;;//! \htmlinclude can_coche_direccion.msg.html


(defclass lcm_to_ros::can_coche_direccion
  :super ros::object
  :slots (_timestamp_sec _timestamp_nsec _angulo_volante _velocidad_volante _angulo_columna _velocidad_columna _par_direccion _flag_mensajes ))

(defmethod lcm_to_ros::can_coche_direccion
  (:init
   (&key
    ((:timestamp_sec __timestamp_sec) 0)
    ((:timestamp_nsec __timestamp_nsec) 0)
    ((:angulo_volante __angulo_volante) 0.0)
    ((:velocidad_volante __velocidad_volante) 0.0)
    ((:angulo_columna __angulo_columna) 0.0)
    ((:velocidad_columna __velocidad_columna) 0.0)
    ((:par_direccion __par_direccion) 0.0)
    ((:flag_mensajes __flag_mensajes) 0)
    )
   (send-super :init)
   (setq _timestamp_sec (round __timestamp_sec))
   (setq _timestamp_nsec (round __timestamp_nsec))
   (setq _angulo_volante (float __angulo_volante))
   (setq _velocidad_volante (float __velocidad_volante))
   (setq _angulo_columna (float __angulo_columna))
   (setq _velocidad_columna (float __velocidad_columna))
   (setq _par_direccion (float __par_direccion))
   (setq _flag_mensajes (round __flag_mensajes))
   self)
  (:timestamp_sec
   (&optional __timestamp_sec)
   (if __timestamp_sec (setq _timestamp_sec __timestamp_sec)) _timestamp_sec)
  (:timestamp_nsec
   (&optional __timestamp_nsec)
   (if __timestamp_nsec (setq _timestamp_nsec __timestamp_nsec)) _timestamp_nsec)
  (:angulo_volante
   (&optional __angulo_volante)
   (if __angulo_volante (setq _angulo_volante __angulo_volante)) _angulo_volante)
  (:velocidad_volante
   (&optional __velocidad_volante)
   (if __velocidad_volante (setq _velocidad_volante __velocidad_volante)) _velocidad_volante)
  (:angulo_columna
   (&optional __angulo_columna)
   (if __angulo_columna (setq _angulo_columna __angulo_columna)) _angulo_columna)
  (:velocidad_columna
   (&optional __velocidad_columna)
   (if __velocidad_columna (setq _velocidad_columna __velocidad_columna)) _velocidad_columna)
  (:par_direccion
   (&optional __par_direccion)
   (if __par_direccion (setq _par_direccion __par_direccion)) _par_direccion)
  (:flag_mensajes
   (&optional __flag_mensajes)
   (if __flag_mensajes (setq _flag_mensajes __flag_mensajes)) _flag_mensajes)
  (:serialization-length
   ()
   (+
    ;; int32 _timestamp_sec
    4
    ;; int32 _timestamp_nsec
    4
    ;; float64 _angulo_volante
    8
    ;; float64 _velocidad_volante
    8
    ;; float64 _angulo_columna
    8
    ;; float64 _velocidad_columna
    8
    ;; float64 _par_direccion
    8
    ;; byte _flag_mensajes
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
     ;; float64 _angulo_volante
       (sys::poke _angulo_volante (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocidad_volante
       (sys::poke _velocidad_volante (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angulo_columna
       (sys::poke _angulo_columna (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocidad_columna
       (sys::poke _velocidad_columna (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _par_direccion
       (sys::poke _par_direccion (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; byte _flag_mensajes
       (write-byte _flag_mensajes s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _timestamp_sec
     (setq _timestamp_sec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _timestamp_nsec
     (setq _timestamp_nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _angulo_volante
     (setq _angulo_volante (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocidad_volante
     (setq _velocidad_volante (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angulo_columna
     (setq _angulo_columna (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocidad_columna
     (setq _velocidad_columna (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _par_direccion
     (setq _par_direccion (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; byte _flag_mensajes
     (setq _flag_mensajes (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _flag_mensajes 127) (setq _flag_mensajes (- _flag_mensajes 256)))
   ;;
   self)
  )

(setf (get lcm_to_ros::can_coche_direccion :md5sum-) "2a77a418fbb4092f983b505954b450fd")
(setf (get lcm_to_ros::can_coche_direccion :datatype-) "lcm_to_ros/can_coche_direccion")
(setf (get lcm_to_ros::can_coche_direccion :definition-)
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
float64             angulo_volante
float64             velocidad_volante
float64             angulo_columna
float64             velocidad_columna
float64             par_direccion
byte                flag_mensajes

")



(provide :lcm_to_ros/can_coche_direccion "2a77a418fbb4092f983b505954b450fd")


