; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude ibeo_objetos.msg.html

(cl:defclass <ibeo_objetos> (roslisp-msg-protocol:ros-message)
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
   (n_objetos
    :reader n_objetos
    :initarg :n_objetos
    :type cl:fixnum
    :initform 0)
   (objetos
    :reader objetos
    :initarg :objetos
    :type (cl:vector lcm_to_ros-msg:ibeo_objeto)
   :initform (cl:make-array 0 :element-type 'lcm_to_ros-msg:ibeo_objeto :initial-element (cl:make-instance 'lcm_to_ros-msg:ibeo_objeto))))
)

(cl:defclass ibeo_objetos (<ibeo_objetos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ibeo_objetos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ibeo_objetos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<ibeo_objetos> is deprecated: use lcm_to_ros-msg:ibeo_objetos instead.")))

(cl:ensure-generic-function 'timestamp_sec-val :lambda-list '(m))
(cl:defmethod timestamp_sec-val ((m <ibeo_objetos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_sec-val is deprecated.  Use lcm_to_ros-msg:timestamp_sec instead.")
  (timestamp_sec m))

(cl:ensure-generic-function 'timestamp_nsec-val :lambda-list '(m))
(cl:defmethod timestamp_nsec-val ((m <ibeo_objetos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:timestamp_nsec-val is deprecated.  Use lcm_to_ros-msg:timestamp_nsec instead.")
  (timestamp_nsec m))

(cl:ensure-generic-function 'n_objetos-val :lambda-list '(m))
(cl:defmethod n_objetos-val ((m <ibeo_objetos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:n_objetos-val is deprecated.  Use lcm_to_ros-msg:n_objetos instead.")
  (n_objetos m))

(cl:ensure-generic-function 'objetos-val :lambda-list '(m))
(cl:defmethod objetos-val ((m <ibeo_objetos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:objetos-val is deprecated.  Use lcm_to_ros-msg:objetos instead.")
  (objetos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ibeo_objetos>) ostream)
  "Serializes a message object of type '<ibeo_objetos>"
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
  (cl:let* ((signed (cl:slot-value msg 'n_objetos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objetos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objetos))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ibeo_objetos>) istream)
  "Deserializes a message object of type '<ibeo_objetos>"
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
      (cl:setf (cl:slot-value msg 'n_objetos) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objetos) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objetos)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'lcm_to_ros-msg:ibeo_objeto))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ibeo_objetos>)))
  "Returns string type for a message object of type '<ibeo_objetos>"
  "lcm_to_ros/ibeo_objetos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ibeo_objetos)))
  "Returns string type for a message object of type 'ibeo_objetos"
  "lcm_to_ros/ibeo_objetos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ibeo_objetos>)))
  "Returns md5sum for a message object of type '<ibeo_objetos>"
  "b4a6eb791391a2364ff9033fffb47fbe")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ibeo_objetos)))
  "Returns md5sum for a message object of type 'ibeo_objetos"
  "b4a6eb791391a2364ff9033fffb47fbe")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ibeo_objetos>)))
  "Returns full string definition for message of type '<ibeo_objetos>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%int16               n_objetos~%ibeo_objeto[]       objetos~%~%================================================================================~%MSG: lcm_to_ros/ibeo_objeto~%#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%int16               id~%float32             age~%float32             velocidad_relativa_x~%float32             velocidad_relativa_y~%float32             velocidad_absoluta_x~%float32             velocidad_absoluta_y~%float32             velocidad_absoluta_sigma_x~%float32             velocidad_absoluta_sigma_y~%float32             bounding_box_centro_x~%float32             bounding_box_centro_y~%float32             bounding_box_largo~%float32             bounding_box_ancho~%float32             object_box_centro_x~%float32             object_box_centro_y~%float32             object_box_orientacion~%float32             object_box_size_x~%float32             object_box_size_y~%int16               clasificacion~%float32             clasificacion_age~%float32             clasificacion_certeza~%float32             punto_cercano_x~%float32             punto_cercano_y~%float32             punto_referencia_x~%float32             punto_referencia_y~%float32             punto_referencia_sigma_x~%float32             punto_referencia_sigma_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ibeo_objetos)))
  "Returns full string definition for message of type 'ibeo_objetos"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%int32               timestamp_sec~%int32               timestamp_nsec~%int16               n_objetos~%ibeo_objeto[]       objetos~%~%================================================================================~%MSG: lcm_to_ros/ibeo_objeto~%#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%int16               id~%float32             age~%float32             velocidad_relativa_x~%float32             velocidad_relativa_y~%float32             velocidad_absoluta_x~%float32             velocidad_absoluta_y~%float32             velocidad_absoluta_sigma_x~%float32             velocidad_absoluta_sigma_y~%float32             bounding_box_centro_x~%float32             bounding_box_centro_y~%float32             bounding_box_largo~%float32             bounding_box_ancho~%float32             object_box_centro_x~%float32             object_box_centro_y~%float32             object_box_orientacion~%float32             object_box_size_x~%float32             object_box_size_y~%int16               clasificacion~%float32             clasificacion_age~%float32             clasificacion_certeza~%float32             punto_cercano_x~%float32             punto_cercano_y~%float32             punto_referencia_x~%float32             punto_referencia_y~%float32             punto_referencia_sigma_x~%float32             punto_referencia_sigma_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ibeo_objetos>))
  (cl:+ 0
     4
     4
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objetos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ibeo_objetos>))
  "Converts a ROS message object to a list"
  (cl:list 'ibeo_objetos
    (cl:cons ':timestamp_sec (timestamp_sec msg))
    (cl:cons ':timestamp_nsec (timestamp_nsec msg))
    (cl:cons ':n_objetos (n_objetos msg))
    (cl:cons ':objetos (objetos msg))
))
