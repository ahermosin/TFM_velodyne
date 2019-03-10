;; Auto-generated. Do not edit!


(when (boundp 'lcm_to_ros::ibeo_objeto)
  (if (not (find-package "LCM_TO_ROS"))
    (make-package "LCM_TO_ROS"))
  (shadow 'ibeo_objeto (find-package "LCM_TO_ROS")))
(unless (find-package "LCM_TO_ROS::IBEO_OBJETO")
  (make-package "LCM_TO_ROS::IBEO_OBJETO"))

(in-package "ROS")
;;//! \htmlinclude ibeo_objeto.msg.html


(defclass lcm_to_ros::ibeo_objeto
  :super ros::object
  :slots (_id _age _velocidad_relativa_x _velocidad_relativa_y _velocidad_absoluta_x _velocidad_absoluta_y _velocidad_absoluta_sigma_x _velocidad_absoluta_sigma_y _bounding_box_centro_x _bounding_box_centro_y _bounding_box_largo _bounding_box_ancho _object_box_centro_x _object_box_centro_y _object_box_orientacion _object_box_size_x _object_box_size_y _clasificacion _clasificacion_age _clasificacion_certeza _punto_cercano_x _punto_cercano_y _punto_referencia_x _punto_referencia_y _punto_referencia_sigma_x _punto_referencia_sigma_y ))

(defmethod lcm_to_ros::ibeo_objeto
  (:init
   (&key
    ((:id __id) 0)
    ((:age __age) 0.0)
    ((:velocidad_relativa_x __velocidad_relativa_x) 0.0)
    ((:velocidad_relativa_y __velocidad_relativa_y) 0.0)
    ((:velocidad_absoluta_x __velocidad_absoluta_x) 0.0)
    ((:velocidad_absoluta_y __velocidad_absoluta_y) 0.0)
    ((:velocidad_absoluta_sigma_x __velocidad_absoluta_sigma_x) 0.0)
    ((:velocidad_absoluta_sigma_y __velocidad_absoluta_sigma_y) 0.0)
    ((:bounding_box_centro_x __bounding_box_centro_x) 0.0)
    ((:bounding_box_centro_y __bounding_box_centro_y) 0.0)
    ((:bounding_box_largo __bounding_box_largo) 0.0)
    ((:bounding_box_ancho __bounding_box_ancho) 0.0)
    ((:object_box_centro_x __object_box_centro_x) 0.0)
    ((:object_box_centro_y __object_box_centro_y) 0.0)
    ((:object_box_orientacion __object_box_orientacion) 0.0)
    ((:object_box_size_x __object_box_size_x) 0.0)
    ((:object_box_size_y __object_box_size_y) 0.0)
    ((:clasificacion __clasificacion) 0)
    ((:clasificacion_age __clasificacion_age) 0.0)
    ((:clasificacion_certeza __clasificacion_certeza) 0.0)
    ((:punto_cercano_x __punto_cercano_x) 0.0)
    ((:punto_cercano_y __punto_cercano_y) 0.0)
    ((:punto_referencia_x __punto_referencia_x) 0.0)
    ((:punto_referencia_y __punto_referencia_y) 0.0)
    ((:punto_referencia_sigma_x __punto_referencia_sigma_x) 0.0)
    ((:punto_referencia_sigma_y __punto_referencia_sigma_y) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _age (float __age))
   (setq _velocidad_relativa_x (float __velocidad_relativa_x))
   (setq _velocidad_relativa_y (float __velocidad_relativa_y))
   (setq _velocidad_absoluta_x (float __velocidad_absoluta_x))
   (setq _velocidad_absoluta_y (float __velocidad_absoluta_y))
   (setq _velocidad_absoluta_sigma_x (float __velocidad_absoluta_sigma_x))
   (setq _velocidad_absoluta_sigma_y (float __velocidad_absoluta_sigma_y))
   (setq _bounding_box_centro_x (float __bounding_box_centro_x))
   (setq _bounding_box_centro_y (float __bounding_box_centro_y))
   (setq _bounding_box_largo (float __bounding_box_largo))
   (setq _bounding_box_ancho (float __bounding_box_ancho))
   (setq _object_box_centro_x (float __object_box_centro_x))
   (setq _object_box_centro_y (float __object_box_centro_y))
   (setq _object_box_orientacion (float __object_box_orientacion))
   (setq _object_box_size_x (float __object_box_size_x))
   (setq _object_box_size_y (float __object_box_size_y))
   (setq _clasificacion (round __clasificacion))
   (setq _clasificacion_age (float __clasificacion_age))
   (setq _clasificacion_certeza (float __clasificacion_certeza))
   (setq _punto_cercano_x (float __punto_cercano_x))
   (setq _punto_cercano_y (float __punto_cercano_y))
   (setq _punto_referencia_x (float __punto_referencia_x))
   (setq _punto_referencia_y (float __punto_referencia_y))
   (setq _punto_referencia_sigma_x (float __punto_referencia_sigma_x))
   (setq _punto_referencia_sigma_y (float __punto_referencia_sigma_y))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:velocidad_relativa_x
   (&optional __velocidad_relativa_x)
   (if __velocidad_relativa_x (setq _velocidad_relativa_x __velocidad_relativa_x)) _velocidad_relativa_x)
  (:velocidad_relativa_y
   (&optional __velocidad_relativa_y)
   (if __velocidad_relativa_y (setq _velocidad_relativa_y __velocidad_relativa_y)) _velocidad_relativa_y)
  (:velocidad_absoluta_x
   (&optional __velocidad_absoluta_x)
   (if __velocidad_absoluta_x (setq _velocidad_absoluta_x __velocidad_absoluta_x)) _velocidad_absoluta_x)
  (:velocidad_absoluta_y
   (&optional __velocidad_absoluta_y)
   (if __velocidad_absoluta_y (setq _velocidad_absoluta_y __velocidad_absoluta_y)) _velocidad_absoluta_y)
  (:velocidad_absoluta_sigma_x
   (&optional __velocidad_absoluta_sigma_x)
   (if __velocidad_absoluta_sigma_x (setq _velocidad_absoluta_sigma_x __velocidad_absoluta_sigma_x)) _velocidad_absoluta_sigma_x)
  (:velocidad_absoluta_sigma_y
   (&optional __velocidad_absoluta_sigma_y)
   (if __velocidad_absoluta_sigma_y (setq _velocidad_absoluta_sigma_y __velocidad_absoluta_sigma_y)) _velocidad_absoluta_sigma_y)
  (:bounding_box_centro_x
   (&optional __bounding_box_centro_x)
   (if __bounding_box_centro_x (setq _bounding_box_centro_x __bounding_box_centro_x)) _bounding_box_centro_x)
  (:bounding_box_centro_y
   (&optional __bounding_box_centro_y)
   (if __bounding_box_centro_y (setq _bounding_box_centro_y __bounding_box_centro_y)) _bounding_box_centro_y)
  (:bounding_box_largo
   (&optional __bounding_box_largo)
   (if __bounding_box_largo (setq _bounding_box_largo __bounding_box_largo)) _bounding_box_largo)
  (:bounding_box_ancho
   (&optional __bounding_box_ancho)
   (if __bounding_box_ancho (setq _bounding_box_ancho __bounding_box_ancho)) _bounding_box_ancho)
  (:object_box_centro_x
   (&optional __object_box_centro_x)
   (if __object_box_centro_x (setq _object_box_centro_x __object_box_centro_x)) _object_box_centro_x)
  (:object_box_centro_y
   (&optional __object_box_centro_y)
   (if __object_box_centro_y (setq _object_box_centro_y __object_box_centro_y)) _object_box_centro_y)
  (:object_box_orientacion
   (&optional __object_box_orientacion)
   (if __object_box_orientacion (setq _object_box_orientacion __object_box_orientacion)) _object_box_orientacion)
  (:object_box_size_x
   (&optional __object_box_size_x)
   (if __object_box_size_x (setq _object_box_size_x __object_box_size_x)) _object_box_size_x)
  (:object_box_size_y
   (&optional __object_box_size_y)
   (if __object_box_size_y (setq _object_box_size_y __object_box_size_y)) _object_box_size_y)
  (:clasificacion
   (&optional __clasificacion)
   (if __clasificacion (setq _clasificacion __clasificacion)) _clasificacion)
  (:clasificacion_age
   (&optional __clasificacion_age)
   (if __clasificacion_age (setq _clasificacion_age __clasificacion_age)) _clasificacion_age)
  (:clasificacion_certeza
   (&optional __clasificacion_certeza)
   (if __clasificacion_certeza (setq _clasificacion_certeza __clasificacion_certeza)) _clasificacion_certeza)
  (:punto_cercano_x
   (&optional __punto_cercano_x)
   (if __punto_cercano_x (setq _punto_cercano_x __punto_cercano_x)) _punto_cercano_x)
  (:punto_cercano_y
   (&optional __punto_cercano_y)
   (if __punto_cercano_y (setq _punto_cercano_y __punto_cercano_y)) _punto_cercano_y)
  (:punto_referencia_x
   (&optional __punto_referencia_x)
   (if __punto_referencia_x (setq _punto_referencia_x __punto_referencia_x)) _punto_referencia_x)
  (:punto_referencia_y
   (&optional __punto_referencia_y)
   (if __punto_referencia_y (setq _punto_referencia_y __punto_referencia_y)) _punto_referencia_y)
  (:punto_referencia_sigma_x
   (&optional __punto_referencia_sigma_x)
   (if __punto_referencia_sigma_x (setq _punto_referencia_sigma_x __punto_referencia_sigma_x)) _punto_referencia_sigma_x)
  (:punto_referencia_sigma_y
   (&optional __punto_referencia_sigma_y)
   (if __punto_referencia_sigma_y (setq _punto_referencia_sigma_y __punto_referencia_sigma_y)) _punto_referencia_sigma_y)
  (:serialization-length
   ()
   (+
    ;; int16 _id
    2
    ;; float32 _age
    4
    ;; float32 _velocidad_relativa_x
    4
    ;; float32 _velocidad_relativa_y
    4
    ;; float32 _velocidad_absoluta_x
    4
    ;; float32 _velocidad_absoluta_y
    4
    ;; float32 _velocidad_absoluta_sigma_x
    4
    ;; float32 _velocidad_absoluta_sigma_y
    4
    ;; float32 _bounding_box_centro_x
    4
    ;; float32 _bounding_box_centro_y
    4
    ;; float32 _bounding_box_largo
    4
    ;; float32 _bounding_box_ancho
    4
    ;; float32 _object_box_centro_x
    4
    ;; float32 _object_box_centro_y
    4
    ;; float32 _object_box_orientacion
    4
    ;; float32 _object_box_size_x
    4
    ;; float32 _object_box_size_y
    4
    ;; int16 _clasificacion
    2
    ;; float32 _clasificacion_age
    4
    ;; float32 _clasificacion_certeza
    4
    ;; float32 _punto_cercano_x
    4
    ;; float32 _punto_cercano_y
    4
    ;; float32 _punto_referencia_x
    4
    ;; float32 _punto_referencia_y
    4
    ;; float32 _punto_referencia_sigma_x
    4
    ;; float32 _punto_referencia_sigma_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _id
       (write-word _id s)
     ;; float32 _age
       (sys::poke _age (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocidad_relativa_x
       (sys::poke _velocidad_relativa_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocidad_relativa_y
       (sys::poke _velocidad_relativa_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocidad_absoluta_x
       (sys::poke _velocidad_absoluta_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocidad_absoluta_y
       (sys::poke _velocidad_absoluta_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocidad_absoluta_sigma_x
       (sys::poke _velocidad_absoluta_sigma_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocidad_absoluta_sigma_y
       (sys::poke _velocidad_absoluta_sigma_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bounding_box_centro_x
       (sys::poke _bounding_box_centro_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bounding_box_centro_y
       (sys::poke _bounding_box_centro_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bounding_box_largo
       (sys::poke _bounding_box_largo (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bounding_box_ancho
       (sys::poke _bounding_box_ancho (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _object_box_centro_x
       (sys::poke _object_box_centro_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _object_box_centro_y
       (sys::poke _object_box_centro_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _object_box_orientacion
       (sys::poke _object_box_orientacion (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _object_box_size_x
       (sys::poke _object_box_size_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _object_box_size_y
       (sys::poke _object_box_size_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16 _clasificacion
       (write-word _clasificacion s)
     ;; float32 _clasificacion_age
       (sys::poke _clasificacion_age (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _clasificacion_certeza
       (sys::poke _clasificacion_certeza (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _punto_cercano_x
       (sys::poke _punto_cercano_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _punto_cercano_y
       (sys::poke _punto_cercano_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _punto_referencia_x
       (sys::poke _punto_referencia_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _punto_referencia_y
       (sys::poke _punto_referencia_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _punto_referencia_sigma_x
       (sys::poke _punto_referencia_sigma_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _punto_referencia_sigma_y
       (sys::poke _punto_referencia_sigma_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _age
     (setq _age (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocidad_relativa_x
     (setq _velocidad_relativa_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocidad_relativa_y
     (setq _velocidad_relativa_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocidad_absoluta_x
     (setq _velocidad_absoluta_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocidad_absoluta_y
     (setq _velocidad_absoluta_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocidad_absoluta_sigma_x
     (setq _velocidad_absoluta_sigma_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocidad_absoluta_sigma_y
     (setq _velocidad_absoluta_sigma_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bounding_box_centro_x
     (setq _bounding_box_centro_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bounding_box_centro_y
     (setq _bounding_box_centro_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bounding_box_largo
     (setq _bounding_box_largo (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bounding_box_ancho
     (setq _bounding_box_ancho (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _object_box_centro_x
     (setq _object_box_centro_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _object_box_centro_y
     (setq _object_box_centro_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _object_box_orientacion
     (setq _object_box_orientacion (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _object_box_size_x
     (setq _object_box_size_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _object_box_size_y
     (setq _object_box_size_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16 _clasificacion
     (setq _clasificacion (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _clasificacion_age
     (setq _clasificacion_age (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _clasificacion_certeza
     (setq _clasificacion_certeza (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _punto_cercano_x
     (setq _punto_cercano_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _punto_cercano_y
     (setq _punto_cercano_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _punto_referencia_x
     (setq _punto_referencia_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _punto_referencia_y
     (setq _punto_referencia_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _punto_referencia_sigma_x
     (setq _punto_referencia_sigma_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _punto_referencia_sigma_y
     (setq _punto_referencia_sigma_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get lcm_to_ros::ibeo_objeto :md5sum-) "f05d4f8d7f4f7ef27109cc9e3a63af19")
(setf (get lcm_to_ros::ibeo_objeto :datatype-) "lcm_to_ros/ibeo_objeto")
(setf (get lcm_to_ros::ibeo_objeto :definition-)
      "#######################################################################
# This message was automatically generated by the lcm_to_ros package
# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu
#######################################################################
#
# Source message:    .msg
# Creation:          lun 18 feb 2019 17:14:16 CET
#
#######################################################################
int16               id
float32             age
float32             velocidad_relativa_x
float32             velocidad_relativa_y
float32             velocidad_absoluta_x
float32             velocidad_absoluta_y
float32             velocidad_absoluta_sigma_x
float32             velocidad_absoluta_sigma_y
float32             bounding_box_centro_x
float32             bounding_box_centro_y
float32             bounding_box_largo
float32             bounding_box_ancho
float32             object_box_centro_x
float32             object_box_centro_y
float32             object_box_orientacion
float32             object_box_size_x
float32             object_box_size_y
int16               clasificacion
float32             clasificacion_age
float32             clasificacion_certeza
float32             punto_cercano_x
float32             punto_cercano_y
float32             punto_referencia_x
float32             punto_referencia_y
float32             punto_referencia_sigma_x
float32             punto_referencia_sigma_y

")



(provide :lcm_to_ros/ibeo_objeto "f05d4f8d7f4f7ef27109cc9e3a63af19")


