;; Auto-generated. Do not edit!


(when (boundp 'pcl_segment::observationRPY)
  (if (not (find-package "PCL_SEGMENT"))
    (make-package "PCL_SEGMENT"))
  (shadow 'observationRPY (find-package "PCL_SEGMENT")))
(unless (find-package "PCL_SEGMENT::OBSERVATIONRPY")
  (make-package "PCL_SEGMENT::OBSERVATIONRPY"))

(in-package "ROS")
;;//! \htmlinclude observationRPY.msg.html


(defclass pcl_segment::observationRPY
  :super ros::object
  :slots (_position _is_Known ))

(defmethod pcl_segment::observationRPY
  (:init
   (&key
    ((:position __position) (instance pcl_segment::positionRPY :init))
    ((:is_Known __is_Known) nil)
    )
   (send-super :init)
   (setq _position __position)
   (setq _is_Known __is_Known)
   self)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:is_Known
   (&optional __is_Known)
   (if __is_Known (setq _is_Known __is_Known)) _is_Known)
  (:serialization-length
   ()
   (+
    ;; pcl_segment/positionRPY _position
    (send _position :serialization-length)
    ;; bool _is_Known
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; pcl_segment/positionRPY _position
       (send _position :serialize s)
     ;; bool _is_Known
       (if _is_Known (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; pcl_segment/positionRPY _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; bool _is_Known
     (setq _is_Known (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get pcl_segment::observationRPY :md5sum-) "4dd6d3d5c4e65b8b85418ed0108e97f8")
(setf (get pcl_segment::observationRPY :datatype-) "pcl_segment/observationRPY")
(setf (get pcl_segment::observationRPY :definition-)
      "pcl_segment/positionRPY position
bool is_Known

================================================================================
MSG: pcl_segment/positionRPY
float64 x
float64 y
float64 z
float64 roll
float64 pitch
float64 yaw
time stamp

")



(provide :pcl_segment/observationRPY "4dd6d3d5c4e65b8b85418ed0108e97f8")


