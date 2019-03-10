; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude can_modulo_estado.msg.html

(cl:defclass <can_modulo_estado> (roslisp-msg-protocol:ros-message)
  ((Timestamp_sec
    :reader Timestamp_sec
    :initarg :Timestamp_sec
    :type cl:integer
    :initform 0)
   (Timestamp_nsec
    :reader Timestamp_nsec
    :initarg :Timestamp_nsec
    :type cl:integer
    :initform 0)
   (IdModulo
    :reader IdModulo
    :initarg :IdModulo
    :type cl:integer
    :initform 0)
   (InputVolA
    :reader InputVolA
    :initarg :InputVolA
    :type cl:float
    :initform 0.0)
   (InputVolB
    :reader InputVolB
    :initarg :InputVolB
    :type cl:float
    :initform 0.0)
   (InputCorrA
    :reader InputCorrA
    :initarg :InputCorrA
    :type cl:float
    :initform 0.0)
   (InputCorrB
    :reader InputCorrB
    :initarg :InputCorrB
    :type cl:float
    :initform 0.0)
   (OutputAnlg1
    :reader OutputAnlg1
    :initarg :OutputAnlg1
    :type cl:float
    :initform 0.0)
   (OutputAnlg2
    :reader OutputAnlg2
    :initarg :OutputAnlg2
    :type cl:float
    :initform 0.0)
   (InputDig1
    :reader InputDig1
    :initarg :InputDig1
    :type cl:boolean
    :initform cl:nil)
   (InputDig2
    :reader InputDig2
    :initarg :InputDig2
    :type cl:boolean
    :initform cl:nil)
   (InputDig3
    :reader InputDig3
    :initarg :InputDig3
    :type cl:boolean
    :initform cl:nil)
   (InputDig4
    :reader InputDig4
    :initarg :InputDig4
    :type cl:boolean
    :initform cl:nil)
   (OutputDig1
    :reader OutputDig1
    :initarg :OutputDig1
    :type cl:boolean
    :initform cl:nil)
   (OutputDig2
    :reader OutputDig2
    :initarg :OutputDig2
    :type cl:boolean
    :initform cl:nil)
   (OutputDig3
    :reader OutputDig3
    :initarg :OutputDig3
    :type cl:boolean
    :initform cl:nil)
   (OutputDig4
    :reader OutputDig4
    :initarg :OutputDig4
    :type cl:boolean
    :initform cl:nil)
   (OutputDig5
    :reader OutputDig5
    :initarg :OutputDig5
    :type cl:boolean
    :initform cl:nil)
   (OutputDig6
    :reader OutputDig6
    :initarg :OutputDig6
    :type cl:boolean
    :initform cl:nil)
   (OutputDig7
    :reader OutputDig7
    :initarg :OutputDig7
    :type cl:boolean
    :initform cl:nil)
   (OutputDig8
    :reader OutputDig8
    :initarg :OutputDig8
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass can_modulo_estado (<can_modulo_estado>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <can_modulo_estado>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'can_modulo_estado)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<can_modulo_estado> is deprecated: use lcm_to_ros-msg:can_modulo_estado instead.")))

(cl:ensure-generic-function 'Timestamp_sec-val :lambda-list '(m))
(cl:defmethod Timestamp_sec-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:Timestamp_sec-val is deprecated.  Use lcm_to_ros-msg:Timestamp_sec instead.")
  (Timestamp_sec m))

(cl:ensure-generic-function 'Timestamp_nsec-val :lambda-list '(m))
(cl:defmethod Timestamp_nsec-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:Timestamp_nsec-val is deprecated.  Use lcm_to_ros-msg:Timestamp_nsec instead.")
  (Timestamp_nsec m))

(cl:ensure-generic-function 'IdModulo-val :lambda-list '(m))
(cl:defmethod IdModulo-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:IdModulo-val is deprecated.  Use lcm_to_ros-msg:IdModulo instead.")
  (IdModulo m))

(cl:ensure-generic-function 'InputVolA-val :lambda-list '(m))
(cl:defmethod InputVolA-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:InputVolA-val is deprecated.  Use lcm_to_ros-msg:InputVolA instead.")
  (InputVolA m))

(cl:ensure-generic-function 'InputVolB-val :lambda-list '(m))
(cl:defmethod InputVolB-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:InputVolB-val is deprecated.  Use lcm_to_ros-msg:InputVolB instead.")
  (InputVolB m))

(cl:ensure-generic-function 'InputCorrA-val :lambda-list '(m))
(cl:defmethod InputCorrA-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:InputCorrA-val is deprecated.  Use lcm_to_ros-msg:InputCorrA instead.")
  (InputCorrA m))

(cl:ensure-generic-function 'InputCorrB-val :lambda-list '(m))
(cl:defmethod InputCorrB-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:InputCorrB-val is deprecated.  Use lcm_to_ros-msg:InputCorrB instead.")
  (InputCorrB m))

(cl:ensure-generic-function 'OutputAnlg1-val :lambda-list '(m))
(cl:defmethod OutputAnlg1-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:OutputAnlg1-val is deprecated.  Use lcm_to_ros-msg:OutputAnlg1 instead.")
  (OutputAnlg1 m))

(cl:ensure-generic-function 'OutputAnlg2-val :lambda-list '(m))
(cl:defmethod OutputAnlg2-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:OutputAnlg2-val is deprecated.  Use lcm_to_ros-msg:OutputAnlg2 instead.")
  (OutputAnlg2 m))

(cl:ensure-generic-function 'InputDig1-val :lambda-list '(m))
(cl:defmethod InputDig1-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:InputDig1-val is deprecated.  Use lcm_to_ros-msg:InputDig1 instead.")
  (InputDig1 m))

(cl:ensure-generic-function 'InputDig2-val :lambda-list '(m))
(cl:defmethod InputDig2-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:InputDig2-val is deprecated.  Use lcm_to_ros-msg:InputDig2 instead.")
  (InputDig2 m))

(cl:ensure-generic-function 'InputDig3-val :lambda-list '(m))
(cl:defmethod InputDig3-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:InputDig3-val is deprecated.  Use lcm_to_ros-msg:InputDig3 instead.")
  (InputDig3 m))

(cl:ensure-generic-function 'InputDig4-val :lambda-list '(m))
(cl:defmethod InputDig4-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:InputDig4-val is deprecated.  Use lcm_to_ros-msg:InputDig4 instead.")
  (InputDig4 m))

(cl:ensure-generic-function 'OutputDig1-val :lambda-list '(m))
(cl:defmethod OutputDig1-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:OutputDig1-val is deprecated.  Use lcm_to_ros-msg:OutputDig1 instead.")
  (OutputDig1 m))

(cl:ensure-generic-function 'OutputDig2-val :lambda-list '(m))
(cl:defmethod OutputDig2-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:OutputDig2-val is deprecated.  Use lcm_to_ros-msg:OutputDig2 instead.")
  (OutputDig2 m))

(cl:ensure-generic-function 'OutputDig3-val :lambda-list '(m))
(cl:defmethod OutputDig3-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:OutputDig3-val is deprecated.  Use lcm_to_ros-msg:OutputDig3 instead.")
  (OutputDig3 m))

(cl:ensure-generic-function 'OutputDig4-val :lambda-list '(m))
(cl:defmethod OutputDig4-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:OutputDig4-val is deprecated.  Use lcm_to_ros-msg:OutputDig4 instead.")
  (OutputDig4 m))

(cl:ensure-generic-function 'OutputDig5-val :lambda-list '(m))
(cl:defmethod OutputDig5-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:OutputDig5-val is deprecated.  Use lcm_to_ros-msg:OutputDig5 instead.")
  (OutputDig5 m))

(cl:ensure-generic-function 'OutputDig6-val :lambda-list '(m))
(cl:defmethod OutputDig6-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:OutputDig6-val is deprecated.  Use lcm_to_ros-msg:OutputDig6 instead.")
  (OutputDig6 m))

(cl:ensure-generic-function 'OutputDig7-val :lambda-list '(m))
(cl:defmethod OutputDig7-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:OutputDig7-val is deprecated.  Use lcm_to_ros-msg:OutputDig7 instead.")
  (OutputDig7 m))

(cl:ensure-generic-function 'OutputDig8-val :lambda-list '(m))
(cl:defmethod OutputDig8-val ((m <can_modulo_estado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:OutputDig8-val is deprecated.  Use lcm_to_ros-msg:OutputDig8 instead.")
  (OutputDig8 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <can_modulo_estado>) ostream)
  "Serializes a message object of type '<can_modulo_estado>"
  (cl:let* ((signed (cl:slot-value msg 'Timestamp_sec)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Timestamp_nsec)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'IdModulo)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'InputVolA))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'InputVolB))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'InputCorrA))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'InputCorrB))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'OutputAnlg1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'OutputAnlg2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'InputDig1) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'InputDig2) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'InputDig3) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'InputDig4) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'OutputDig1) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'OutputDig2) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'OutputDig3) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'OutputDig4) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'OutputDig5) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'OutputDig6) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'OutputDig7) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'OutputDig8) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <can_modulo_estado>) istream)
  "Deserializes a message object of type '<can_modulo_estado>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Timestamp_sec) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Timestamp_nsec) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'IdModulo)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'InputVolA) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'InputVolB) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'InputCorrA) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'InputCorrB) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'OutputAnlg1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'OutputAnlg2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'InputDig1) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'InputDig2) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'InputDig3) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'InputDig4) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'OutputDig1) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'OutputDig2) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'OutputDig3) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'OutputDig4) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'OutputDig5) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'OutputDig6) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'OutputDig7) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'OutputDig8) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<can_modulo_estado>)))
  "Returns string type for a message object of type '<can_modulo_estado>"
  "lcm_to_ros/can_modulo_estado")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'can_modulo_estado)))
  "Returns string type for a message object of type 'can_modulo_estado"
  "lcm_to_ros/can_modulo_estado")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<can_modulo_estado>)))
  "Returns md5sum for a message object of type '<can_modulo_estado>"
  "e6f65a6fba4df534967c07b0198c1dba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'can_modulo_estado)))
  "Returns md5sum for a message object of type 'can_modulo_estado"
  "e6f65a6fba4df534967c07b0198c1dba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<can_modulo_estado>)))
  "Returns full string definition for message of type '<can_modulo_estado>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%int32               Timestamp_sec~%int32               Timestamp_nsec~%byte                IdModulo~%float64             InputVolA~%float64             InputVolB~%float64             InputCorrA~%float64             InputCorrB~%float64             OutputAnlg1~%float64             OutputAnlg2~%bool                InputDig1~%bool                InputDig2~%bool                InputDig3~%bool                InputDig4~%bool                OutputDig1~%bool                OutputDig2~%bool                OutputDig3~%bool                OutputDig4~%bool                OutputDig5~%bool                OutputDig6~%bool                OutputDig7~%bool                OutputDig8~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'can_modulo_estado)))
  "Returns full string definition for message of type 'can_modulo_estado"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%int32               Timestamp_sec~%int32               Timestamp_nsec~%byte                IdModulo~%float64             InputVolA~%float64             InputVolB~%float64             InputCorrA~%float64             InputCorrB~%float64             OutputAnlg1~%float64             OutputAnlg2~%bool                InputDig1~%bool                InputDig2~%bool                InputDig3~%bool                InputDig4~%bool                OutputDig1~%bool                OutputDig2~%bool                OutputDig3~%bool                OutputDig4~%bool                OutputDig5~%bool                OutputDig6~%bool                OutputDig7~%bool                OutputDig8~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <can_modulo_estado>))
  (cl:+ 0
     4
     4
     1
     8
     8
     8
     8
     8
     8
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <can_modulo_estado>))
  "Converts a ROS message object to a list"
  (cl:list 'can_modulo_estado
    (cl:cons ':Timestamp_sec (Timestamp_sec msg))
    (cl:cons ':Timestamp_nsec (Timestamp_nsec msg))
    (cl:cons ':IdModulo (IdModulo msg))
    (cl:cons ':InputVolA (InputVolA msg))
    (cl:cons ':InputVolB (InputVolB msg))
    (cl:cons ':InputCorrA (InputCorrA msg))
    (cl:cons ':InputCorrB (InputCorrB msg))
    (cl:cons ':OutputAnlg1 (OutputAnlg1 msg))
    (cl:cons ':OutputAnlg2 (OutputAnlg2 msg))
    (cl:cons ':InputDig1 (InputDig1 msg))
    (cl:cons ':InputDig2 (InputDig2 msg))
    (cl:cons ':InputDig3 (InputDig3 msg))
    (cl:cons ':InputDig4 (InputDig4 msg))
    (cl:cons ':OutputDig1 (OutputDig1 msg))
    (cl:cons ':OutputDig2 (OutputDig2 msg))
    (cl:cons ':OutputDig3 (OutputDig3 msg))
    (cl:cons ':OutputDig4 (OutputDig4 msg))
    (cl:cons ':OutputDig5 (OutputDig5 msg))
    (cl:cons ':OutputDig6 (OutputDig6 msg))
    (cl:cons ':OutputDig7 (OutputDig7 msg))
    (cl:cons ':OutputDig8 (OutputDig8 msg))
))
