; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude mobileye_obstaculo.msg.html

(cl:defclass <mobileye_obstaculo> (roslisp-msg-protocol:ros-message)
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
   (posicionX
    :reader posicionX
    :initarg :posicionX
    :type cl:float
    :initform 0.0)
   (posicionY
    :reader posicionY
    :initarg :posicionY
    :type cl:float
    :initform 0.0)
   (velocidadRel
    :reader velocidadRel
    :initarg :velocidadRel
    :type cl:float
    :initform 0.0)
   (aceleracionX
    :reader aceleracionX
    :initarg :aceleracionX
    :type cl:float
    :initform 0.0)
   (longitud
    :reader longitud
    :initarg :longitud
    :type cl:float
    :initform 0.0)
   (ancho
    :reader ancho
    :initarg :ancho
    :type cl:float
    :initform 0.0)
   (angulo
    :reader angulo
    :initarg :angulo
    :type cl:float
    :initform 0.0)
   (angleRate
    :reader angleRate
    :initarg :angleRate
    :type cl:float
    :initform 0.0)
   (scaleChange
    :reader scaleChange
    :initarg :scaleChange
    :type cl:float
    :initform 0.0)
   (edad
    :reader edad
    :initarg :edad
    :type cl:fixnum
    :initform 0)
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (tipo
    :reader tipo
    :initarg :tipo
    :type cl:integer
    :initform 0)
   (status
    :reader status
    :initarg :status
    :type cl:integer
    :initform 0)
   (carril
    :reader carril
    :initarg :carril
    :type cl:integer
    :initform 0)
   (flags
    :reader flags
    :initarg :flags
    :type cl:integer
    :initform 0)
   (intermitentes
    :reader intermitentes
    :initarg :intermitentes
    :type cl:integer
    :initform 0)
   (cutInOut
    :reader cutInOut
    :initarg :cutInOut
    :type cl:integer
    :initform 0))
)

(cl:defclass mobileye_obstaculo (<mobileye_obstaculo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mobileye_obstaculo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mobileye_obstaculo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<mobileye_obstaculo> is deprecated: use lcm_to_ros-msg:mobileye_obstaculo instead.")))

(cl:ensure-generic-function 'timestamp_sec-val :lambda-list '(m))
(cl:defmethod timestamp_sec-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_sec-val is deprecated.  Use lcm_to_ros-msg:timestamp_sec instead.")
  (timestamp_sec m))

(cl:ensure-generic-function 'timestamp_nsec-val :lambda-list '(m))
(cl:defmethod timestamp_nsec-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_nsec-val is deprecated.  Use lcm_to_ros-msg:timestamp_nsec instead.")
  (timestamp_nsec m))

(cl:ensure-generic-function 'posicionX-val :lambda-list '(m))
(cl:defmethod posicionX-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:posicionX-val is deprecated.  Use lcm_to_ros-msg:posicionX instead.")
  (posicionX m))

(cl:ensure-generic-function 'posicionY-val :lambda-list '(m))
(cl:defmethod posicionY-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:posicionY-val is deprecated.  Use lcm_to_ros-msg:posicionY instead.")
  (posicionY m))

(cl:ensure-generic-function 'velocidadRel-val :lambda-list '(m))
(cl:defmethod velocidadRel-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidadRel-val is deprecated.  Use lcm_to_ros-msg:velocidadRel instead.")
  (velocidadRel m))

(cl:ensure-generic-function 'aceleracionX-val :lambda-list '(m))
(cl:defmethod aceleracionX-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:aceleracionX-val is deprecated.  Use lcm_to_ros-msg:aceleracionX instead.")
  (aceleracionX m))

(cl:ensure-generic-function 'longitud-val :lambda-list '(m))
(cl:defmethod longitud-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:longitud-val is deprecated.  Use lcm_to_ros-msg:longitud instead.")
  (longitud m))

(cl:ensure-generic-function 'ancho-val :lambda-list '(m))
(cl:defmethod ancho-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:ancho-val is deprecated.  Use lcm_to_ros-msg:ancho instead.")
  (ancho m))

(cl:ensure-generic-function 'angulo-val :lambda-list '(m))
(cl:defmethod angulo-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:angulo-val is deprecated.  Use lcm_to_ros-msg:angulo instead.")
  (angulo m))

(cl:ensure-generic-function 'angleRate-val :lambda-list '(m))
(cl:defmethod angleRate-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:angleRate-val is deprecated.  Use lcm_to_ros-msg:angleRate instead.")
  (angleRate m))

(cl:ensure-generic-function 'scaleChange-val :lambda-list '(m))
(cl:defmethod scaleChange-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:scaleChange-val is deprecated.  Use lcm_to_ros-msg:scaleChange instead.")
  (scaleChange m))

(cl:ensure-generic-function 'edad-val :lambda-list '(m))
(cl:defmethod edad-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:edad-val is deprecated.  Use lcm_to_ros-msg:edad instead.")
  (edad m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:id-val is deprecated.  Use lcm_to_ros-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'tipo-val :lambda-list '(m))
(cl:defmethod tipo-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tipo-val is deprecated.  Use lcm_to_ros-msg:tipo instead.")
  (tipo m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:status-val is deprecated.  Use lcm_to_ros-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'carril-val :lambda-list '(m))
(cl:defmethod carril-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:carril-val is deprecated.  Use lcm_to_ros-msg:carril instead.")
  (carril m))

(cl:ensure-generic-function 'flags-val :lambda-list '(m))
(cl:defmethod flags-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:flags-val is deprecated.  Use lcm_to_ros-msg:flags instead.")
  (flags m))

(cl:ensure-generic-function 'intermitentes-val :lambda-list '(m))
(cl:defmethod intermitentes-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:intermitentes-val is deprecated.  Use lcm_to_ros-msg:intermitentes instead.")
  (intermitentes m))

(cl:ensure-generic-function 'cutInOut-val :lambda-list '(m))
(cl:defmethod cutInOut-val ((m <mobileye_obstaculo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:cutInOut-val is deprecated.  Use lcm_to_ros-msg:cutInOut instead.")
  (cutInOut m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mobileye_obstaculo>) ostream)
  "Serializes a message object of type '<mobileye_obstaculo>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'posicionX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'posicionY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocidadRel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'aceleracionX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'longitud))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ancho))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angulo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angleRate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'scaleChange))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'edad)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tipo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'carril)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flags)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'intermitentes)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cutInOut)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mobileye_obstaculo>) istream)
  "Deserializes a message object of type '<mobileye_obstaculo>"
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
    (cl:setf (cl:slot-value msg 'posicionX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'posicionY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidadRel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'aceleracionX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitud) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ancho) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angulo) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angleRate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'scaleChange) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'edad) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tipo)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'carril)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flags)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'intermitentes)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cutInOut)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mobileye_obstaculo>)))
  "Returns string type for a message object of type '<mobileye_obstaculo>"
  "lcm_to_ros/mobileye_obstaculo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mobileye_obstaculo)))
  "Returns string type for a message object of type 'mobileye_obstaculo"
  "lcm_to_ros/mobileye_obstaculo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mobileye_obstaculo>)))
  "Returns md5sum for a message object of type '<mobileye_obstaculo>"
  "089b186e41a459d4bb6e84f175bf79ab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mobileye_obstaculo)))
  "Returns md5sum for a message object of type 'mobileye_obstaculo"
  "089b186e41a459d4bb6e84f175bf79ab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mobileye_obstaculo>)))
  "Returns full string definition for message of type '<mobileye_obstaculo>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%float32             posicionX~%float32             posicionY~%float32             velocidadRel~%float32             aceleracionX~%float32             longitud~%float32             ancho~%float32             angulo~%float32             angleRate~%float32             scaleChange~%int16               edad~%byte                id~%byte                tipo~%byte                status~%byte                carril~%byte                flags~%byte                intermitentes~%byte                cutInOut~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mobileye_obstaculo)))
  "Returns full string definition for message of type 'mobileye_obstaculo"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%float32             posicionX~%float32             posicionY~%float32             velocidadRel~%float32             aceleracionX~%float32             longitud~%float32             ancho~%float32             angulo~%float32             angleRate~%float32             scaleChange~%int16               edad~%byte                id~%byte                tipo~%byte                status~%byte                carril~%byte                flags~%byte                intermitentes~%byte                cutInOut~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mobileye_obstaculo>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     2
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mobileye_obstaculo>))
  "Converts a ROS message object to a list"
  (cl:list 'mobileye_obstaculo
    (cl:cons ':timestamp_sec (timestamp_sec msg))
    (cl:cons ':timestamp_nsec (timestamp_nsec msg))
    (cl:cons ':posicionX (posicionX msg))
    (cl:cons ':posicionY (posicionY msg))
    (cl:cons ':velocidadRel (velocidadRel msg))
    (cl:cons ':aceleracionX (aceleracionX msg))
    (cl:cons ':longitud (longitud msg))
    (cl:cons ':ancho (ancho msg))
    (cl:cons ':angulo (angulo msg))
    (cl:cons ':angleRate (angleRate msg))
    (cl:cons ':scaleChange (scaleChange msg))
    (cl:cons ':edad (edad msg))
    (cl:cons ':id (id msg))
    (cl:cons ':tipo (tipo msg))
    (cl:cons ':status (status msg))
    (cl:cons ':carril (carril msg))
    (cl:cons ':flags (flags msg))
    (cl:cons ':intermitentes (intermitentes msg))
    (cl:cons ':cutInOut (cutInOut msg))
))
