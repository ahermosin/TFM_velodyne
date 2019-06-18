; Auto-generated. Do not edit!


(cl:in-package pcl_segment-msg)


;//! \htmlinclude observationRPY.msg.html

(cl:defclass <observationRPY> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type pcl_segment-msg:positionRPY
    :initform (cl:make-instance 'pcl_segment-msg:positionRPY))
   (is_Known
    :reader is_Known
    :initarg :is_Known
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass observationRPY (<observationRPY>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <observationRPY>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'observationRPY)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_segment-msg:<observationRPY> is deprecated: use pcl_segment-msg:observationRPY instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <observationRPY>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_segment-msg:position-val is deprecated.  Use pcl_segment-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'is_Known-val :lambda-list '(m))
(cl:defmethod is_Known-val ((m <observationRPY>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_segment-msg:is_Known-val is deprecated.  Use pcl_segment-msg:is_Known instead.")
  (is_Known m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <observationRPY>) ostream)
  "Serializes a message object of type '<observationRPY>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_Known) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <observationRPY>) istream)
  "Deserializes a message object of type '<observationRPY>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:setf (cl:slot-value msg 'is_Known) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<observationRPY>)))
  "Returns string type for a message object of type '<observationRPY>"
  "pcl_segment/observationRPY")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'observationRPY)))
  "Returns string type for a message object of type 'observationRPY"
  "pcl_segment/observationRPY")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<observationRPY>)))
  "Returns md5sum for a message object of type '<observationRPY>"
  "4dd6d3d5c4e65b8b85418ed0108e97f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'observationRPY)))
  "Returns md5sum for a message object of type 'observationRPY"
  "4dd6d3d5c4e65b8b85418ed0108e97f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<observationRPY>)))
  "Returns full string definition for message of type '<observationRPY>"
  (cl:format cl:nil "pcl_segment/positionRPY position~%bool is_Known~%~%================================================================================~%MSG: pcl_segment/positionRPY~%float64 x~%float64 y~%float64 z~%float64 roll~%float64 pitch~%float64 yaw~%time stamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'observationRPY)))
  "Returns full string definition for message of type 'observationRPY"
  (cl:format cl:nil "pcl_segment/positionRPY position~%bool is_Known~%~%================================================================================~%MSG: pcl_segment/positionRPY~%float64 x~%float64 y~%float64 z~%float64 roll~%float64 pitch~%float64 yaw~%time stamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <observationRPY>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <observationRPY>))
  "Converts a ROS message object to a list"
  (cl:list 'observationRPY
    (cl:cons ':position (position msg))
    (cl:cons ':is_Known (is_Known msg))
))
