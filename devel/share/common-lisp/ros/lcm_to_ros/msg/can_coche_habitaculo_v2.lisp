; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude can_coche_habitaculo_v2.msg.html

(cl:defclass <can_coche_habitaculo_v2> (roslisp-msg-protocol:ros-message)
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
   (frenos
    :reader frenos
    :initarg :frenos
    :type cl:fixnum
    :initform 0)
   (ignicion
    :reader ignicion
    :initarg :ignicion
    :type cl:fixnum
    :initform 0)
   (abs_activo
    :reader abs_activo
    :initarg :abs_activo
    :type cl:fixnum
    :initform 0))
)

(cl:defclass can_coche_habitaculo_v2 (<can_coche_habitaculo_v2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <can_coche_habitaculo_v2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'can_coche_habitaculo_v2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<can_coche_habitaculo_v2> is deprecated: use lcm_to_ros-msg:can_coche_habitaculo_v2 instead.")))

(cl:ensure-generic-function 'timestamp_sec-val :lambda-list '(m))
(cl:defmethod timestamp_sec-val ((m <can_coche_habitaculo_v2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_sec-val is deprecated.  Use lcm_to_ros-msg:timestamp_sec instead.")
  (timestamp_sec m))

(cl:ensure-generic-function 'timestamp_nsec-val :lambda-list '(m))
(cl:defmethod timestamp_nsec-val ((m <can_coche_habitaculo_v2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_nsec-val is deprecated.  Use lcm_to_ros-msg:timestamp_nsec instead.")
  (timestamp_nsec m))

(cl:ensure-generic-function 'frenos-val :lambda-list '(m))
(cl:defmethod frenos-val ((m <can_coche_habitaculo_v2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:frenos-val is deprecated.  Use lcm_to_ros-msg:frenos instead.")
  (frenos m))

(cl:ensure-generic-function 'ignicion-val :lambda-list '(m))
(cl:defmethod ignicion-val ((m <can_coche_habitaculo_v2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:ignicion-val is deprecated.  Use lcm_to_ros-msg:ignicion instead.")
  (ignicion m))

(cl:ensure-generic-function 'abs_activo-val :lambda-list '(m))
(cl:defmethod abs_activo-val ((m <can_coche_habitaculo_v2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:abs_activo-val is deprecated.  Use lcm_to_ros-msg:abs_activo instead.")
  (abs_activo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <can_coche_habitaculo_v2>) ostream)
  "Serializes a message object of type '<can_coche_habitaculo_v2>"
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
  (cl:let* ((signed (cl:slot-value msg 'frenos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ignicion)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'abs_activo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <can_coche_habitaculo_v2>) istream)
  "Deserializes a message object of type '<can_coche_habitaculo_v2>"
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frenos) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ignicion) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'abs_activo) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<can_coche_habitaculo_v2>)))
  "Returns string type for a message object of type '<can_coche_habitaculo_v2>"
  "lcm_to_ros/can_coche_habitaculo_v2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'can_coche_habitaculo_v2)))
  "Returns string type for a message object of type 'can_coche_habitaculo_v2"
  "lcm_to_ros/can_coche_habitaculo_v2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<can_coche_habitaculo_v2>)))
  "Returns md5sum for a message object of type '<can_coche_habitaculo_v2>"
  "c2b665784cea8336aa6cad167e8811e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'can_coche_habitaculo_v2)))
  "Returns md5sum for a message object of type 'can_coche_habitaculo_v2"
  "c2b665784cea8336aa6cad167e8811e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<can_coche_habitaculo_v2>)))
  "Returns full string definition for message of type '<can_coche_habitaculo_v2>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:15 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%int8                frenos~%int8                ignicion~%int8                abs_activo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'can_coche_habitaculo_v2)))
  "Returns full string definition for message of type 'can_coche_habitaculo_v2"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:15 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%int8                frenos~%int8                ignicion~%int8                abs_activo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <can_coche_habitaculo_v2>))
  (cl:+ 0
     4
     4
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <can_coche_habitaculo_v2>))
  "Converts a ROS message object to a list"
  (cl:list 'can_coche_habitaculo_v2
    (cl:cons ':timestamp_sec (timestamp_sec msg))
    (cl:cons ':timestamp_nsec (timestamp_nsec msg))
    (cl:cons ':frenos (frenos msg))
    (cl:cons ':ignicion (ignicion msg))
    (cl:cons ':abs_activo (abs_activo msg))
))
