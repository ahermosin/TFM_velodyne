; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude mobileye_alarmas.msg.html

(cl:defclass <mobileye_alarmas> (roslisp-msg-protocol:ros-message)
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
   (flags
    :reader flags
    :initarg :flags
    :type cl:fixnum
    :initform 0)
   (headway
    :reader headway
    :initarg :headway
    :type cl:float
    :initform 0.0)
   (warningLevel
    :reader warningLevel
    :initarg :warningLevel
    :type cl:integer
    :initform 0))
)

(cl:defclass mobileye_alarmas (<mobileye_alarmas>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mobileye_alarmas>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mobileye_alarmas)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<mobileye_alarmas> is deprecated: use lcm_to_ros-msg:mobileye_alarmas instead.")))

(cl:ensure-generic-function 'timestamp_sec-val :lambda-list '(m))
(cl:defmethod timestamp_sec-val ((m <mobileye_alarmas>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_sec-val is deprecated.  Use lcm_to_ros-msg:timestamp_sec instead.")
  (timestamp_sec m))

(cl:ensure-generic-function 'timestamp_nsec-val :lambda-list '(m))
(cl:defmethod timestamp_nsec-val ((m <mobileye_alarmas>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_nsec-val is deprecated.  Use lcm_to_ros-msg:timestamp_nsec instead.")
  (timestamp_nsec m))

(cl:ensure-generic-function 'flags-val :lambda-list '(m))
(cl:defmethod flags-val ((m <mobileye_alarmas>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:flags-val is deprecated.  Use lcm_to_ros-msg:flags instead.")
  (flags m))

(cl:ensure-generic-function 'headway-val :lambda-list '(m))
(cl:defmethod headway-val ((m <mobileye_alarmas>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:headway-val is deprecated.  Use lcm_to_ros-msg:headway instead.")
  (headway m))

(cl:ensure-generic-function 'warningLevel-val :lambda-list '(m))
(cl:defmethod warningLevel-val ((m <mobileye_alarmas>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:warningLevel-val is deprecated.  Use lcm_to_ros-msg:warningLevel instead.")
  (warningLevel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mobileye_alarmas>) ostream)
  "Serializes a message object of type '<mobileye_alarmas>"
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
  (cl:let* ((signed (cl:slot-value msg 'flags)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'headway))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'warningLevel)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mobileye_alarmas>) istream)
  "Deserializes a message object of type '<mobileye_alarmas>"
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
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'flags) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'headway) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'warningLevel)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mobileye_alarmas>)))
  "Returns string type for a message object of type '<mobileye_alarmas>"
  "lcm_to_ros/mobileye_alarmas")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mobileye_alarmas)))
  "Returns string type for a message object of type 'mobileye_alarmas"
  "lcm_to_ros/mobileye_alarmas")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mobileye_alarmas>)))
  "Returns md5sum for a message object of type '<mobileye_alarmas>"
  "275230c90d76753bca3bff6115559522")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mobileye_alarmas)))
  "Returns md5sum for a message object of type 'mobileye_alarmas"
  "275230c90d76753bca3bff6115559522")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mobileye_alarmas>)))
  "Returns full string definition for message of type '<mobileye_alarmas>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%int16               flags~%float32             headway~%byte                warningLevel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mobileye_alarmas)))
  "Returns full string definition for message of type 'mobileye_alarmas"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%int16               flags~%float32             headway~%byte                warningLevel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mobileye_alarmas>))
  (cl:+ 0
     4
     4
     2
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mobileye_alarmas>))
  "Converts a ROS message object to a list"
  (cl:list 'mobileye_alarmas
    (cl:cons ':timestamp_sec (timestamp_sec msg))
    (cl:cons ':timestamp_nsec (timestamp_nsec msg))
    (cl:cons ':flags (flags msg))
    (cl:cons ':headway (headway msg))
    (cl:cons ':warningLevel (warningLevel msg))
))
