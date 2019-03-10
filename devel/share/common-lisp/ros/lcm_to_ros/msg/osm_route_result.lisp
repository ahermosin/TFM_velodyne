; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude osm_route_result.msg.html

(cl:defclass <osm_route_result> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (n_puntos
    :reader n_puntos
    :initarg :n_puntos
    :type cl:integer
    :initform 0)
   (puntos
    :reader puntos
    :initarg :puntos
    :type (cl:vector lcm_to_ros-msg:osm_waypoint)
   :initform (cl:make-array 0 :element-type 'lcm_to_ros-msg:osm_waypoint :initial-element (cl:make-instance 'lcm_to_ros-msg:osm_waypoint))))
)

(cl:defclass osm_route_result (<osm_route_result>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <osm_route_result>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'osm_route_result)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<osm_route_result> is deprecated: use lcm_to_ros-msg:osm_route_result instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <osm_route_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:id-val is deprecated.  Use lcm_to_ros-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'n_puntos-val :lambda-list '(m))
(cl:defmethod n_puntos-val ((m <osm_route_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:n_puntos-val is deprecated.  Use lcm_to_ros-msg:n_puntos instead.")
  (n_puntos m))

(cl:ensure-generic-function 'puntos-val :lambda-list '(m))
(cl:defmethod puntos-val ((m <osm_route_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:puntos-val is deprecated.  Use lcm_to_ros-msg:puntos instead.")
  (puntos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <osm_route_result>) ostream)
  "Serializes a message object of type '<osm_route_result>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'n_puntos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'puntos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'puntos))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <osm_route_result>) istream)
  "Deserializes a message object of type '<osm_route_result>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'n_puntos) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'puntos) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'puntos)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'lcm_to_ros-msg:osm_waypoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<osm_route_result>)))
  "Returns string type for a message object of type '<osm_route_result>"
  "lcm_to_ros/osm_route_result")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'osm_route_result)))
  "Returns string type for a message object of type 'osm_route_result"
  "lcm_to_ros/osm_route_result")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<osm_route_result>)))
  "Returns md5sum for a message object of type '<osm_route_result>"
  "1e17e3fc432d0f2c2a93661fa8d61a75")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'osm_route_result)))
  "Returns md5sum for a message object of type 'osm_route_result"
  "1e17e3fc432d0f2c2a93661fa8d61a75")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<osm_route_result>)))
  "Returns full string definition for message of type '<osm_route_result>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int32               id~%int32               n_puntos~%osm_waypoint[]      puntos~%~%================================================================================~%MSG: lcm_to_ros/osm_waypoint~%#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%float64             latitud~%float64             longitud~%float64             orientacion~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'osm_route_result)))
  "Returns full string definition for message of type 'osm_route_result"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int32               id~%int32               n_puntos~%osm_waypoint[]      puntos~%~%================================================================================~%MSG: lcm_to_ros/osm_waypoint~%#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%float64             latitud~%float64             longitud~%float64             orientacion~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <osm_route_result>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'puntos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <osm_route_result>))
  "Converts a ROS message object to a list"
  (cl:list 'osm_route_result
    (cl:cons ':id (id msg))
    (cl:cons ':n_puntos (n_puntos msg))
    (cl:cons ':puntos (puntos msg))
))
