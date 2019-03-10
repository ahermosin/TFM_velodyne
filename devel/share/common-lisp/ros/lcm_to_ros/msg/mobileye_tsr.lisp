; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude mobileye_tsr.msg.html

(cl:defclass <mobileye_tsr> (roslisp-msg-protocol:ros-message)
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
   (tipo
    :reader tipo
    :initarg :tipo
    :type cl:integer
    :initform 0)
   (valor
    :reader valor
    :initarg :valor
    :type cl:integer
    :initform 0)
   (posicionX
    :reader posicionX
    :initarg :posicionX
    :type cl:integer
    :initform 0)
   (posicionY
    :reader posicionY
    :initarg :posicionY
    :type cl:fixnum
    :initform 0)
   (posicionZ
    :reader posicionZ
    :initarg :posicionZ
    :type cl:fixnum
    :initform 0))
)

(cl:defclass mobileye_tsr (<mobileye_tsr>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mobileye_tsr>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mobileye_tsr)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<mobileye_tsr> is deprecated: use lcm_to_ros-msg:mobileye_tsr instead.")))

(cl:ensure-generic-function 'timestamp_sec-val :lambda-list '(m))
(cl:defmethod timestamp_sec-val ((m <mobileye_tsr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_sec-val is deprecated.  Use lcm_to_ros-msg:timestamp_sec instead.")
  (timestamp_sec m))

(cl:ensure-generic-function 'timestamp_nsec-val :lambda-list '(m))
(cl:defmethod timestamp_nsec-val ((m <mobileye_tsr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_nsec-val is deprecated.  Use lcm_to_ros-msg:timestamp_nsec instead.")
  (timestamp_nsec m))

(cl:ensure-generic-function 'tipo-val :lambda-list '(m))
(cl:defmethod tipo-val ((m <mobileye_tsr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tipo-val is deprecated.  Use lcm_to_ros-msg:tipo instead.")
  (tipo m))

(cl:ensure-generic-function 'valor-val :lambda-list '(m))
(cl:defmethod valor-val ((m <mobileye_tsr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:valor-val is deprecated.  Use lcm_to_ros-msg:valor instead.")
  (valor m))

(cl:ensure-generic-function 'posicionX-val :lambda-list '(m))
(cl:defmethod posicionX-val ((m <mobileye_tsr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:posicionX-val is deprecated.  Use lcm_to_ros-msg:posicionX instead.")
  (posicionX m))

(cl:ensure-generic-function 'posicionY-val :lambda-list '(m))
(cl:defmethod posicionY-val ((m <mobileye_tsr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:posicionY-val is deprecated.  Use lcm_to_ros-msg:posicionY instead.")
  (posicionY m))

(cl:ensure-generic-function 'posicionZ-val :lambda-list '(m))
(cl:defmethod posicionZ-val ((m <mobileye_tsr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:posicionZ-val is deprecated.  Use lcm_to_ros-msg:posicionZ instead.")
  (posicionZ m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mobileye_tsr>) ostream)
  "Serializes a message object of type '<mobileye_tsr>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tipo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'valor)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'posicionX)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'posicionY)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'posicionZ)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mobileye_tsr>) istream)
  "Deserializes a message object of type '<mobileye_tsr>"
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tipo)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'valor)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'posicionX)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'posicionY) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'posicionZ) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mobileye_tsr>)))
  "Returns string type for a message object of type '<mobileye_tsr>"
  "lcm_to_ros/mobileye_tsr")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mobileye_tsr)))
  "Returns string type for a message object of type 'mobileye_tsr"
  "lcm_to_ros/mobileye_tsr")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mobileye_tsr>)))
  "Returns md5sum for a message object of type '<mobileye_tsr>"
  "a4f30ab3674f73695c4e58c6fc1ab2dd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mobileye_tsr)))
  "Returns md5sum for a message object of type 'mobileye_tsr"
  "a4f30ab3674f73695c4e58c6fc1ab2dd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mobileye_tsr>)))
  "Returns full string definition for message of type '<mobileye_tsr>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%byte                tipo~%byte                valor~%byte                posicionX~%int8                posicionY~%int8                posicionZ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mobileye_tsr)))
  "Returns full string definition for message of type 'mobileye_tsr"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%byte                tipo~%byte                valor~%byte                posicionX~%int8                posicionY~%int8                posicionZ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mobileye_tsr>))
  (cl:+ 0
     4
     4
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mobileye_tsr>))
  "Converts a ROS message object to a list"
  (cl:list 'mobileye_tsr
    (cl:cons ':timestamp_sec (timestamp_sec msg))
    (cl:cons ':timestamp_nsec (timestamp_nsec msg))
    (cl:cons ':tipo (tipo msg))
    (cl:cons ':valor (valor msg))
    (cl:cons ':posicionX (posicionX msg))
    (cl:cons ':posicionY (posicionY msg))
    (cl:cons ':posicionZ (posicionZ msg))
))
