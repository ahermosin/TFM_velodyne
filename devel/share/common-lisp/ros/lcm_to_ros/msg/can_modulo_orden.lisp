; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude can_modulo_orden.msg.html

(cl:defclass <can_modulo_orden> (roslisp-msg-protocol:ros-message)
  ((ValorAnalog
    :reader ValorAnalog
    :initarg :ValorAnalog
    :type cl:float
    :initform 0.0)
   (IdModulo
    :reader IdModulo
    :initarg :IdModulo
    :type cl:integer
    :initform 0)
   (Orden
    :reader Orden
    :initarg :Orden
    :type cl:integer
    :initform 0)
   (ValorDigital
    :reader ValorDigital
    :initarg :ValorDigital
    :type cl:integer
    :initform 0))
)

(cl:defclass can_modulo_orden (<can_modulo_orden>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <can_modulo_orden>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'can_modulo_orden)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<can_modulo_orden> is deprecated: use lcm_to_ros-msg:can_modulo_orden instead.")))

(cl:ensure-generic-function 'ValorAnalog-val :lambda-list '(m))
(cl:defmethod ValorAnalog-val ((m <can_modulo_orden>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:ValorAnalog-val is deprecated.  Use lcm_to_ros-msg:ValorAnalog instead.")
  (ValorAnalog m))

(cl:ensure-generic-function 'IdModulo-val :lambda-list '(m))
(cl:defmethod IdModulo-val ((m <can_modulo_orden>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:IdModulo-val is deprecated.  Use lcm_to_ros-msg:IdModulo instead.")
  (IdModulo m))

(cl:ensure-generic-function 'Orden-val :lambda-list '(m))
(cl:defmethod Orden-val ((m <can_modulo_orden>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:Orden-val is deprecated.  Use lcm_to_ros-msg:Orden instead.")
  (Orden m))

(cl:ensure-generic-function 'ValorDigital-val :lambda-list '(m))
(cl:defmethod ValorDigital-val ((m <can_modulo_orden>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:ValorDigital-val is deprecated.  Use lcm_to_ros-msg:ValorDigital instead.")
  (ValorDigital m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <can_modulo_orden>) ostream)
  "Serializes a message object of type '<can_modulo_orden>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ValorAnalog))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'IdModulo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Orden)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ValorDigital)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <can_modulo_orden>) istream)
  "Deserializes a message object of type '<can_modulo_orden>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ValorAnalog) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'IdModulo)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Orden)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ValorDigital)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<can_modulo_orden>)))
  "Returns string type for a message object of type '<can_modulo_orden>"
  "lcm_to_ros/can_modulo_orden")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'can_modulo_orden)))
  "Returns string type for a message object of type 'can_modulo_orden"
  "lcm_to_ros/can_modulo_orden")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<can_modulo_orden>)))
  "Returns md5sum for a message object of type '<can_modulo_orden>"
  "a74929a645129209cfc4d5dd7332d340")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'can_modulo_orden)))
  "Returns md5sum for a message object of type 'can_modulo_orden"
  "a74929a645129209cfc4d5dd7332d340")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<can_modulo_orden>)))
  "Returns full string definition for message of type '<can_modulo_orden>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%float64             ValorAnalog~%byte                IdModulo~%byte                Orden~%byte                ValorDigital~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'can_modulo_orden)))
  "Returns full string definition for message of type 'can_modulo_orden"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%float64             ValorAnalog~%byte                IdModulo~%byte                Orden~%byte                ValorDigital~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <can_modulo_orden>))
  (cl:+ 0
     8
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <can_modulo_orden>))
  "Converts a ROS message object to a list"
  (cl:list 'can_modulo_orden
    (cl:cons ':ValorAnalog (ValorAnalog msg))
    (cl:cons ':IdModulo (IdModulo msg))
    (cl:cons ':Orden (Orden msg))
    (cl:cons ':ValorDigital (ValorDigital msg))
))
