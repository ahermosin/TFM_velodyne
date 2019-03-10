; Auto-generated. Do not edit!


(cl:in-package lcm_to_ros-msg)


;//! \htmlinclude ibeo_objeto.msg.html

(cl:defclass <ibeo_objeto> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (age
    :reader age
    :initarg :age
    :type cl:float
    :initform 0.0)
   (velocidad_relativa_x
    :reader velocidad_relativa_x
    :initarg :velocidad_relativa_x
    :type cl:float
    :initform 0.0)
   (velocidad_relativa_y
    :reader velocidad_relativa_y
    :initarg :velocidad_relativa_y
    :type cl:float
    :initform 0.0)
   (velocidad_absoluta_x
    :reader velocidad_absoluta_x
    :initarg :velocidad_absoluta_x
    :type cl:float
    :initform 0.0)
   (velocidad_absoluta_y
    :reader velocidad_absoluta_y
    :initarg :velocidad_absoluta_y
    :type cl:float
    :initform 0.0)
   (velocidad_absoluta_sigma_x
    :reader velocidad_absoluta_sigma_x
    :initarg :velocidad_absoluta_sigma_x
    :type cl:float
    :initform 0.0)
   (velocidad_absoluta_sigma_y
    :reader velocidad_absoluta_sigma_y
    :initarg :velocidad_absoluta_sigma_y
    :type cl:float
    :initform 0.0)
   (bounding_box_centro_x
    :reader bounding_box_centro_x
    :initarg :bounding_box_centro_x
    :type cl:float
    :initform 0.0)
   (bounding_box_centro_y
    :reader bounding_box_centro_y
    :initarg :bounding_box_centro_y
    :type cl:float
    :initform 0.0)
   (bounding_box_largo
    :reader bounding_box_largo
    :initarg :bounding_box_largo
    :type cl:float
    :initform 0.0)
   (bounding_box_ancho
    :reader bounding_box_ancho
    :initarg :bounding_box_ancho
    :type cl:float
    :initform 0.0)
   (object_box_centro_x
    :reader object_box_centro_x
    :initarg :object_box_centro_x
    :type cl:float
    :initform 0.0)
   (object_box_centro_y
    :reader object_box_centro_y
    :initarg :object_box_centro_y
    :type cl:float
    :initform 0.0)
   (object_box_orientacion
    :reader object_box_orientacion
    :initarg :object_box_orientacion
    :type cl:float
    :initform 0.0)
   (object_box_size_x
    :reader object_box_size_x
    :initarg :object_box_size_x
    :type cl:float
    :initform 0.0)
   (object_box_size_y
    :reader object_box_size_y
    :initarg :object_box_size_y
    :type cl:float
    :initform 0.0)
   (clasificacion
    :reader clasificacion
    :initarg :clasificacion
    :type cl:fixnum
    :initform 0)
   (clasificacion_age
    :reader clasificacion_age
    :initarg :clasificacion_age
    :type cl:float
    :initform 0.0)
   (clasificacion_certeza
    :reader clasificacion_certeza
    :initarg :clasificacion_certeza
    :type cl:float
    :initform 0.0)
   (punto_cercano_x
    :reader punto_cercano_x
    :initarg :punto_cercano_x
    :type cl:float
    :initform 0.0)
   (punto_cercano_y
    :reader punto_cercano_y
    :initarg :punto_cercano_y
    :type cl:float
    :initform 0.0)
   (punto_referencia_x
    :reader punto_referencia_x
    :initarg :punto_referencia_x
    :type cl:float
    :initform 0.0)
   (punto_referencia_y
    :reader punto_referencia_y
    :initarg :punto_referencia_y
    :type cl:float
    :initform 0.0)
   (punto_referencia_sigma_x
    :reader punto_referencia_sigma_x
    :initarg :punto_referencia_sigma_x
    :type cl:float
    :initform 0.0)
   (punto_referencia_sigma_y
    :reader punto_referencia_sigma_y
    :initarg :punto_referencia_sigma_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass ibeo_objeto (<ibeo_objeto>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ibeo_objeto>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ibeo_objeto)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lcm_to_ros-msg:<ibeo_objeto> is deprecated: use lcm_to_ros-msg:ibeo_objeto instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:id-val is deprecated.  Use lcm_to_ros-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'age-val :lambda-list '(m))
(cl:defmethod age-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:age-val is deprecated.  Use lcm_to_ros-msg:age instead.")
  (age m))

(cl:ensure-generic-function 'velocidad_relativa_x-val :lambda-list '(m))
(cl:defmethod velocidad_relativa_x-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad_relativa_x-val is deprecated.  Use lcm_to_ros-msg:velocidad_relativa_x instead.")
  (velocidad_relativa_x m))

(cl:ensure-generic-function 'velocidad_relativa_y-val :lambda-list '(m))
(cl:defmethod velocidad_relativa_y-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad_relativa_y-val is deprecated.  Use lcm_to_ros-msg:velocidad_relativa_y instead.")
  (velocidad_relativa_y m))

(cl:ensure-generic-function 'velocidad_absoluta_x-val :lambda-list '(m))
(cl:defmethod velocidad_absoluta_x-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad_absoluta_x-val is deprecated.  Use lcm_to_ros-msg:velocidad_absoluta_x instead.")
  (velocidad_absoluta_x m))

(cl:ensure-generic-function 'velocidad_absoluta_y-val :lambda-list '(m))
(cl:defmethod velocidad_absoluta_y-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad_absoluta_y-val is deprecated.  Use lcm_to_ros-msg:velocidad_absoluta_y instead.")
  (velocidad_absoluta_y m))

(cl:ensure-generic-function 'velocidad_absoluta_sigma_x-val :lambda-list '(m))
(cl:defmethod velocidad_absoluta_sigma_x-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad_absoluta_sigma_x-val is deprecated.  Use lcm_to_ros-msg:velocidad_absoluta_sigma_x instead.")
  (velocidad_absoluta_sigma_x m))

(cl:ensure-generic-function 'velocidad_absoluta_sigma_y-val :lambda-list '(m))
(cl:defmethod velocidad_absoluta_sigma_y-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:velocidad_absoluta_sigma_y-val is deprecated.  Use lcm_to_ros-msg:velocidad_absoluta_sigma_y instead.")
  (velocidad_absoluta_sigma_y m))

(cl:ensure-generic-function 'bounding_box_centro_x-val :lambda-list '(m))
(cl:defmethod bounding_box_centro_x-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:bounding_box_centro_x-val is deprecated.  Use lcm_to_ros-msg:bounding_box_centro_x instead.")
  (bounding_box_centro_x m))

(cl:ensure-generic-function 'bounding_box_centro_y-val :lambda-list '(m))
(cl:defmethod bounding_box_centro_y-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:bounding_box_centro_y-val is deprecated.  Use lcm_to_ros-msg:bounding_box_centro_y instead.")
  (bounding_box_centro_y m))

(cl:ensure-generic-function 'bounding_box_largo-val :lambda-list '(m))
(cl:defmethod bounding_box_largo-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:bounding_box_largo-val is deprecated.  Use lcm_to_ros-msg:bounding_box_largo instead.")
  (bounding_box_largo m))

(cl:ensure-generic-function 'bounding_box_ancho-val :lambda-list '(m))
(cl:defmethod bounding_box_ancho-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:bounding_box_ancho-val is deprecated.  Use lcm_to_ros-msg:bounding_box_ancho instead.")
  (bounding_box_ancho m))

(cl:ensure-generic-function 'object_box_centro_x-val :lambda-list '(m))
(cl:defmethod object_box_centro_x-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:object_box_centro_x-val is deprecated.  Use lcm_to_ros-msg:object_box_centro_x instead.")
  (object_box_centro_x m))

(cl:ensure-generic-function 'object_box_centro_y-val :lambda-list '(m))
(cl:defmethod object_box_centro_y-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:object_box_centro_y-val is deprecated.  Use lcm_to_ros-msg:object_box_centro_y instead.")
  (object_box_centro_y m))

(cl:ensure-generic-function 'object_box_orientacion-val :lambda-list '(m))
(cl:defmethod object_box_orientacion-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:object_box_orientacion-val is deprecated.  Use lcm_to_ros-msg:object_box_orientacion instead.")
  (object_box_orientacion m))

(cl:ensure-generic-function 'object_box_size_x-val :lambda-list '(m))
(cl:defmethod object_box_size_x-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:object_box_size_x-val is deprecated.  Use lcm_to_ros-msg:object_box_size_x instead.")
  (object_box_size_x m))

(cl:ensure-generic-function 'object_box_size_y-val :lambda-list '(m))
(cl:defmethod object_box_size_y-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:object_box_size_y-val is deprecated.  Use lcm_to_ros-msg:object_box_size_y instead.")
  (object_box_size_y m))

(cl:ensure-generic-function 'clasificacion-val :lambda-list '(m))
(cl:defmethod clasificacion-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:clasificacion-val is deprecated.  Use lcm_to_ros-msg:clasificacion instead.")
  (clasificacion m))

(cl:ensure-generic-function 'clasificacion_age-val :lambda-list '(m))
(cl:defmethod clasificacion_age-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:clasificacion_age-val is deprecated.  Use lcm_to_ros-msg:clasificacion_age instead.")
  (clasificacion_age m))

(cl:ensure-generic-function 'clasificacion_certeza-val :lambda-list '(m))
(cl:defmethod clasificacion_certeza-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:clasificacion_certeza-val is deprecated.  Use lcm_to_ros-msg:clasificacion_certeza instead.")
  (clasificacion_certeza m))

(cl:ensure-generic-function 'punto_cercano_x-val :lambda-list '(m))
(cl:defmethod punto_cercano_x-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:punto_cercano_x-val is deprecated.  Use lcm_to_ros-msg:punto_cercano_x instead.")
  (punto_cercano_x m))

(cl:ensure-generic-function 'punto_cercano_y-val :lambda-list '(m))
(cl:defmethod punto_cercano_y-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:punto_cercano_y-val is deprecated.  Use lcm_to_ros-msg:punto_cercano_y instead.")
  (punto_cercano_y m))

(cl:ensure-generic-function 'punto_referencia_x-val :lambda-list '(m))
(cl:defmethod punto_referencia_x-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:punto_referencia_x-val is deprecated.  Use lcm_to_ros-msg:punto_referencia_x instead.")
  (punto_referencia_x m))

(cl:ensure-generic-function 'punto_referencia_y-val :lambda-list '(m))
(cl:defmethod punto_referencia_y-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:punto_referencia_y-val is deprecated.  Use lcm_to_ros-msg:punto_referencia_y instead.")
  (punto_referencia_y m))

(cl:ensure-generic-function 'punto_referencia_sigma_x-val :lambda-list '(m))
(cl:defmethod punto_referencia_sigma_x-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:punto_referencia_sigma_x-val is deprecated.  Use lcm_to_ros-msg:punto_referencia_sigma_x instead.")
  (punto_referencia_sigma_x m))

(cl:ensure-generic-function 'punto_referencia_sigma_y-val :lambda-list '(m))
(cl:defmethod punto_referencia_sigma_y-val ((m <ibeo_objeto>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lcm_to_ros-msg:punto_referencia_sigma_y-val is deprecated.  Use lcm_to_ros-msg:punto_referencia_sigma_y instead.")
  (punto_referencia_sigma_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ibeo_objeto>) ostream)
  "Serializes a message object of type '<ibeo_objeto>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'age))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocidad_relativa_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocidad_relativa_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocidad_absoluta_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocidad_absoluta_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocidad_absoluta_sigma_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocidad_absoluta_sigma_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bounding_box_centro_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bounding_box_centro_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bounding_box_largo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bounding_box_ancho))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'object_box_centro_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'object_box_centro_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'object_box_orientacion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'object_box_size_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'object_box_size_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'clasificacion)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'clasificacion_age))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'clasificacion_certeza))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'punto_cercano_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'punto_cercano_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'punto_referencia_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'punto_referencia_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'punto_referencia_sigma_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'punto_referencia_sigma_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ibeo_objeto>) istream)
  "Deserializes a message object of type '<ibeo_objeto>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'age) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad_relativa_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad_relativa_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad_absoluta_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad_absoluta_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad_absoluta_sigma_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocidad_absoluta_sigma_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bounding_box_centro_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bounding_box_centro_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bounding_box_largo) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bounding_box_ancho) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'object_box_centro_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'object_box_centro_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'object_box_orientacion) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'object_box_size_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'object_box_size_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'clasificacion) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'clasificacion_age) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'clasificacion_certeza) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'punto_cercano_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'punto_cercano_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'punto_referencia_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'punto_referencia_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'punto_referencia_sigma_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'punto_referencia_sigma_y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ibeo_objeto>)))
  "Returns string type for a message object of type '<ibeo_objeto>"
  "lcm_to_ros/ibeo_objeto")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ibeo_objeto)))
  "Returns string type for a message object of type 'ibeo_objeto"
  "lcm_to_ros/ibeo_objeto")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ibeo_objeto>)))
  "Returns md5sum for a message object of type '<ibeo_objeto>"
  "f05d4f8d7f4f7ef27109cc9e3a63af19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ibeo_objeto)))
  "Returns md5sum for a message object of type 'ibeo_objeto"
  "f05d4f8d7f4f7ef27109cc9e3a63af19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ibeo_objeto>)))
  "Returns full string definition for message of type '<ibeo_objeto>"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%int16               id~%float32             age~%float32             velocidad_relativa_x~%float32             velocidad_relativa_y~%float32             velocidad_absoluta_x~%float32             velocidad_absoluta_y~%float32             velocidad_absoluta_sigma_x~%float32             velocidad_absoluta_sigma_y~%float32             bounding_box_centro_x~%float32             bounding_box_centro_y~%float32             bounding_box_largo~%float32             bounding_box_ancho~%float32             object_box_centro_x~%float32             object_box_centro_y~%float32             object_box_orientacion~%float32             object_box_size_x~%float32             object_box_size_y~%int16               clasificacion~%float32             clasificacion_age~%float32             clasificacion_certeza~%float32             punto_cercano_x~%float32             punto_cercano_y~%float32             punto_referencia_x~%float32             punto_referencia_y~%float32             punto_referencia_sigma_x~%float32             punto_referencia_sigma_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ibeo_objeto)))
  "Returns full string definition for message of type 'ibeo_objeto"
  (cl:format cl:nil "#######################################################################~%# This message was automatically generated by the lcm_to_ros package~%# https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu~%#######################################################################~%#~%# Source message:    .msg~%# Creation:          lun 18 feb 2019 17:14:16 CET~%#~%#######################################################################~%int16               id~%float32             age~%float32             velocidad_relativa_x~%float32             velocidad_relativa_y~%float32             velocidad_absoluta_x~%float32             velocidad_absoluta_y~%float32             velocidad_absoluta_sigma_x~%float32             velocidad_absoluta_sigma_y~%float32             bounding_box_centro_x~%float32             bounding_box_centro_y~%float32             bounding_box_largo~%float32             bounding_box_ancho~%float32             object_box_centro_x~%float32             object_box_centro_y~%float32             object_box_orientacion~%float32             object_box_size_x~%float32             object_box_size_y~%int16               clasificacion~%float32             clasificacion_age~%float32             clasificacion_certeza~%float32             punto_cercano_x~%float32             punto_cercano_y~%float32             punto_referencia_x~%float32             punto_referencia_y~%float32             punto_referencia_sigma_x~%float32             punto_referencia_sigma_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ibeo_objeto>))
  (cl:+ 0
     2
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     2
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ibeo_objeto>))
  "Converts a ROS message object to a list"
  (cl:list 'ibeo_objeto
    (cl:cons ':id (id msg))
    (cl:cons ':age (age msg))
    (cl:cons ':velocidad_relativa_x (velocidad_relativa_x msg))
    (cl:cons ':velocidad_relativa_y (velocidad_relativa_y msg))
    (cl:cons ':velocidad_absoluta_x (velocidad_absoluta_x msg))
    (cl:cons ':velocidad_absoluta_y (velocidad_absoluta_y msg))
    (cl:cons ':velocidad_absoluta_sigma_x (velocidad_absoluta_sigma_x msg))
    (cl:cons ':velocidad_absoluta_sigma_y (velocidad_absoluta_sigma_y msg))
    (cl:cons ':bounding_box_centro_x (bounding_box_centro_x msg))
    (cl:cons ':bounding_box_centro_y (bounding_box_centro_y msg))
    (cl:cons ':bounding_box_largo (bounding_box_largo msg))
    (cl:cons ':bounding_box_ancho (bounding_box_ancho msg))
    (cl:cons ':object_box_centro_x (object_box_centro_x msg))
    (cl:cons ':object_box_centro_y (object_box_centro_y msg))
    (cl:cons ':object_box_orientacion (object_box_orientacion msg))
    (cl:cons ':object_box_size_x (object_box_size_x msg))
    (cl:cons ':object_box_size_y (object_box_size_y msg))
    (cl:cons ':clasificacion (clasificacion msg))
    (cl:cons ':clasificacion_age (clasificacion_age msg))
    (cl:cons ':clasificacion_certeza (clasificacion_certeza msg))
    (cl:cons ':punto_cercano_x (punto_cercano_x msg))
    (cl:cons ':punto_cercano_y (punto_cercano_y msg))
    (cl:cons ':punto_referencia_x (punto_referencia_x msg))
    (cl:cons ':punto_referencia_y (punto_referencia_y msg))
    (cl:cons ':punto_referencia_sigma_x (punto_referencia_sigma_x msg))
    (cl:cons ':punto_referencia_sigma_y (punto_referencia_sigma_y msg))
))
