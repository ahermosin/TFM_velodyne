; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude can_coche_caja.msg.html

(cl:defclass <can_coche_caja> (roslisp-msg-protocol:ros-message)
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
   (marcha_palanca
    :reader marcha_palanca
    :initarg :marcha_palanca
    :type cl:fixnum
    :initform 0)
   (marcha_actual
    :reader marcha_actual
    :initarg :marcha_actual
    :type cl:fixnum
    :initform 0)
   (modo_auto
    :reader modo_auto
    :initarg :modo_auto
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass can_coche_caja (<can_coche_caja>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <can_coche_caja>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'can_coche_caja)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<can_coche_caja> is deprecated: use lcm_to_ros-msg:can_coche_caja instead.")))

(cl:ensure-generic-function 'timestamp_sec-val :lambda-list '(m))
(cl:defmethod timestamp_sec-val ((m <can_coche_caja>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_sec-val is deprecated.  Use lcm_to_ros-msg:timestamp_sec instead.")
  (timestamp_sec m))

(cl:ensure-generic-function 'timestamp_nsec-val :lambda-list '(m))
(cl:defmethod timestamp_nsec-val ((m <can_coche_caja>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_nsec-val is deprecated.  Use lcm_to_ros-msg:timestamp_nsec instead.")
  (timestamp_nsec m))

(cl:ensure-generic-function 'marcha_palanca-val :lambda-list '(m))
(cl:defmethod marcha_palanca-val ((m <can_coche_caja>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:marcha_palanca-val is deprecated.  Use lcm_to_ros-msg:marcha_palanca instead.")
  (marcha_palanca m))

(cl:ensure-generic-function 'marcha_actual-val :lambda-list '(m))
(cl:defmethod marcha_actual-val ((m <can_coche_caja>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:marcha_actual-val is deprecated.  Use lcm_to_ros-msg:marcha_actual instead.")
  (marcha_actual m))

(cl:ensure-generic-function 'modo_auto-val :lambda-list '(m))
(cl:defmethod modo_auto-val ((m <can_coche_caja>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:modo_auto-val is deprecated.  Use lcm_to_ros-msg:modo_auto instead.")
  (modo_auto m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <can_coche_caja>) ostream)
  "Serializes a message object of type '<can_coche_caja>"
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
  (cl:let* ((signed (cl:slot-value msg 'marcha_palanca)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'marcha_actual)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'modo_auto) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <can_coche_caja>) istream)
  "Deserializes a message object of type '<can_coche_caja>"
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
      (cl:setf (cl:slot-value msg 'marcha_palanca) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'marcha_actual) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'modo_auto) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<can_coche_caja>)))
  "Returns string type for a message object of type '<can_coche_caja>"
  "lcm_to_ros/can_coche_caja")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'can_coche_caja)))
  "Returns string type for a message object of type 'can_coche_caja"
  "lcm_to_ros/can_coche_caja")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<can_coche_caja>)))
  "Returns md5sum for a message object of type '<can_coche_caja>"
  "ea467c83106b332ce7b80a81a2e4ae2f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'can_coche_caja)))
  "Returns md5sum for a message object of type 'can_coche_caja"
  "ea467c83106b332ce7b80a81a2e4ae2f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<can_coche_caja>)))
  "Returns full string definition for message of type '<can_coche_caja>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:15 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%int8                marcha_palanca~%int8                marcha_actual~%bool                modo_auto~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'can_coche_caja)))
  "Returns full string definition for message of type 'can_coche_caja"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:15 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%int8                marcha_palanca~%int8                marcha_actual~%bool                modo_auto~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <can_coche_caja>))
  (cl:+ 0
     4
     4
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <can_coche_caja>))
  "Converts a ROS message object to a list"
  (cl:list 'can_coche_caja
    (cl:cons ':timestamp_sec (timestamp_sec msg))
    (cl:cons ':timestamp_nsec (timestamp_nsec msg))
    (cl:cons ':marcha_palanca (marcha_palanca msg))
    (cl:cons ':marcha_actual (marcha_actual msg))
    (cl:cons ':modo_auto (modo_auto msg))
))
