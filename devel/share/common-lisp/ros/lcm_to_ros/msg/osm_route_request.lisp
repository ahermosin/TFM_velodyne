; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude osm_route_request.msg.html

(cl:defclass <osm_route_request> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (inicio
    :reader inicio
    :initarg :inicio
    :type lcm_to_ros-msg:osm_waypoint
    :initform (cl:make-instance 'lcm_to_ros-msg:osm_waypoint))
   (fin
    :reader fin
    :initarg :fin
    :type lcm_to_ros-msg:osm_waypoint
    :initform (cl:make-instance 'lcm_to_ros-msg:osm_waypoint))
   (n_etapas
    :reader n_etapas
    :initarg :n_etapas
    :type cl:integer
    :initform 0)
   (etapas
    :reader etapas
    :initarg :etapas
    :type (cl:vector lcm_to_ros-msg:osm_waypoint)
   :initform (cl:make-array 0 :element-type 'lcm_to_ros-msg:osm_waypoint :initial-element (cl:make-instance 'lcm_to_ros-msg:osm_waypoint))))
)

(cl:defclass osm_route_request (<osm_route_request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <osm_route_request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'osm_route_request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<osm_route_request> is deprecated: use lcm_to_ros-msg:osm_route_request instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <osm_route_request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:id-val is deprecated.  Use lcm_to_ros-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'inicio-val :lambda-list '(m))
(cl:defmethod inicio-val ((m <osm_route_request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:inicio-val is deprecated.  Use lcm_to_ros-msg:inicio instead.")
  (inicio m))

(cl:ensure-generic-function 'fin-val :lambda-list '(m))
(cl:defmethod fin-val ((m <osm_route_request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:fin-val is deprecated.  Use lcm_to_ros-msg:fin instead.")
  (fin m))

(cl:ensure-generic-function 'n_etapas-val :lambda-list '(m))
(cl:defmethod n_etapas-val ((m <osm_route_request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:n_etapas-val is deprecated.  Use lcm_to_ros-msg:n_etapas instead.")
  (n_etapas m))

(cl:ensure-generic-function 'etapas-val :lambda-list '(m))
(cl:defmethod etapas-val ((m <osm_route_request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:etapas-val is deprecated.  Use lcm_to_ros-msg:etapas instead.")
  (etapas m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <osm_route_request>) ostream)
  "Serializes a message object of type '<osm_route_request>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'inicio) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'fin) ostream)
  (cl:let* ((signed (cl:slot-value msg 'n_etapas)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'etapas))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'etapas))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <osm_route_request>) istream)
  "Deserializes a message object of type '<osm_route_request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'inicio) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'fin) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'n_etapas) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'etapas) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'etapas)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'lcm_to_ros-msg:osm_waypoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<osm_route_request>)))
  "Returns string type for a message object of type '<osm_route_request>"
  "lcm_to_ros/osm_route_request")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'osm_route_request)))
  "Returns string type for a message object of type 'osm_route_request"
  "lcm_to_ros/osm_route_request")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<osm_route_request>)))
  "Returns md5sum for a message object of type '<osm_route_request>"
  "c8617b42a17e4b21ee29ddac6f86b262")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'osm_route_request)))
  "Returns md5sum for a message object of type 'osm_route_request"
  "c8617b42a17e4b21ee29ddac6f86b262")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<osm_route_request>)))
  "Returns full string definition for message of type '<osm_route_request>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int32               id~%osm_waypoint        inicio~%osm_waypoint        fin~%int32               n_etapas~%osm_waypoint[]      etapas~%~%================================================================================~%MSG: lcm_to_ros/osm_waypoint~%#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%float64             latitud~%float64             longitud~%float64             orientacion~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'osm_route_request)))
  "Returns full string definition for message of type 'osm_route_request"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%int32               id~%osm_waypoint        inicio~%osm_waypoint        fin~%int32               n_etapas~%osm_waypoint[]      etapas~%~%================================================================================~%MSG: lcm_to_ros/osm_waypoint~%#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:17 CET~%#~%#######################################################################~%float64             latitud~%float64             longitud~%float64             orientacion~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <osm_route_request>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'inicio))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'fin))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'etapas) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <osm_route_request>))
  "Converts a ROS message object to a list"
  (cl:list 'osm_route_request
    (cl:cons ':id (id msg))
    (cl:cons ':inicio (inicio msg))
    (cl:cons ':fin (fin msg))
    (cl:cons ':n_etapas (n_etapas msg))
    (cl:cons ':etapas (etapas msg))
))
