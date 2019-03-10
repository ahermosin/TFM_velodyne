;; Auto-generated. Do not edit!


(when (boundp 'lcm_to_ros::mobileye_obstaculo)
  (if (not (find-package "LCM_TO_ROS"))
    (make-package "LCM_TO_ROS"))
  (shadow 'mobileye_obstaculo (find-package "LCM_TO_ROS")))
(unless (find-package "LCM_TO_ROS::MOBILEYE_OBSTACULO")
  (make-package "LCM_TO_ROS::MOBILEYE_OBSTACULO"))

(in-package "ROS")
;;//! \htmlinclude mobileye_obstaculo.msg.html


(defclass lcm_to_ros::mobileye_obstaculo
  :super ros::object
  :slots (_timestamp_sec _timestamp_nsec _posicionX _posicionY _velocidadRel _aceleracionX _longitud _ancho _angulo _angleRate _scaleChange _edad _id _tipo _status _carril _flags _intermitentes _cutInOut ))

(defmethod lcm_to_ros::mobileye_obstaculo
  (:init
   (&key
    ((:timestamp_sec __timestamp_sec) 0)
    ((:timestamp_nsec __timestamp_nsec) 0)
    ((:posicionX __posicionX) 0.0)
    ((:posicionY __posicionY) 0.0)
    ((:velocidadRel __velocidadRel) 0.0)
    ((:aceleracionX __aceleracionX) 0.0)
    ((:longitud __longitud) 0.0)
    ((:ancho __ancho) 0.0)
    ((:angulo __angulo) 0.0)
    ((:angleRate __angleRate) 0.0)
    ((:scaleChange __scaleChange) 0.0)
    ((:edad __edad) 0)
    ((:id __id) 0)
    ((:tipo __tipo) 0)
    ((:status __status) 0)
    ((:carril __carril) 0)
    ((:flags __flags) 0)
    ((:intermitentes __intermitentes) 0)
    ((:cutInOut __cutInOut) 0)
    )
   (send-super :init)
   (setq _timestamp_sec (round __timestamp_sec))
   (setq _timestamp_nsec (round __timestamp_nsec))
   (setq _posicionX (float __posicionX))
   (setq _posicionY (float __posicionY))
   (setq _velocidadRel (float __velocidadRel))
   (setq _aceleracionX (float __aceleracionX))
   (setq _longitud (float __longitud))
   (setq _ancho (float __ancho))
   (setq _angulo (float __angulo))
   (setq _angleRate (float __angleRate))
   (setq _scaleChange (float __scaleChange))
   (setq _edad (round __edad))
   (setq _id (round __id))
   (setq _tipo (round __tipo))
   (setq _status (round __status))
   (setq _carril (round __carril))
   (setq _flags (round __flags))
   (setq _intermitentes (round __intermitentes))
   (setq _cutInOut (round __cutInOut))
   self)
  (:timestamp_sec
   (&optional __timestamp_sec)
   (if __timestamp_sec (setq _timestamp_sec __timestamp_sec)) _timestamp_sec)
  (:timestamp_nsec
   (&optional __timestamp_nsec)
   (if __timestamp_nsec (setq _timestamp_nsec __timestamp_nsec)) _timestamp_nsec)
  (:posicionX
   (&optional __posicionX)
   (if __posicionX (setq _posicionX __posicionX)) _posicionX)
  (:posicionY
   (&optional __posicionY)
   (if __posicionY (setq _posicionY __posicionY)) _posicionY)
  (:velocidadRel
   (&optional __velocidadRel)
   (if __velocidadRel (setq _velocidadRel __velocidadRel)) _velocidadRel)
  (:aceleracionX
   (&optional __aceleracionX)
   (if __aceleracionX (setq _aceleracionX __aceleracionX)) _aceleracionX)
  (:longitud
   (&optional __longitud)
   (if __longitud (setq _longitud __longitud)) _longitud)
  (:ancho
   (&optional __ancho)
   (if __ancho (setq _ancho __ancho)) _ancho)
  (:angulo
   (&optional __angulo)
   (if __angulo (setq _angulo __angulo)) _angulo)
  (:angleRate
   (&optional __angleRate)
   (if __angleRate (setq _angleRate __angleRate)) _angleRate)
  (:scaleChange
   (&optional __scaleChange)
   (if __scaleChange (setq _scaleChange __scaleChange)) _scaleChange)
  (:edad
   (&optional __edad)
   (if __edad (setq _edad __edad)) _edad)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:tipo
   (&optional __tipo)
   (if __tipo (setq _tipo __tipo)) _tipo)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:carril
   (&optional __carril)
   (if __carril (setq _carril __carril)) _carril)
  (:flags
   (&optional __flags)
   (if __flags (setq _flags __flags)) _flags)
  (:intermitentes
   (&optional __intermitentes)
   (if __intermitentes (setq _intermitentes __intermitentes)) _intermitentes)
  (:cutInOut
   (&optional __cutInOut)
   (if __cutInOut (setq _cutInOut __cutInOut)) _cutInOut)
  (:serialization-length
   ()
   (+
    ;; int32 _timestamp_sec
    4
    ;; int32 _timestamp_nsec
    4
    ;; float32 _posicionX
    4
    ;; float32 _posicionY
    4
    ;; float32 _velocidadRel
    4
    ;; float32 _aceleracionX
    4
    ;; float32 _longitud
    4
    ;; float32 _ancho
    4
    ;; float32 _angulo
    4
    ;; float32 _angleRate
    4
    ;; float32 _scaleChange
    4
    ;; int16 _edad
    2
    ;; byte _id
    1
    ;; byte _tipo
    1
    ;; byte _status
    1
    ;; byte _carril
    1
    ;; byte _flags
    1
    ;; byte _intermitentes
    1
    ;; byte _cutInOut
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
     ;; float32 _posicionX
       (sys::poke _posicionX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _posicionY
       (sys::poke _posicionY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocidadRel
       (sys::poke _velocidadRel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _aceleracionX
       (sys::poke _aceleracionX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _longitud
       (sys::poke _longitud (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ancho
       (sys::poke _ancho (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angulo
       (sys::poke _angulo (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angleRate
       (sys::poke _angleRate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _scaleChange
       (sys::poke _scaleChange (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16 _edad
       (write-word _edad s)
     ;; byte _id
       (write-byte _id s)
     ;; byte _tipo
       (write-byte _tipo s)
     ;; byte _status
       (write-byte _status s)
     ;; byte _carril
       (write-byte _carril s)
     ;; byte _flags
       (write-byte _flags s)
     ;; byte _intermitentes
       (write-byte _intermitentes s)
     ;; byte _cutInOut
       (write-byte _cutInOut s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _timestamp_sec
     (setq _timestamp_sec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _timestamp_nsec
     (setq _timestamp_nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _posicionX
     (setq _posicionX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _posicionY
     (setq _posicionY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocidadRel
     (setq _velocidadRel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _aceleracionX
     (setq _aceleracionX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _longitud
     (setq _longitud (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ancho
     (setq _ancho (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angulo
     (setq _angulo (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angleRate
     (setq _angleRate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _scaleChange
     (setq _scaleChange (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16 _edad
     (setq _edad (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; byte _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _id 127) (setq _id (- _id 256)))
   ;; byte _tipo
     (setq _tipo (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _tipo 127) (setq _tipo (- _tipo 256)))
   ;; byte _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _status 127) (setq _status (- _status 256)))
   ;; byte _carril
     (setq _carril (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _carril 127) (setq _carril (- _carril 256)))
   ;; byte _flags
     (setq _flags (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _flags 127) (setq _flags (- _flags 256)))
   ;; byte _intermitentes
     (setq _intermitentes (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _intermitentes 127) (setq _intermitentes (- _intermitentes 256)))
   ;; byte _cutInOut
     (setq _cutInOut (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cutInOut 127) (setq _cutInOut (- _cutInOut 256)))
   ;;
   self)
  )

(setf (get lcm_to_ros::mobileye_obstaculo :md5sum-) "089b186e41a459d4bb6e84f175bf79ab")
(setf (get lcm_to_ros::mobileye_obstaculo :datatype-) "lcm_to_ros/mobileye_obstaculo")
(setf (get lcm_to_ros::mobileye_obstaculo :definition-)
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
float32             posicionX
float32             posicionY
float32             velocidadRel
float32             aceleracionX
float32             longitud
float32             ancho
float32             angulo
float32             angleRate
float32             scaleChange
int16               edad
byte                id
byte                tipo
byte                status
byte                carril
byte                flags
byte                intermitentes
byte                cutInOut

")



(provide :lcm_to_ros/mobileye_obstaculo "089b186e41a459d4bb6e84f175bf79ab")


