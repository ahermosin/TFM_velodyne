;; Auto-generated. Do not edit!


(when (boundp 'lcm_to_ros::estado_coche)
  (if (not (find-package "LCM_TO_ROS"))
    (make-package "LCM_TO_ROS"))
  (shadow 'estado_coche (find-package "LCM_TO_ROS")))
(unless (find-package "LCM_TO_ROS::ESTADO_COCHE")
  (make-package "LCM_TO_ROS::ESTADO_COCHE"))

(in-package "ROS")
;;//! \htmlinclude estado_coche.msg.html


(defclass lcm_to_ros::estado_coche
  :super ros::object
  :slots (_tiempo _calidad_gps _nro_satelites _posicion_x _posicion_y _orientacion _velocidad _aceleracion _k_posicion_x _k_posicion_y _k_orientacion _k_velocidad _k_aceleracion _angulo_volante _flag_msg_gps _flag_msg_canvel _flag_msg_canvol ))

(defmethod lcm_to_ros::estado_coche
  (:init
   (&key
    ((:tiempo __tiempo) 0.0)
    ((:calidad_gps __calidad_gps) 0)
    ((:nro_satelites __nro_satelites) 0)
    ((:posicion_x __posicion_x) 0.0)
    ((:posicion_y __posicion_y) 0.0)
    ((:orientacion __orientacion) 0.0)
    ((:velocidad __velocidad) 0.0)
    ((:aceleracion __aceleracion) 0.0)
    ((:k_posicion_x __k_posicion_x) 0.0)
    ((:k_posicion_y __k_posicion_y) 0.0)
    ((:k_orientacion __k_orientacion) 0.0)
    ((:k_velocidad __k_velocidad) 0.0)
    ((:k_aceleracion __k_aceleracion) 0.0)
    ((:angulo_volante __angulo_volante) 0.0)
    ((:flag_msg_gps __flag_msg_gps) nil)
    ((:flag_msg_canvel __flag_msg_canvel) nil)
    ((:flag_msg_canvol __flag_msg_canvol) nil)
    )
   (send-super :init)
   (setq _tiempo (float __tiempo))
   (setq _calidad_gps (round __calidad_gps))
   (setq _nro_satelites (round __nro_satelites))
   (setq _posicion_x (float __posicion_x))
   (setq _posicion_y (float __posicion_y))
   (setq _orientacion (float __orientacion))
   (setq _velocidad (float __velocidad))
   (setq _aceleracion (float __aceleracion))
   (setq _k_posicion_x (float __k_posicion_x))
   (setq _k_posicion_y (float __k_posicion_y))
   (setq _k_orientacion (float __k_orientacion))
   (setq _k_velocidad (float __k_velocidad))
   (setq _k_aceleracion (float __k_aceleracion))
   (setq _angulo_volante (float __angulo_volante))
   (setq _flag_msg_gps __flag_msg_gps)
   (setq _flag_msg_canvel __flag_msg_canvel)
   (setq _flag_msg_canvol __flag_msg_canvol)
   self)
  (:tiempo
   (&optional __tiempo)
   (if __tiempo (setq _tiempo __tiempo)) _tiempo)
  (:calidad_gps
   (&optional __calidad_gps)
   (if __calidad_gps (setq _calidad_gps __calidad_gps)) _calidad_gps)
  (:nro_satelites
   (&optional __nro_satelites)
   (if __nro_satelites (setq _nro_satelites __nro_satelites)) _nro_satelites)
  (:posicion_x
   (&optional __posicion_x)
   (if __posicion_x (setq _posicion_x __posicion_x)) _posicion_x)
  (:posicion_y
   (&optional __posicion_y)
   (if __posicion_y (setq _posicion_y __posicion_y)) _posicion_y)
  (:orientacion
   (&optional __orientacion)
   (if __orientacion (setq _orientacion __orientacion)) _orientacion)
  (:velocidad
   (&optional __velocidad)
   (if __velocidad (setq _velocidad __velocidad)) _velocidad)
  (:aceleracion
   (&optional __aceleracion)
   (if __aceleracion (setq _aceleracion __aceleracion)) _aceleracion)
  (:k_posicion_x
   (&optional __k_posicion_x)
   (if __k_posicion_x (setq _k_posicion_x __k_posicion_x)) _k_posicion_x)
  (:k_posicion_y
   (&optional __k_posicion_y)
   (if __k_posicion_y (setq _k_posicion_y __k_posicion_y)) _k_posicion_y)
  (:k_orientacion
   (&optional __k_orientacion)
   (if __k_orientacion (setq _k_orientacion __k_orientacion)) _k_orientacion)
  (:k_velocidad
   (&optional __k_velocidad)
   (if __k_velocidad (setq _k_velocidad __k_velocidad)) _k_velocidad)
  (:k_aceleracion
   (&optional __k_aceleracion)
   (if __k_aceleracion (setq _k_aceleracion __k_aceleracion)) _k_aceleracion)
  (:angulo_volante
   (&optional __angulo_volante)
   (if __angulo_volante (setq _angulo_volante __angulo_volante)) _angulo_volante)
  (:flag_msg_gps
   (&optional __flag_msg_gps)
   (if __flag_msg_gps (setq _flag_msg_gps __flag_msg_gps)) _flag_msg_gps)
  (:flag_msg_canvel
   (&optional __flag_msg_canvel)
   (if __flag_msg_canvel (setq _flag_msg_canvel __flag_msg_canvel)) _flag_msg_canvel)
  (:flag_msg_canvol
   (&optional __flag_msg_canvol)
   (if __flag_msg_canvol (setq _flag_msg_canvol __flag_msg_canvol)) _flag_msg_canvol)
  (:serialization-length
   ()
   (+
    ;; float64 _tiempo
    8
    ;; int8 _calidad_gps
    1
    ;; int8 _nro_satelites
    1
    ;; float64 _posicion_x
    8
    ;; float64 _posicion_y
    8
    ;; float64 _orientacion
    8
    ;; float64 _velocidad
    8
    ;; float64 _aceleracion
    8
    ;; float64 _k_posicion_x
    8
    ;; float64 _k_posicion_y
    8
    ;; float64 _k_orientacion
    8
    ;; float64 _k_velocidad
    8
    ;; float64 _k_aceleracion
    8
    ;; float64 _angulo_volante
    8
    ;; bool _flag_msg_gps
    1
    ;; bool _flag_msg_canvel
    1
    ;; bool _flag_msg_canvol
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _tiempo
       (sys::poke _tiempo (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _calidad_gps
       (write-byte _calidad_gps s)
     ;; int8 _nro_satelites
       (write-byte _nro_satelites s)
     ;; float64 _posicion_x
       (sys::poke _posicion_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _posicion_y
       (sys::poke _posicion_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _orientacion
       (sys::poke _orientacion (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocidad
       (sys::poke _velocidad (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _aceleracion
       (sys::poke _aceleracion (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_posicion_x
       (sys::poke _k_posicion_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_posicion_y
       (sys::poke _k_posicion_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_orientacion
       (sys::poke _k_orientacion (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_velocidad
       (sys::poke _k_velocidad (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_aceleracion
       (sys::poke _k_aceleracion (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angulo_volante
       (sys::poke _angulo_volante (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _flag_msg_gps
       (if _flag_msg_gps (write-byte -1 s) (write-byte 0 s))
     ;; bool _flag_msg_canvel
       (if _flag_msg_canvel (write-byte -1 s) (write-byte 0 s))
     ;; bool _flag_msg_canvol
       (if _flag_msg_canvol (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _tiempo
     (setq _tiempo (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _calidad_gps
     (setq _calidad_gps (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _calidad_gps 127) (setq _calidad_gps (- _calidad_gps 256)))
   ;; int8 _nro_satelites
     (setq _nro_satelites (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _nro_satelites 127) (setq _nro_satelites (- _nro_satelites 256)))
   ;; float64 _posicion_x
     (setq _posicion_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _posicion_y
     (setq _posicion_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _orientacion
     (setq _orientacion (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocidad
     (setq _velocidad (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _aceleracion
     (setq _aceleracion (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_posicion_x
     (setq _k_posicion_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_posicion_y
     (setq _k_posicion_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_orientacion
     (setq _k_orientacion (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_velocidad
     (setq _k_velocidad (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_aceleracion
     (setq _k_aceleracion (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angulo_volante
     (setq _angulo_volante (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _flag_msg_gps
     (setq _flag_msg_gps (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _flag_msg_canvel
     (setq _flag_msg_canvel (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _flag_msg_canvol
     (setq _flag_msg_canvol (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get lcm_to_ros::estado_coche :md5sum-) "1daf5d53595ad9bd5965114c8d8312ce")
(setf (get lcm_to_ros::estado_coche :datatype-) "lcm_to_ros/estado_coche")
(setf (get lcm_to_ros::estado_coche :definition-)
      "#######################################################################
# This message was automatically generated by the lcm_to_ros package
# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu
#######################################################################
#
# Source message:    .msg
# Creation:          lun 18 feb 2019 17:14:16 CET
#
#######################################################################
float64             tiempo
int8                calidad_gps
int8                nro_satelites
float64             posicion_x
float64             posicion_y
float64             orientacion
float64             velocidad
float64             aceleracion
float64             k_posicion_x
float64             k_posicion_y
float64             k_orientacion
float64             k_velocidad
float64             k_aceleracion
float64             angulo_volante
bool                flag_msg_gps
bool                flag_msg_canvel
bool                flag_msg_canvol

")



(provide :lcm_to_ros/estado_coche "1daf5d53595ad9bd5965114c8d8312ce")


