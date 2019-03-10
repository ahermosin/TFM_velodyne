; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude osm_waypoint.msg.html

(cl:defclass <osm_waypoint> (roslisp-msg-protocol:ros-message)
  ((latitud
    :reader latitud
    :initarg :latitud
    :type cl:float
    :initform 0.0)
   (longitud
    :reader longitud
    :initarg :longitud
    :type cl:float
    :initform 0.0)
   (orientacion
    :reader orientacion
    :initarg :orientacion
    :type cl:float
    :initform 0.0))
)

(cl:defclass osm_waypoint (<osm_waypoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <osm_waypoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'osm_waypoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<osm_waypoint> is deprecated: use lcm_to_ros-msg:osm_waypoint instead.")))

(cl:ensure-generic-function 'latitud-val :lambda-list '(m))
(cl:defmethod latitud-val ((m <osm_waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:latitud-val is deprecated.  Use lcm_to_ros-msg:latitud instead.")
  (latitud m))

(cl:ensure-generic-function 'longitud-val :lambda-list '(m))
(cl:defmethod longitud-val ((m <osm_waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:longitud-val is deprecated.  Use lcm_to_ros-msg:longitud instead.")
  (longitud m))

(cl:ensure-generic-function 'orientacion-val :lambda-list '(m))
(cl:defmethod orientacion-val ((m <osm_waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:orientacion-val is deprecated.  Use lcm_to_ros-msg:orientacion instead.")
  (orientacion m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <osm_waypoint>) ostream)
  "Serializes a message object of type '<osm_waypoint>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'latitud))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'longitud))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'orientacion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <osm_waypoint>) istream)
  "Deserializes a message object of type '<osm_waypoint>"
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
    (cl:setf (cl:slot-value msg 'orientacion) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<osm_waypoint>)))
  "Returns string type for a message object of type '<osm_waypoint>"
  "lcm_to_ros/osm_waypoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'osm_waypoint)))
  "Returns string type for a message object of type 'osm_waypoint"
  "lcm_to_ros/osm_waypoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<osm_waypoint>)))
  "Returns md5sum for a message object of type '<osm_waypoint>"
  "381e9e73dfbceb05072087b2ae24cbf1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'osm_waypoint)))
  "Returns md5sum for a message object of type 'osm_waypoint"
  "381e9e73dfbceb05072087b2ae24cbf1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<osm_waypoint>)))
  "Returns full string definition for message of type '<osm_waypoint>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%float64             latitud~%float64             longitud~%float64             orientacion~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'osm_waypoint)))
  "Returns full string definition for message of type 'osm_waypoint"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%float64             latitud~%float64             longitud~%float64             orientacion~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <osm_waypoint>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <osm_waypoint>))
  "Converts a ROS message object to a list"
  (cl:list 'osm_waypoint
    (cl:cons ':latitud (latitud msg))
    (cl:cons ':longitud (longitud msg))
    (cl:cons ':orientacion (orientacion msg))
))
