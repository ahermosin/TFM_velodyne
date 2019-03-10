; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude warnings_coche.msg.html

(cl:defclass <warnings_coche> (roslisp-msg-protocol:ros-message)
  ((tipo_obs
    :reader tipo_obs
    :initarg :tipo_obs
    :type cl:fixnum
    :initform 0)
   (longitud
    :reader longitud
    :initarg :longitud
    :type cl:float
    :initform 0.0)
   (latitud
    :reader latitud
    :initarg :latitud
    :type cl:float
    :initform 0.0)
   (velocidad
    :reader velocidad
    :initarg :velocidad
    :type cl:float
    :initform 0.0))
)

(cl:defclass warnings_coche (<warnings_coche>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <warnings_coche>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'warnings_coche)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<warnings_coche> is deprecated: use lcm_to_ros-msg:warnings_coche instead.")))

(cl:ensure-generic-function 'tipo_obs-val :lambda-list '(m))
(cl:defmethod tipo_obs-val ((m <warnings_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tipo_obs-val is deprecated.  Use lcm_to_ros-msg:tipo_obs instead.")
  (tipo_obs m))

(cl:ensure-generic-function 'longitud-val :lambda-list '(m))
(cl:defmethod longitud-val ((m <warnings_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:longitud-val is deprecated.  Use lcm_to_ros-msg:longitud instead.")
  (longitud m))

(cl:ensure-generic-function 'latitud-val :lambda-list '(m))
(cl:defmethod latitud-val ((m <warnings_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:latitud-val is deprecated.  Use lcm_to_ros-msg:latitud instead.")
  (latitud m))

(cl:ensure-generic-function 'velocidad-val :lambda-list '(m))
(cl:defmethod velocidad-val ((m <warnings_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad-val is deprecated.  Use lcm_to_ros-msg:velocidad instead.")
  (velocidad m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <warnings_coche>) ostream)
  "Serializes a message object of type '<warnings_coche>"
  (cl:let* ((signed (cl:slot-value msg 'tipo_obs)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'longitud))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'latitud))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocidad))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <warnings_coche>) istream)
  "Deserializes a message object of type '<warnings_coche>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tipo_obs) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitud) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitud) (roslisp-utils:decode-double-float-bits bits)))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<warnings_coche>)))
  "Returns string type for a message object of type '<warnings_coche>"
  "lcm_to_ros/warnings_coche")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'warnings_coche)))
  "Returns string type for a message object of type 'warnings_coche"
  "lcm_to_ros/warnings_coche")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<warnings_coche>)))
  "Returns md5sum for a message object of type '<warnings_coche>"
  "d63e4b099b36145ebd6de918f9a6bd94")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'warnings_coche)))
  "Returns md5sum for a message object of type 'warnings_coche"
  "d63e4b099b36145ebd6de918f9a6bd94")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<warnings_coche>)))
  "Returns full string definition for message of type '<warnings_coche>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int8                tipo_obs~%float64             longitud~%float64             latitud~%float64             velocidad~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'warnings_coche)))
  "Returns full string definition for message of type 'warnings_coche"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int8                tipo_obs~%float64             longitud~%float64             latitud~%float64             velocidad~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <warnings_coche>))
  (cl:+ 0
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <warnings_coche>))
  "Converts a ROS message object to a list"
  (cl:list 'warnings_coche
    (cl:cons ':tipo_obs (tipo_obs msg))
    (cl:cons ':longitud (longitud msg))
    (cl:cons ':latitud (latitud msg))
    (cl:cons ':velocidad (velocidad msg))
))
