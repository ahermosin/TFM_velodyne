; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude example_type.msg.html

(cl:defclass <example_type> (roslisp-msg-protocol:ros-message)
  ((str
    :reader str
    :initarg :str
    :type cl:string
    :initform "")
   (flag
    :reader flag
    :initarg :flag
    :type cl:boolean
    :initform cl:nil)
   (gnash
    :reader gnash
    :initarg :gnash
    :type cl:integer
    :initform 0)
   (i8_scalar
    :reader i8_scalar
    :initarg :i8_scalar
    :type cl:fixnum
    :initform 0)
   (i8_array
    :reader i8_array
    :initarg :i8_array
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0))
   (i16_scalar
    :reader i16_scalar
    :initarg :i16_scalar
    :type cl:fixnum
    :initform 0)
   (i16_array
    :reader i16_array
    :initarg :i16_array
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0))
   (i32_scalar
    :reader i32_scalar
    :initarg :i32_scalar
    :type cl:integer
    :initform 0)
   (i32_array
    :reader i32_array
    :initarg :i32_array
    :type (cl:vector cl:integer)
   :initform (cl:make-array 2 :element-type 'cl:integer :initial-element 0))
   (i64_scalar
    :reader i64_scalar
    :initarg :i64_scalar
    :type cl:integer
    :initform 0)
   (i64_array
    :reader i64_array
    :initarg :i64_array
    :type (cl:vector cl:integer)
   :initform (cl:make-array 2 :element-type 'cl:integer :initial-element 0))
   (flt_scalar
    :reader flt_scalar
    :initarg :flt_scalar
    :type cl:float
    :initform 0.0)
   (flt_array
    :reader flt_array
    :initarg :flt_array
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (dbl_scalar
    :reader dbl_scalar
    :initarg :dbl_scalar
    :type cl:float
    :initform 0.0)
   (dbl_array
    :reader dbl_array
    :initarg :dbl_array
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (variable_length_array
    :reader variable_length_array
    :initarg :variable_length_array
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (num_channels
    :reader num_channels
    :initarg :num_channels
    :type cl:integer
    :initform 0)
   (channels
    :reader channels
    :initarg :channels
    :type (cl:vector lcm_to_ros-msg:simple_channel)
   :initform (cl:make-array 0 :element-type 'lcm_to_ros-msg:simple_channel :initial-element (cl:make-instance 'lcm_to_ros-msg:simple_channel))))
)

(cl:defclass example_type (<example_type>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <example_type>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'example_type)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<example_type> is deprecated: use lcm_to_ros-msg:example_type instead.")))

(cl:ensure-generic-function 'str-val :lambda-list '(m))
(cl:defmethod str-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:str-val is deprecated.  Use lcm_to_ros-msg:str instead.")
  (str m))

(cl:ensure-generic-function 'flag-val :lambda-list '(m))
(cl:defmethod flag-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:flag-val is deprecated.  Use lcm_to_ros-msg:flag instead.")
  (flag m))

(cl:ensure-generic-function 'gnash-val :lambda-list '(m))
(cl:defmethod gnash-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:gnash-val is deprecated.  Use lcm_to_ros-msg:gnash instead.")
  (gnash m))

(cl:ensure-generic-function 'i8_scalar-val :lambda-list '(m))
(cl:defmethod i8_scalar-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:i8_scalar-val is deprecated.  Use lcm_to_ros-msg:i8_scalar instead.")
  (i8_scalar m))

(cl:ensure-generic-function 'i8_array-val :lambda-list '(m))
(cl:defmethod i8_array-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:i8_array-val is deprecated.  Use lcm_to_ros-msg:i8_array instead.")
  (i8_array m))

(cl:ensure-generic-function 'i16_scalar-val :lambda-list '(m))
(cl:defmethod i16_scalar-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:i16_scalar-val is deprecated.  Use lcm_to_ros-msg:i16_scalar instead.")
  (i16_scalar m))

(cl:ensure-generic-function 'i16_array-val :lambda-list '(m))
(cl:defmethod i16_array-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:i16_array-val is deprecated.  Use lcm_to_ros-msg:i16_array instead.")
  (i16_array m))

(cl:ensure-generic-function 'i32_scalar-val :lambda-list '(m))
(cl:defmethod i32_scalar-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:i32_scalar-val is deprecated.  Use lcm_to_ros-msg:i32_scalar instead.")
  (i32_scalar m))

(cl:ensure-generic-function 'i32_array-val :lambda-list '(m))
(cl:defmethod i32_array-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:i32_array-val is deprecated.  Use lcm_to_ros-msg:i32_array instead.")
  (i32_array m))

(cl:ensure-generic-function 'i64_scalar-val :lambda-list '(m))
(cl:defmethod i64_scalar-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:i64_scalar-val is deprecated.  Use lcm_to_ros-msg:i64_scalar instead.")
  (i64_scalar m))

(cl:ensure-generic-function 'i64_array-val :lambda-list '(m))
(cl:defmethod i64_array-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:i64_array-val is deprecated.  Use lcm_to_ros-msg:i64_array instead.")
  (i64_array m))

(cl:ensure-generic-function 'flt_scalar-val :lambda-list '(m))
(cl:defmethod flt_scalar-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:flt_scalar-val is deprecated.  Use lcm_to_ros-msg:flt_scalar instead.")
  (flt_scalar m))

(cl:ensure-generic-function 'flt_array-val :lambda-list '(m))
(cl:defmethod flt_array-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:flt_array-val is deprecated.  Use lcm_to_ros-msg:flt_array instead.")
  (flt_array m))

(cl:ensure-generic-function 'dbl_scalar-val :lambda-list '(m))
(cl:defmethod dbl_scalar-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:dbl_scalar-val is deprecated.  Use lcm_to_ros-msg:dbl_scalar instead.")
  (dbl_scalar m))

(cl:ensure-generic-function 'dbl_array-val :lambda-list '(m))
(cl:defmethod dbl_array-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:dbl_array-val is deprecated.  Use lcm_to_ros-msg:dbl_array instead.")
  (dbl_array m))

(cl:ensure-generic-function 'variable_length_array-val :lambda-list '(m))
(cl:defmethod variable_length_array-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:variable_length_array-val is deprecated.  Use lcm_to_ros-msg:variable_length_array instead.")
  (variable_length_array m))

(cl:ensure-generic-function 'num_channels-val :lambda-list '(m))
(cl:defmethod num_channels-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:num_channels-val is deprecated.  Use lcm_to_ros-msg:num_channels instead.")
  (num_channels m))

(cl:ensure-generic-function 'channels-val :lambda-list '(m))
(cl:defmethod channels-val ((m <example_type>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:channels-val is deprecated.  Use lcm_to_ros-msg:channels instead.")
  (channels m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <example_type>) ostream)
  "Serializes a message object of type '<example_type>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'str))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'str))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gnash)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'i8_scalar)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'i8_array))
  (cl:let* ((signed (cl:slot-value msg 'i16_scalar)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'i16_array))
  (cl:let* ((signed (cl:slot-value msg 'i32_scalar)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'i32_array))
  (cl:let* ((signed (cl:slot-value msg 'i64_scalar)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    ))
   (cl:slot-value msg 'i64_array))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flt_scalar))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'flt_array))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dbl_scalar))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'dbl_array))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'variable_length_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'variable_length_array))
  (cl:let* ((signed (cl:slot-value msg 'num_channels)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'channels))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'channels))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <example_type>) istream)
  "Deserializes a message object of type '<example_type>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'str) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'str) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gnash)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'i8_scalar) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:setf (cl:slot-value msg 'i8_array) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'i8_array)))
    (cl:dotimes (i 2)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'i16_scalar) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (cl:setf (cl:slot-value msg 'i16_array) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'i16_array)))
    (cl:dotimes (i 2)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'i32_scalar) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:setf (cl:slot-value msg 'i32_array) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'i32_array)))
    (cl:dotimes (i 2)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'i64_scalar) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  (cl:setf (cl:slot-value msg 'i64_array) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'i64_array)))
    (cl:dotimes (i 2)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flt_scalar) (roslisp-utils:decode-single-float-bits bits)))
  (cl:setf (cl:slot-value msg 'flt_array) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'flt_array)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dbl_scalar) (roslisp-utils:decode-double-float-bits bits)))
  (cl:setf (cl:slot-value msg 'dbl_array) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'dbl_array)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'variable_length_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'variable_length_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_channels) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'channels) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'channels)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'lcm_to_ros-msg:simple_channel))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<example_type>)))
  "Returns string type for a message object of type '<example_type>"
  "lcm_to_ros/example_type")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'example_type)))
  "Returns string type for a message object of type 'example_type"
  "lcm_to_ros/example_type")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<example_type>)))
  "Returns md5sum for a message object of type '<example_type>"
  "1dc0698e415584c20abf27e7abb42161")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'example_type)))
  "Returns md5sum for a message object of type 'example_type"
  "1dc0698e415584c20abf27e7abb42161")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<example_type>)))
  "Returns full string definition for message of type '<example_type>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          jue 07 mar 2019 13:27:48 CET~%#~%#######################################################################~%string              str~%bool                flag~%byte                gnash~%int8                i8_scalar~%int8[2]             i8_array~%int16               i16_scalar~%int16[2]            i16_array~%int32               i32_scalar~%int32[2]            i32_array~%int64               i64_scalar~%int64[2]            i64_array~%float32             flt_scalar~%float32[2]          flt_array~%float64             dbl_scalar~%float64[2]          dbl_array~%float64[]           variable_length_array~%int32               num_channels~%simple_channel[]    channels~%~%================================================================================~%MSG: lcm_to_ros/simple_channel~%#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          jue 07 mar 2019 13:27:48 CET~%#~%#######################################################################~%string              name~%float64             value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'example_type)))
  "Returns full string definition for message of type 'example_type"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          jue 07 mar 2019 13:27:48 CET~%#~%#######################################################################~%string              str~%bool                flag~%byte                gnash~%int8                i8_scalar~%int8[2]             i8_array~%int16               i16_scalar~%int16[2]            i16_array~%int32               i32_scalar~%int32[2]            i32_array~%int64               i64_scalar~%int64[2]            i64_array~%float32             flt_scalar~%float32[2]          flt_array~%float64             dbl_scalar~%float64[2]          dbl_array~%float64[]           variable_length_array~%int32               num_channels~%simple_channel[]    channels~%~%================================================================================~%MSG: lcm_to_ros/simple_channel~%#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          jue 07 mar 2019 13:27:48 CET~%#~%#######################################################################~%string              name~%float64             value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <example_type>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'str))
     1
     1
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'i8_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     2
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'i16_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'i32_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'i64_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'flt_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'dbl_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'variable_length_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'channels) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <example_type>))
  "Converts a ROS message object to a list"
  (cl:list 'example_type
    (cl:cons ':str (str msg))
    (cl:cons ':flag (flag msg))
    (cl:cons ':gnash (gnash msg))
    (cl:cons ':i8_scalar (i8_scalar msg))
    (cl:cons ':i8_array (i8_array msg))
    (cl:cons ':i16_scalar (i16_scalar msg))
    (cl:cons ':i16_array (i16_array msg))
    (cl:cons ':i32_scalar (i32_scalar msg))
    (cl:cons ':i32_array (i32_array msg))
    (cl:cons ':i64_scalar (i64_scalar msg))
    (cl:cons ':i64_array (i64_array msg))
    (cl:cons ':flt_scalar (flt_scalar msg))
    (cl:cons ':flt_array (flt_array msg))
    (cl:cons ':dbl_scalar (dbl_scalar msg))
    (cl:cons ':dbl_array (dbl_array msg))
    (cl:cons ':variable_length_array (variable_length_array msg))
    (cl:cons ':num_channels (num_channels msg))
    (cl:cons ':channels (channels msg))
))
