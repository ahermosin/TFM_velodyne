; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude can_coche_velocidad.msg.html

(cl:defclass <can_coche_velocidad> (roslisp-msg-protocol:ros-message)
  ((timestamp_sec
    :reader timestamp_sec
    :initarg :timestamp_sec
    :type cl:integer
    :initform 0)
   (timestamp_nsec
    :reader timestamp_nsec
    :initarg :timestamp_nsec
    :type cl:integer
    :initform 0)
   (velocidad
    :reader velocidad
    :initarg :velocidad
    :type cl:float
    :initform 0.0)
   (aceleracion
    :reader aceleracion
    :initarg :aceleracion
    :type cl:float
    :initform 0.0)
   (velocidad_ruedas_delanteras
    :reader velocidad_ruedas_delanteras
    :initarg :velocidad_ruedas_delanteras
    :type cl:float
    :initform 0.0)
   (velocidad_trasera_izquierda
    :reader velocidad_trasera_izquierda
    :initarg :velocidad_trasera_izquierda
    :type cl:float
    :initform 0.0)
   (velocidad_trasera_derecha
    :reader velocidad_trasera_derecha
    :initarg :velocidad_trasera_derecha
    :type cl:float
    :initform 0.0))
)

(cl:defclass can_coche_velocidad (<can_coche_velocidad>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <can_coche_velocidad>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'can_coche_velocidad)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<can_coche_velocidad> is deprecated: use lcm_to_ros-msg:can_coche_velocidad instead.")))

(cl:ensure-generic-function 'timestamp_sec-val :lambda-list '(m))
(cl:defmethod timestamp_sec-val ((m <can_coche_velocidad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_sec-val is deprecated.  Use lcm_to_ros-msg:timestamp_sec instead.")
  (timestamp_sec m))

(cl:ensure-generic-function 'timestamp_nsec-val :lambda-list '(m))
(cl:defmethod timestamp_nsec-val ((m <can_coche_velocidad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_nsec-val is deprecated.  Use lcm_to_ros-msg:timestamp_nsec instead.")
  (timestamp_nsec m))

(cl:ensure-generic-function 'velocidad-val :lambda-list '(m))
(cl:defmethod velocidad-val ((m <can_coche_velocidad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad-val is deprecated.  Use lcm_to_ros-msg:velocidad instead.")
  (velocidad m))

(cl:ensure-generic-function 'aceleracion-val :lambda-list '(m))
(cl:defmethod aceleracion-val ((m <can_coche_velocidad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:aceleracion-val is deprecated.  Use lcm_to_ros-msg:aceleracion instead.")
  (aceleracion m))

(cl:ensure-generic-function 'velocidad_ruedas_delanteras-val :lambda-list '(m))
(cl:defmethod velocidad_ruedas_delanteras-val ((m <can_coche_velocidad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad_ruedas_delanteras-val is deprecated.  Use lcm_to_ros-msg:velocidad_ruedas_delanteras instead.")
  (velocidad_ruedas_delanteras m))

(cl:ensure-generic-function 'velocidad_trasera_izquierda-val :lambda-list '(m))
(cl:defmethod velocidad_trasera_izquierda-val ((m <can_coche_velocidad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad_trasera_izquierda-val is deprecated.  Use lcm_to_ros-msg:velocidad_trasera_izquierda instead.")
  (velocidad_trasera_izquierda m))

(cl:ensure-generic-function 'velocidad_trasera_derecha-val :lambda-list '(m))
(cl:defmethod velocidad_trasera_derecha-val ((m <can_coche_velocidad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad_trasera_derecha-val is deprecated.  Use lcm_to_ros-msg:velocidad_trasera_derecha instead.")
  (velocidad_trasera_derecha m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <can_coche_velocidad>) ostream)
  "Serializes a message object of type '<can_coche_velocidad>"
  (cl:let* ((signed (cl:slot-value msg 'timestamp_sec)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'timestamp_nsec)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocidad))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'aceleracion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocidad_ruedas_delanteras))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocidad_trasera_izquierda))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocidad_trasera_derecha))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <can_coche_velocidad>) istream)
  "Deserializes a message object of type '<can_coche_velocidad>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp_sec) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp_nsec) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'aceleracion) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad_ruedas_delanteras) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad_trasera_izquierda) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad_trasera_derecha) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<can_coche_velocidad>)))
  "Returns string type for a message object of type '<can_coche_velocidad>"
  "lcm_to_ros/can_coche_velocidad")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'can_coche_velocidad)))
  "Returns string type for a message object of type 'can_coche_velocidad"
  "lcm_to_ros/can_coche_velocidad")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<can_coche_velocidad>)))
  "Returns md5sum for a message object of type '<can_coche_velocidad>"
  "b0b5e19e1c76075e25f358480988c020")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'can_coche_velocidad)))
  "Returns md5sum for a message object of type 'can_coche_velocidad"
  "b0b5e19e1c76075e25f358480988c020")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<can_coche_velocidad>)))
  "Returns full string definition for message of type '<can_coche_velocidad>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:15 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%float64             velocidad~%float64             aceleracion~%float64             velocidad_ruedas_delanteras~%float64             velocidad_trasera_izquierda~%float64             velocidad_trasera_derecha~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'can_coche_velocidad)))
  "Returns full string definition for message of type 'can_coche_velocidad"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:15 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%float64             velocidad~%float64             aceleracion~%float64             velocidad_ruedas_delanteras~%float64             velocidad_trasera_izquierda~%float64             velocidad_trasera_derecha~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <can_coche_velocidad>))
  (cl:+ 0
     4
     4
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <can_coche_velocidad>))
  "Converts a ROS message object to a list"
  (cl:list 'can_coche_velocidad
    (cl:cons ':timestamp_sec (timestamp_sec msg))
    (cl:cons ':timestamp_nsec (timestamp_nsec msg))
    (cl:cons ':velocidad (velocidad msg))
    (cl:cons ':aceleracion (aceleracion msg))
    (cl:cons ':velocidad_ruedas_delanteras (velocidad_ruedas_delanteras msg))
    (cl:cons ':velocidad_trasera_izquierda (velocidad_trasera_izquierda msg))
    (cl:cons ':velocidad_trasera_derecha (velocidad_trasera_derecha msg))
))
