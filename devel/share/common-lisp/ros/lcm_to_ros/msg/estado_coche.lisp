; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude estado_coche.msg.html

(cl:defclass <estado_coche> (roslisp-msg-protocol:ros-message)
  ((tiempo
    :reader tiempo
    :initarg :tiempo
    :type cl:float
    :initform 0.0)
   (calidad_gps
    :reader calidad_gps
    :initarg :calidad_gps
    :type cl:fixnum
    :initform 0)
   (nro_satelites
    :reader nro_satelites
    :initarg :nro_satelites
    :type cl:fixnum
    :initform 0)
   (posicion_x
    :reader posicion_x
    :initarg :posicion_x
    :type cl:float
    :initform 0.0)
   (posicion_y
    :reader posicion_y
    :initarg :posicion_y
    :type cl:float
    :initform 0.0)
   (orientacion
    :reader orientacion
    :initarg :orientacion
    :type cl:float
    :initform 0.0)
   (velocidad
    :reader velocidad
    :initarg :velocidad
    :type cl:float
    :initform 0.0)
   (aceleracion
    :reader aceleracion
    :initarg :aceleracion
    :type cl:float
    :initform 0.0)
   (k_posicion_x
    :reader k_posicion_x
    :initarg :k_posicion_x
    :type cl:float
    :initform 0.0)
   (k_posicion_y
    :reader k_posicion_y
    :initarg :k_posicion_y
    :type cl:float
    :initform 0.0)
   (k_orientacion
    :reader k_orientacion
    :initarg :k_orientacion
    :type cl:float
    :initform 0.0)
   (k_velocidad
    :reader k_velocidad
    :initarg :k_velocidad
    :type cl:float
    :initform 0.0)
   (k_aceleracion
    :reader k_aceleracion
    :initarg :k_aceleracion
    :type cl:float
    :initform 0.0)
   (angulo_volante
    :reader angulo_volante
    :initarg :angulo_volante
    :type cl:float
    :initform 0.0)
   (flag_msg_gps
    :reader flag_msg_gps
    :initarg :flag_msg_gps
    :type cl:boolean
    :initform cl:nil)
   (flag_msg_canvel
    :reader flag_msg_canvel
    :initarg :flag_msg_canvel
    :type cl:boolean
    :initform cl:nil)
   (flag_msg_canvol
    :reader flag_msg_canvol
    :initarg :flag_msg_canvol
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass estado_coche (<estado_coche>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <estado_coche>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'estado_coche)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<estado_coche> is deprecated: use lcm_to_ros-msg:estado_coche instead.")))

(cl:ensure-generic-function 'tiempo-val :lambda-list '(m))
(cl:defmethod tiempo-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:tiempo-val is deprecated.  Use lcm_to_ros-msg:tiempo instead.")
  (tiempo m))

(cl:ensure-generic-function 'calidad_gps-val :lambda-list '(m))
(cl:defmethod calidad_gps-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:calidad_gps-val is deprecated.  Use lcm_to_ros-msg:calidad_gps instead.")
  (calidad_gps m))

(cl:ensure-generic-function 'nro_satelites-val :lambda-list '(m))
(cl:defmethod nro_satelites-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:nro_satelites-val is deprecated.  Use lcm_to_ros-msg:nro_satelites instead.")
  (nro_satelites m))

(cl:ensure-generic-function 'posicion_x-val :lambda-list '(m))
(cl:defmethod posicion_x-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:posicion_x-val is deprecated.  Use lcm_to_ros-msg:posicion_x instead.")
  (posicion_x m))

(cl:ensure-generic-function 'posicion_y-val :lambda-list '(m))
(cl:defmethod posicion_y-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:posicion_y-val is deprecated.  Use lcm_to_ros-msg:posicion_y instead.")
  (posicion_y m))

(cl:ensure-generic-function 'orientacion-val :lambda-list '(m))
(cl:defmethod orientacion-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:orientacion-val is deprecated.  Use lcm_to_ros-msg:orientacion instead.")
  (orientacion m))

(cl:ensure-generic-function 'velocidad-val :lambda-list '(m))
(cl:defmethod velocidad-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad-val is deprecated.  Use lcm_to_ros-msg:velocidad instead.")
  (velocidad m))

(cl:ensure-generic-function 'aceleracion-val :lambda-list '(m))
(cl:defmethod aceleracion-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:aceleracion-val is deprecated.  Use lcm_to_ros-msg:aceleracion instead.")
  (aceleracion m))

(cl:ensure-generic-function 'k_posicion_x-val :lambda-list '(m))
(cl:defmethod k_posicion_x-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:k_posicion_x-val is deprecated.  Use lcm_to_ros-msg:k_posicion_x instead.")
  (k_posicion_x m))

(cl:ensure-generic-function 'k_posicion_y-val :lambda-list '(m))
(cl:defmethod k_posicion_y-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:k_posicion_y-val is deprecated.  Use lcm_to_ros-msg:k_posicion_y instead.")
  (k_posicion_y m))

(cl:ensure-generic-function 'k_orientacion-val :lambda-list '(m))
(cl:defmethod k_orientacion-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:k_orientacion-val is deprecated.  Use lcm_to_ros-msg:k_orientacion instead.")
  (k_orientacion m))

(cl:ensure-generic-function 'k_velocidad-val :lambda-list '(m))
(cl:defmethod k_velocidad-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:k_velocidad-val is deprecated.  Use lcm_to_ros-msg:k_velocidad instead.")
  (k_velocidad m))

(cl:ensure-generic-function 'k_aceleracion-val :lambda-list '(m))
(cl:defmethod k_aceleracion-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:k_aceleracion-val is deprecated.  Use lcm_to_ros-msg:k_aceleracion instead.")
  (k_aceleracion m))

(cl:ensure-generic-function 'angulo_volante-val :lambda-list '(m))
(cl:defmethod angulo_volante-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:angulo_volante-val is deprecated.  Use lcm_to_ros-msg:angulo_volante instead.")
  (angulo_volante m))

(cl:ensure-generic-function 'flag_msg_gps-val :lambda-list '(m))
(cl:defmethod flag_msg_gps-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:flag_msg_gps-val is deprecated.  Use lcm_to_ros-msg:flag_msg_gps instead.")
  (flag_msg_gps m))

(cl:ensure-generic-function 'flag_msg_canvel-val :lambda-list '(m))
(cl:defmethod flag_msg_canvel-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:flag_msg_canvel-val is deprecated.  Use lcm_to_ros-msg:flag_msg_canvel instead.")
  (flag_msg_canvel m))

(cl:ensure-generic-function 'flag_msg_canvol-val :lambda-list '(m))
(cl:defmethod flag_msg_canvol-val ((m <estado_coche>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:flag_msg_canvol-val is deprecated.  Use lcm_to_ros-msg:flag_msg_canvol instead.")
  (flag_msg_canvol m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <estado_coche>) ostream)
  "Serializes a message object of type '<estado_coche>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'tiempo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'calidad_gps)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'nro_satelites)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'posicion_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'posicion_y))))
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocidad))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'aceleracion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'k_posicion_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'k_posicion_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'k_orientacion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'k_velocidad))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'k_aceleracion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angulo_volante))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'flag_msg_gps) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'flag_msg_canvel) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'flag_msg_canvol) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <estado_coche>) istream)
  "Deserializes a message object of type '<estado_coche>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tiempo) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'calidad_gps) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nro_satelites) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'posicion_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'posicion_y) (roslisp-utils:decode-double-float-bits bits)))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'aceleracion) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'k_posicion_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'k_posicion_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'k_orientacion) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'k_velocidad) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'k_aceleracion) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angulo_volante) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'flag_msg_gps) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'flag_msg_canvel) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'flag_msg_canvol) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<estado_coche>)))
  "Returns string type for a message object of type '<estado_coche>"
  "lcm_to_ros/estado_coche")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'estado_coche)))
  "Returns string type for a message object of type 'estado_coche"
  "lcm_to_ros/estado_coche")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<estado_coche>)))
  "Returns md5sum for a message object of type '<estado_coche>"
  "1daf5d53595ad9bd5965114c8d8312ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'estado_coche)))
  "Returns md5sum for a message object of type 'estado_coche"
  "1daf5d53595ad9bd5965114c8d8312ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<estado_coche>)))
  "Returns full string definition for message of type '<estado_coche>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%float64             tiempo~%int8                calidad_gps~%int8                nro_satelites~%float64             posicion_x~%float64             posicion_y~%float64             orientacion~%float64             velocidad~%float64             aceleracion~%float64             k_posicion_x~%float64             k_posicion_y~%float64             k_orientacion~%float64             k_velocidad~%float64             k_aceleracion~%float64             angulo_volante~%bool                flag_msg_gps~%bool                flag_msg_canvel~%bool                flag_msg_canvol~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'estado_coche)))
  "Returns full string definition for message of type 'estado_coche"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%float64             tiempo~%int8                calidad_gps~%int8                nro_satelites~%float64             posicion_x~%float64             posicion_y~%float64             orientacion~%float64             velocidad~%float64             aceleracion~%float64             k_posicion_x~%float64             k_posicion_y~%float64             k_orientacion~%float64             k_velocidad~%float64             k_aceleracion~%float64             angulo_volante~%bool                flag_msg_gps~%bool                flag_msg_canvel~%bool                flag_msg_canvol~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <estado_coche>))
  (cl:+ 0
     8
     1
     1
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <estado_coche>))
  "Converts a ROS message object to a list"
  (cl:list 'estado_coche
    (cl:cons ':tiempo (tiempo msg))
    (cl:cons ':calidad_gps (calidad_gps msg))
    (cl:cons ':nro_satelites (nro_satelites msg))
    (cl:cons ':posicion_x (posicion_x msg))
    (cl:cons ':posicion_y (posicion_y msg))
    (cl:cons ':orientacion (orientacion msg))
    (cl:cons ':velocidad (velocidad msg))
    (cl:cons ':aceleracion (aceleracion msg))
    (cl:cons ':k_posicion_x (k_posicion_x msg))
    (cl:cons ':k_posicion_y (k_posicion_y msg))
    (cl:cons ':k_orientacion (k_orientacion msg))
    (cl:cons ':k_velocidad (k_velocidad msg))
    (cl:cons ':k_aceleracion (k_aceleracion msg))
    (cl:cons ':angulo_volante (angulo_volante msg))
    (cl:cons ':flag_msg_gps (flag_msg_gps msg))
    (cl:cons ':flag_msg_canvel (flag_msg_canvel msg))
    (cl:cons ':flag_msg_canvol (flag_msg_canvol msg))
))
