; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude mobileye_tsr_status.msg.html

(cl:defclass <mobileye_tsr_status> (roslisp-msg-protocol:ros-message)
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
   (tsr1_tipo
    :reader tsr1_tipo
    :initarg :tsr1_tipo
    :type cl:integer
    :initform 0)
   (tsr1_valor
    :reader tsr1_valor
    :initarg :tsr1_valor
    :type cl:integer
    :initform 0)
   (tsr2_tipo
    :reader tsr2_tipo
    :initarg :tsr2_tipo
    :type cl:integer
    :initform 0)
   (tsr2_valor
    :reader tsr2_valor
    :initarg :tsr2_valor
    :type cl:integer
    :initform 0)
   (tsr3_tipo
    :reader tsr3_tipo
    :initarg :tsr3_tipo
    :type cl:integer
    :initform 0)
   (tsr3_valor
    :reader tsr3_valor
    :initarg :tsr3_valor
    :type cl:integer
    :initform 0)
   (tsr4_tipo
    :reader tsr4_tipo
    :initarg :tsr4_tipo
    :type cl:integer
    :initform 0)
   (tsr4_valor
    :reader tsr4_valor
    :initarg :tsr4_valor
    :type cl:integer
    :initform 0))
)

(cl:defclass mobileye_tsr_status (<mobileye_tsr_status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mobileye_tsr_status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mobileye_tsr_status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<mobileye_tsr_status> is deprecated: use lcm_to_ros-msg:mobileye_tsr_status instead.")))

(cl:ensure-generic-function 'timestamp_sec-val :lambda-list '(m))
(cl:defmethod timestamp_sec-val ((m <mobileye_tsr_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_sec-val is deprecated.  Use lcm_to_ros-msg:timestamp_sec instead.")
  (timestamp_sec m))

(cl:ensure-generic-function 'timestamp_nsec-val :lambda-list '(m))
(cl:defmethod timestamp_nsec-val ((m <mobileye_tsr_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_nsec-val is deprecated.  Use lcm_to_ros-msg:timestamp_nsec instead.")
  (timestamp_nsec m))

(cl:ensure-generic-function 'tsr1_tipo-val :lambda-list '(m))
(cl:defmethod tsr1_tipo-val ((m <mobileye_tsr_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tsr1_tipo-val is deprecated.  Use lcm_to_ros-msg:tsr1_tipo instead.")
  (tsr1_tipo m))

(cl:ensure-generic-function 'tsr1_valor-val :lambda-list '(m))
(cl:defmethod tsr1_valor-val ((m <mobileye_tsr_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tsr1_valor-val is deprecated.  Use lcm_to_ros-msg:tsr1_valor instead.")
  (tsr1_valor m))

(cl:ensure-generic-function 'tsr2_tipo-val :lambda-list '(m))
(cl:defmethod tsr2_tipo-val ((m <mobileye_tsr_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tsr2_tipo-val is deprecated.  Use lcm_to_ros-msg:tsr2_tipo instead.")
  (tsr2_tipo m))

(cl:ensure-generic-function 'tsr2_valor-val :lambda-list '(m))
(cl:defmethod tsr2_valor-val ((m <mobileye_tsr_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tsr2_valor-val is deprecated.  Use lcm_to_ros-msg:tsr2_valor instead.")
  (tsr2_valor m))

(cl:ensure-generic-function 'tsr3_tipo-val :lambda-list '(m))
(cl:defmethod tsr3_tipo-val ((m <mobileye_tsr_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tsr3_tipo-val is deprecated.  Use lcm_to_ros-msg:tsr3_tipo instead.")
  (tsr3_tipo m))

(cl:ensure-generic-function 'tsr3_valor-val :lambda-list '(m))
(cl:defmethod tsr3_valor-val ((m <mobileye_tsr_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tsr3_valor-val is deprecated.  Use lcm_to_ros-msg:tsr3_valor instead.")
  (tsr3_valor m))

(cl:ensure-generic-function 'tsr4_tipo-val :lambda-list '(m))
(cl:defmethod tsr4_tipo-val ((m <mobileye_tsr_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tsr4_tipo-val is deprecated.  Use lcm_to_ros-msg:tsr4_tipo instead.")
  (tsr4_tipo m))

(cl:ensure-generic-function 'tsr4_valor-val :lambda-list '(m))
(cl:defmethod tsr4_valor-val ((m <mobileye_tsr_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tsr4_valor-val is deprecated.  Use lcm_to_ros-msg:tsr4_valor instead.")
  (tsr4_valor m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mobileye_tsr_status>) ostream)
  "Serializes a message object of type '<mobileye_tsr_status>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr1_tipo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr1_valor)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr2_tipo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr2_valor)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr3_tipo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr3_valor)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr4_tipo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr4_valor)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mobileye_tsr_status>) istream)
  "Deserializes a message object of type '<mobileye_tsr_status>"
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr1_tipo)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr1_valor)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr2_tipo)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr2_valor)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr3_tipo)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr3_valor)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr4_tipo)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsr4_valor)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mobileye_tsr_status>)))
  "Returns string type for a message object of type '<mobileye_tsr_status>"
  "lcm_to_ros/mobileye_tsr_status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mobileye_tsr_status)))
  "Returns string type for a message object of type 'mobileye_tsr_status"
  "lcm_to_ros/mobileye_tsr_status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mobileye_tsr_status>)))
  "Returns md5sum for a message object of type '<mobileye_tsr_status>"
  "8ddb6df2c3438877c3e5e4ec2624a854")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mobileye_tsr_status)))
  "Returns md5sum for a message object of type 'mobileye_tsr_status"
  "8ddb6df2c3438877c3e5e4ec2624a854")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mobileye_tsr_status>)))
  "Returns full string definition for message of type '<mobileye_tsr_status>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%byte                tsr1_tipo~%byte                tsr1_valor~%byte                tsr2_tipo~%byte                tsr2_valor~%byte                tsr3_tipo~%byte                tsr3_valor~%byte                tsr4_tipo~%byte                tsr4_valor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mobileye_tsr_status)))
  "Returns full string definition for message of type 'mobileye_tsr_status"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%byte                tsr1_tipo~%byte                tsr1_valor~%byte                tsr2_tipo~%byte                tsr2_valor~%byte                tsr3_tipo~%byte                tsr3_valor~%byte                tsr4_tipo~%byte                tsr4_valor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mobileye_tsr_status>))
  (cl:+ 0
     4
     4
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mobileye_tsr_status>))
  "Converts a ROS message object to a list"
  (cl:list 'mobileye_tsr_status
    (cl:cons ':timestamp_sec (timestamp_sec msg))
    (cl:cons ':timestamp_nsec (timestamp_nsec msg))
    (cl:cons ':tsr1_tipo (tsr1_tipo msg))
    (cl:cons ':tsr1_valor (tsr1_valor msg))
    (cl:cons ':tsr2_tipo (tsr2_tipo msg))
    (cl:cons ':tsr2_valor (tsr2_valor msg))
    (cl:cons ':tsr3_tipo (tsr3_tipo msg))
    (cl:cons ':tsr3_valor (tsr3_valor msg))
    (cl:cons ':tsr4_tipo (tsr4_tipo msg))
    (cl:cons ':tsr4_valor (tsr4_valor msg))
))
