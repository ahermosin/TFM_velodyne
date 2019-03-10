;; Auto-generated. Do not edit!


(when (boundp 'lcm_to_ros::example_type)
  (if (not (find-package "LCM_TO_ROS"))
    (make-package "LCM_TO_ROS"))
  (shadow 'example_type (find-package "LCM_TO_ROS")))
(unless (find-package "LCM_TO_ROS::EXAMPLE_TYPE")
  (make-package "LCM_TO_ROS::EXAMPLE_TYPE"))

(in-package "ROS")
;;//! \htmlinclude example_type.msg.html


(defclass lcm_to_ros::example_type
  :super ros::object
  :slots (_str _flag _gnash _i8_scalar _i8_array _i16_scalar _i16_array _i32_scalar _i32_array _i64_scalar _i64_array _flt_scalar _flt_array _dbl_scalar _dbl_array _variable_length_array _num_channels _channels ))

(defmethod lcm_to_ros::example_type
  (:init
   (&key
    ((:str __str) "")
    ((:flag __flag) nil)
    ((:gnash __gnash) 0)
    ((:i8_scalar __i8_scalar) 0)
    ((:i8_array __i8_array) (make-array 2 :initial-element 0 :element-type :integer))
    ((:i16_scalar __i16_scalar) 0)
    ((:i16_array __i16_array) (make-array 2 :initial-element 0 :element-type :integer))
    ((:i32_scalar __i32_scalar) 0)
    ((:i32_array __i32_array) (make-array 2 :initial-element 0 :element-type :integer))
    ((:i64_scalar __i64_scalar) 0)
    ((:i64_array __i64_array) (make-array 2 :initial-element 0 :element-type :integer))
    ((:flt_scalar __flt_scalar) 0.0)
    ((:flt_array __flt_array) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:dbl_scalar __dbl_scalar) 0.0)
    ((:dbl_array __dbl_array) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:variable_length_array __variable_length_array) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:num_channels __num_channels) 0)
    ((:channels __channels) (let (r) (dotimes (i 0) (push (instance lcm_to_ros::simple_channel :init) r)) r))
    )
   (send-super :init)
   (setq _str (string __str))
   (setq _flag __flag)
   (setq _gnash (round __gnash))
   (setq _i8_scalar (round __i8_scalar))
   (setq _i8_array __i8_array)
   (setq _i16_scalar (round __i16_scalar))
   (setq _i16_array __i16_array)
   (setq _i32_scalar (round __i32_scalar))
   (setq _i32_array __i32_array)
   (setq _i64_scalar (round __i64_scalar))
   (setq _i64_array __i64_array)
   (setq _flt_scalar (float __flt_scalar))
   (setq _flt_array __flt_array)
   (setq _dbl_scalar (float __dbl_scalar))
   (setq _dbl_array __dbl_array)
   (setq _variable_length_array __variable_length_array)
   (setq _num_channels (round __num_channels))
   (setq _channels __channels)
   self)
  (:str
   (&optional __str)
   (if __str (setq _str __str)) _str)
  (:flag
   (&optional __flag)
   (if __flag (setq _flag __flag)) _flag)
  (:gnash
   (&optional __gnash)
   (if __gnash (setq _gnash __gnash)) _gnash)
  (:i8_scalar
   (&optional __i8_scalar)
   (if __i8_scalar (setq _i8_scalar __i8_scalar)) _i8_scalar)
  (:i8_array
   (&optional __i8_array)
   (if __i8_array (setq _i8_array __i8_array)) _i8_array)
  (:i16_scalar
   (&optional __i16_scalar)
   (if __i16_scalar (setq _i16_scalar __i16_scalar)) _i16_scalar)
  (:i16_array
   (&optional __i16_array)
   (if __i16_array (setq _i16_array __i16_array)) _i16_array)
  (:i32_scalar
   (&optional __i32_scalar)
   (if __i32_scalar (setq _i32_scalar __i32_scalar)) _i32_scalar)
  (:i32_array
   (&optional __i32_array)
   (if __i32_array (setq _i32_array __i32_array)) _i32_array)
  (:i64_scalar
   (&optional __i64_scalar)
   (if __i64_scalar (setq _i64_scalar __i64_scalar)) _i64_scalar)
  (:i64_array
   (&optional __i64_array)
   (if __i64_array (setq _i64_array __i64_array)) _i64_array)
  (:flt_scalar
   (&optional __flt_scalar)
   (if __flt_scalar (setq _flt_scalar __flt_scalar)) _flt_scalar)
  (:flt_array
   (&optional __flt_array)
   (if __flt_array (setq _flt_array __flt_array)) _flt_array)
  (:dbl_scalar
   (&optional __dbl_scalar)
   (if __dbl_scalar (setq _dbl_scalar __dbl_scalar)) _dbl_scalar)
  (:dbl_array
   (&optional __dbl_array)
   (if __dbl_array (setq _dbl_array __dbl_array)) _dbl_array)
  (:variable_length_array
   (&optional __variable_length_array)
   (if __variable_length_array (setq _variable_length_array __variable_length_array)) _variable_length_array)
  (:num_channels
   (&optional __num_channels)
   (if __num_channels (setq _num_channels __num_channels)) _num_channels)
  (:channels
   (&rest __channels)
   (if (keywordp (car __channels))
       (send* _channels __channels)
     (progn
       (if __channels (setq _channels (car __channels)))
       _channels)))
  (:serialization-length
   ()
   (+
    ;; string _str
    4 (length _str)
    ;; bool _flag
    1
    ;; byte _gnash
    1
    ;; int8 _i8_scalar
    1
    ;; int8[2] _i8_array
    (* 1    2)
    ;; int16 _i16_scalar
    2
    ;; int16[2] _i16_array
    (* 2    2)
    ;; int32 _i32_scalar
    4
    ;; int32[2] _i32_array
    (* 4    2)
    ;; int64 _i64_scalar
    8
    ;; int64[2] _i64_array
    (* 8    2)
    ;; float32 _flt_scalar
    4
    ;; float32[2] _flt_array
    (* 4    2)
    ;; float64 _dbl_scalar
    8
    ;; float64[2] _dbl_array
    (* 8    2)
    ;; float64[] _variable_length_array
    (* 8    (length _variable_length_array)) 4
    ;; int32 _num_channels
    4
    ;; lcm_to_ros/simple_channel[] _channels
    (apply #'+ (send-all _channels :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _str
       (write-long (length _str) s) (princ _str s)
     ;; bool _flag
       (if _flag (write-byte -1 s) (write-byte 0 s))
     ;; byte _gnash
       (write-byte _gnash s)
     ;; int8 _i8_scalar
       (write-byte _i8_scalar s)
     ;; int8[2] _i8_array
     (dotimes (i 2)
       (write-byte (elt _i8_array i) s)
       )
     ;; int16 _i16_scalar
       (write-word _i16_scalar s)
     ;; int16[2] _i16_array
     (dotimes (i 2)
       (write-word (elt _i16_array i) s)
       )
     ;; int32 _i32_scalar
       (write-long _i32_scalar s)
     ;; int32[2] _i32_array
     (dotimes (i 2)
       (write-long (elt _i32_array i) s)
       )
     ;; int64 _i64_scalar
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _i64_scalar (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _i64_scalar) (= (length (_i64_scalar . bv)) 2)) ;; bignum
              (write-long (ash (elt (_i64_scalar . bv) 0) 0) s)
              (write-long (ash (elt (_i64_scalar . bv) 1) -1) s))
             ((and (class _i64_scalar) (= (length (_i64_scalar . bv)) 1)) ;; big1
              (write-long (elt (_i64_scalar . bv) 0) s)
              (write-long (if (>= _i64_scalar 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _i64_scalar s)(write-long (if (>= _i64_scalar 0) 0 #xffffffff) s)))
     ;; int64[2] _i64_array
     (dotimes (i 2)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _i64_array i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _i64_array i)) (= (length ((elt _i64_array i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _i64_array i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _i64_array i) . bv) 1) -1) s))
             ((and (class (elt _i64_array i)) (= (length ((elt _i64_array i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _i64_array i) . bv) 0) s)
              (write-long (if (>= (elt _i64_array i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _i64_array i) s)(write-long (if (>= (elt _i64_array i) 0) 0 #xffffffff) s)))
       )
     ;; float32 _flt_scalar
       (sys::poke _flt_scalar (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[2] _flt_array
     (dotimes (i 2)
       (sys::poke (elt _flt_array i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float64 _dbl_scalar
       (sys::poke _dbl_scalar (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[2] _dbl_array
     (dotimes (i 2)
       (sys::poke (elt _dbl_array i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _variable_length_array
     (write-long (length _variable_length_array) s)
     (dotimes (i (length _variable_length_array))
       (sys::poke (elt _variable_length_array i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; int32 _num_channels
       (write-long _num_channels s)
     ;; lcm_to_ros/simple_channel[] _channels
     (write-long (length _channels) s)
     (dolist (elem _channels)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _str
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _str (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _flag
     (setq _flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; byte _gnash
     (setq _gnash (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _gnash 127) (setq _gnash (- _gnash 256)))
   ;; int8 _i8_scalar
     (setq _i8_scalar (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _i8_scalar 127) (setq _i8_scalar (- _i8_scalar 256)))
   ;; int8[2] _i8_array
   (dotimes (i (length _i8_array))
     (setf (elt _i8_array i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _i8_array i) 127) (setf (elt _i8_array i) (- (elt _i8_array i) 256)))
     )
   ;; int16 _i16_scalar
     (setq _i16_scalar (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16[2] _i16_array
   (dotimes (i (length _i16_array))
     (setf (elt _i16_array i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; int32 _i32_scalar
     (setq _i32_scalar (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[2] _i32_array
   (dotimes (i (length _i32_array))
     (setf (elt _i32_array i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     )
   ;; int64 _i64_scalar
#+(or :alpha :irix6 :x86_64)
      (setf _i64_scalar (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _i64_scalar (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64[2] _i64_array
   (dotimes (i (length _i64_array))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _i64_array i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _i64_array i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;; float32 _flt_scalar
     (setq _flt_scalar (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[2] _flt_array
   (dotimes (i (length _flt_array))
     (setf (elt _flt_array i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float64 _dbl_scalar
     (setq _dbl_scalar (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[2] _dbl_array
   (dotimes (i (length _dbl_array))
     (setf (elt _dbl_array i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[] _variable_length_array
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _variable_length_array (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _variable_length_array i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; int32 _num_channels
     (setq _num_channels (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; lcm_to_ros/simple_channel[] _channels
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _channels (let (r) (dotimes (i n) (push (instance lcm_to_ros::simple_channel :init) r)) r))
     (dolist (elem- _channels)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get lcm_to_ros::example_type :md5sum-) "1dc0698e415584c20abf27e7abb42161")
(setf (get lcm_to_ros::example_type :datatype-) "lcm_to_ros/example_type")
(setf (get lcm_to_ros::example_type :definition-)
      "#######################################################################
# This message was automatically generated by the lcm_to_ros package
# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu
#######################################################################
#
# Source message:    .msg
# Creation:          jue 07 mar 2019 13:27:48 CET
#
#######################################################################
string              str
bool                flag
byte                gnash
int8                i8_scalar
int8[2]             i8_array
int16               i16_scalar
int16[2]            i16_array
int32               i32_scalar
int32[2]            i32_array
int64               i64_scalar
int64[2]            i64_array
float32             flt_scalar
float32[2]          flt_array
float64             dbl_scalar
float64[2]          dbl_array
float64[]           variable_length_array
int32               num_channels
simple_channel[]    channels

================================================================================
MSG: lcm_to_ros/simple_channel
#######################################################################
# This message was automatically generated by the lcm_to_ros package
# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu
#######################################################################
#
# Source message:    .msg
# Creation:          jue 07 mar 2019 13:27:48 CET
#
#######################################################################
string              name
float64             value

")



(provide :lcm_to_ros/example_type "1dc0698e415584c20abf27e7abb42161")


