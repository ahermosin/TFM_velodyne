;; Auto-generated. Do not edit!


(when (boundp 'lcm_to_ros::estado_coche_LL)
  (if (not (find-package "LCM_TO_ROS"))
    (make-package "LCM_TO_ROS"))
  (shadow 'estado_coche_LL (find-package "LCM_TO_ROS")))
(unless (find-package "LCM_TO_ROS::ESTADO_COCHE_LL")
  (make-package "LCM_TO_ROS::ESTADO_COCHE_LL"))

(in-package "ROS")
;;//! \htmlinclude estado_coche_LL.msg.html


(defclass lcm_to_ros::estado_coche_LL
  :super ros::object
  :slots (_tiempo _calidad_gps _nro_satelites _UTM_x _UTM_y _orientacion _velocidad _aceleracion _k_UTM_x _k_UTM_y _k_longitud _k_latitud _k_orientacion _k_velocidad _k_aceleracion _angulo_volante _flag_msg_gps _flag_msg_canvel _flag_msg_canvol ))

(defmethod lcm_to_ros::estado_coche_LL
  (:init
   (&key
    ((:tiempo __tiempo) 0.0)
    ((:calidad_gps __calidad_gps) 0)
    ((:nro_satelites __nro_satelites) 0)
    ((:UTM_x __UTM_x) 0.0)
    ((:UTM_y __UTM_y) 0.0)
    ((:orientacion __orientacion) 0.0)
    ((:velocidad __velocidad) 0.0)
    ((:aceleracion __aceleracion) 0.0)
    ((:k_UTM_x __k_UTM_x) 0.0)
    ((:k_UTM_y __k_UTM_y) 0.0)
    ((:k_longitud __k_longitud) 0.0)
    ((:k_latitud __k_latitud) 0.0)
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
   (setq _UTM_x (float __UTM_x))
   (setq _UTM_y (float __UTM_y))
   (setq _orientacion (float __orientacion))
   (setq _velocidad (float __velocidad))
   (setq _aceleracion (float __aceleracion))
   (setq _k_UTM_x (float __k_UTM_x))
   (setq _k_UTM_y (float __k_UTM_y))
   (setq _k_longitud (float __k_longitud))
   (setq _k_latitud (float __k_latitud))
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
  (:UTM_x
   (&optional __UTM_x)
   (if __UTM_x (setq _UTM_x __UTM_x)) _UTM_x)
  (:UTM_y
   (&optional __UTM_y)
   (if __UTM_y (setq _UTM_y __UTM_y)) _UTM_y)
  (:orientacion
   (&optional __orientacion)
   (if __orientacion (setq _orientacion __orientacion)) _orientacion)
  (:velocidad
   (&optional __velocidad)
   (if __velocidad (setq _velocidad __velocidad)) _velocidad)
  (:aceleracion
   (&optional __aceleracion)
   (if __aceleracion (setq _aceleracion __aceleracion)) _aceleracion)
  (:k_UTM_x
   (&optional __k_UTM_x)
   (if __k_UTM_x (setq _k_UTM_x __k_UTM_x)) _k_UTM_x)
  (:k_UTM_y
   (&optional __k_UTM_y)
   (if __k_UTM_y (setq _k_UTM_y __k_UTM_y)) _k_UTM_y)
  (:k_longitud
   (&optional __k_longitud)
   (if __k_longitud (setq _k_longitud __k_longitud)) _k_longitud)
  (:k_latitud
   (&optional __k_latitud)
   (if __k_latitud (setq _k_latitud __k_latitud)) _k_latitud)
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
    ;; float64 _UTM_x
    8
    ;; float64 _UTM_y
    8
    ;; float64 _orientacion
    8
    ;; float64 _velocidad
    8
    ;; float64 _aceleracion
    8
    ;; float64 _k_UTM_x
    8
    ;; float64 _k_UTM_y
    8
    ;; float64 _k_longitud
    8
    ;; float64 _k_latitud
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
     ;; float64 _UTM_x
       (sys::poke _UTM_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _UTM_y
       (sys::poke _UTM_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _orientacion
       (sys::poke _orientacion (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocidad
       (sys::poke _velocidad (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _aceleracion
       (sys::poke _aceleracion (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_UTM_x
       (sys::poke _k_UTM_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_UTM_y
       (sys::poke _k_UTM_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_longitud
       (sys::poke _k_longitud (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_latitud
       (sys::poke _k_latitud (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _UTM_x
     (setq _UTM_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _UTM_y
     (setq _UTM_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _orientacion
     (setq _orientacion (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocidad
     (setq _velocidad (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _aceleracion
     (setq _aceleracion (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_UTM_x
     (setq _k_UTM_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_UTM_y
     (setq _k_UTM_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_longitud
     (setq _k_longitud (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_latitud
     (setq _k_latitud (sys::peek buf ptr- :double)) (incf ptr- 8)
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

(setf (get lcm_to_ros::estado_coche_LL :md5sum-) "e7c25e06970f89ceb6cf213885e085a4")
(setf (get lcm_to_ros::estado_coche_LL :datatype-) "lcm_to_ros/estado_coche_LL")
(setf (get lcm_to_ros::estado_coche_LL :definition-)
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
float64             UTM_x
float64             UTM_y
float64             orientacion
float64             velocidad
float64             aceleracion
float64             k_UTM_x
float64             k_UTM_y
float64             k_longitud
float64             k_latitud
float64             k_orientacion
float64             k_velocidad
float64             k_aceleracion
float64             angulo_volante
bool                flag_msg_gps
bool                flag_msg_canvel
bool                flag_msg_canvol

")



(provide :lcm_to_ros/estado_coche_LL "e7c25e06970f89ceb6cf213885e085a4")


