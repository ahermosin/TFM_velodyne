// Auto-generated. Do not edit!

// (in-package lcm_to_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ibeo_objeto {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.age = null;
      this.velocidad_relativa_x = null;
      this.velocidad_relativa_y = null;
      this.velocidad_absoluta_x = null;
      this.velocidad_absoluta_y = null;
      this.velocidad_absoluta_sigma_x = null;
      this.velocidad_absoluta_sigma_y = null;
      this.bounding_box_centro_x = null;
      this.bounding_box_centro_y = null;
      this.bounding_box_largo = null;
      this.bounding_box_ancho = null;
      this.object_box_centro_x = null;
      this.object_box_centro_y = null;
      this.object_box_orientacion = null;
      this.object_box_size_x = null;
      this.object_box_size_y = null;
      this.clasificacion = null;
      this.clasificacion_age = null;
      this.clasificacion_certeza = null;
      this.punto_cercano_x = null;
      this.punto_cercano_y = null;
      this.punto_referencia_x = null;
      this.punto_referencia_y = null;
      this.punto_referencia_sigma_x = null;
      this.punto_referencia_sigma_y = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('age')) {
        this.age = initObj.age
      }
      else {
        this.age = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad_relativa_x')) {
        this.velocidad_relativa_x = initObj.velocidad_relativa_x
      }
      else {
        this.velocidad_relativa_x = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad_relativa_y')) {
        this.velocidad_relativa_y = initObj.velocidad_relativa_y
      }
      else {
        this.velocidad_relativa_y = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad_absoluta_x')) {
        this.velocidad_absoluta_x = initObj.velocidad_absoluta_x
      }
      else {
        this.velocidad_absoluta_x = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad_absoluta_y')) {
        this.velocidad_absoluta_y = initObj.velocidad_absoluta_y
      }
      else {
        this.velocidad_absoluta_y = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad_absoluta_sigma_x')) {
        this.velocidad_absoluta_sigma_x = initObj.velocidad_absoluta_sigma_x
      }
      else {
        this.velocidad_absoluta_sigma_x = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad_absoluta_sigma_y')) {
        this.velocidad_absoluta_sigma_y = initObj.velocidad_absoluta_sigma_y
      }
      else {
        this.velocidad_absoluta_sigma_y = 0.0;
      }
      if (initObj.hasOwnProperty('bounding_box_centro_x')) {
        this.bounding_box_centro_x = initObj.bounding_box_centro_x
      }
      else {
        this.bounding_box_centro_x = 0.0;
      }
      if (initObj.hasOwnProperty('bounding_box_centro_y')) {
        this.bounding_box_centro_y = initObj.bounding_box_centro_y
      }
      else {
        this.bounding_box_centro_y = 0.0;
      }
      if (initObj.hasOwnProperty('bounding_box_largo')) {
        this.bounding_box_largo = initObj.bounding_box_largo
      }
      else {
        this.bounding_box_largo = 0.0;
      }
      if (initObj.hasOwnProperty('bounding_box_ancho')) {
        this.bounding_box_ancho = initObj.bounding_box_ancho
      }
      else {
        this.bounding_box_ancho = 0.0;
      }
      if (initObj.hasOwnProperty('object_box_centro_x')) {
        this.object_box_centro_x = initObj.object_box_centro_x
      }
      else {
        this.object_box_centro_x = 0.0;
      }
      if (initObj.hasOwnProperty('object_box_centro_y')) {
        this.object_box_centro_y = initObj.object_box_centro_y
      }
      else {
        this.object_box_centro_y = 0.0;
      }
      if (initObj.hasOwnProperty('object_box_orientacion')) {
        this.object_box_orientacion = initObj.object_box_orientacion
      }
      else {
        this.object_box_orientacion = 0.0;
      }
      if (initObj.hasOwnProperty('object_box_size_x')) {
        this.object_box_size_x = initObj.object_box_size_x
      }
      else {
        this.object_box_size_x = 0.0;
      }
      if (initObj.hasOwnProperty('object_box_size_y')) {
        this.object_box_size_y = initObj.object_box_size_y
      }
      else {
        this.object_box_size_y = 0.0;
      }
      if (initObj.hasOwnProperty('clasificacion')) {
        this.clasificacion = initObj.clasificacion
      }
      else {
        this.clasificacion = 0;
      }
      if (initObj.hasOwnProperty('clasificacion_age')) {
        this.clasificacion_age = initObj.clasificacion_age
      }
      else {
        this.clasificacion_age = 0.0;
      }
      if (initObj.hasOwnProperty('clasificacion_certeza')) {
        this.clasificacion_certeza = initObj.clasificacion_certeza
      }
      else {
        this.clasificacion_certeza = 0.0;
      }
      if (initObj.hasOwnProperty('punto_cercano_x')) {
        this.punto_cercano_x = initObj.punto_cercano_x
      }
      else {
        this.punto_cercano_x = 0.0;
      }
      if (initObj.hasOwnProperty('punto_cercano_y')) {
        this.punto_cercano_y = initObj.punto_cercano_y
      }
      else {
        this.punto_cercano_y = 0.0;
      }
      if (initObj.hasOwnProperty('punto_referencia_x')) {
        this.punto_referencia_x = initObj.punto_referencia_x
      }
      else {
        this.punto_referencia_x = 0.0;
      }
      if (initObj.hasOwnProperty('punto_referencia_y')) {
        this.punto_referencia_y = initObj.punto_referencia_y
      }
      else {
        this.punto_referencia_y = 0.0;
      }
      if (initObj.hasOwnProperty('punto_referencia_sigma_x')) {
        this.punto_referencia_sigma_x = initObj.punto_referencia_sigma_x
      }
      else {
        this.punto_referencia_sigma_x = 0.0;
      }
      if (initObj.hasOwnProperty('punto_referencia_sigma_y')) {
        this.punto_referencia_sigma_y = initObj.punto_referencia_sigma_y
      }
      else {
        this.punto_referencia_sigma_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ibeo_objeto
    // Serialize message field [id]
    bufferOffset = _serializer.int16(obj.id, buffer, bufferOffset);
    // Serialize message field [age]
    bufferOffset = _serializer.float32(obj.age, buffer, bufferOffset);
    // Serialize message field [velocidad_relativa_x]
    bufferOffset = _serializer.float32(obj.velocidad_relativa_x, buffer, bufferOffset);
    // Serialize message field [velocidad_relativa_y]
    bufferOffset = _serializer.float32(obj.velocidad_relativa_y, buffer, bufferOffset);
    // Serialize message field [velocidad_absoluta_x]
    bufferOffset = _serializer.float32(obj.velocidad_absoluta_x, buffer, bufferOffset);
    // Serialize message field [velocidad_absoluta_y]
    bufferOffset = _serializer.float32(obj.velocidad_absoluta_y, buffer, bufferOffset);
    // Serialize message field [velocidad_absoluta_sigma_x]
    bufferOffset = _serializer.float32(obj.velocidad_absoluta_sigma_x, buffer, bufferOffset);
    // Serialize message field [velocidad_absoluta_sigma_y]
    bufferOffset = _serializer.float32(obj.velocidad_absoluta_sigma_y, buffer, bufferOffset);
    // Serialize message field [bounding_box_centro_x]
    bufferOffset = _serializer.float32(obj.bounding_box_centro_x, buffer, bufferOffset);
    // Serialize message field [bounding_box_centro_y]
    bufferOffset = _serializer.float32(obj.bounding_box_centro_y, buffer, bufferOffset);
    // Serialize message field [bounding_box_largo]
    bufferOffset = _serializer.float32(obj.bounding_box_largo, buffer, bufferOffset);
    // Serialize message field [bounding_box_ancho]
    bufferOffset = _serializer.float32(obj.bounding_box_ancho, buffer, bufferOffset);
    // Serialize message field [object_box_centro_x]
    bufferOffset = _serializer.float32(obj.object_box_centro_x, buffer, bufferOffset);
    // Serialize message field [object_box_centro_y]
    bufferOffset = _serializer.float32(obj.object_box_centro_y, buffer, bufferOffset);
    // Serialize message field [object_box_orientacion]
    bufferOffset = _serializer.float32(obj.object_box_orientacion, buffer, bufferOffset);
    // Serialize message field [object_box_size_x]
    bufferOffset = _serializer.float32(obj.object_box_size_x, buffer, bufferOffset);
    // Serialize message field [object_box_size_y]
    bufferOffset = _serializer.float32(obj.object_box_size_y, buffer, bufferOffset);
    // Serialize message field [clasificacion]
    bufferOffset = _serializer.int16(obj.clasificacion, buffer, bufferOffset);
    // Serialize message field [clasificacion_age]
    bufferOffset = _serializer.float32(obj.clasificacion_age, buffer, bufferOffset);
    // Serialize message field [clasificacion_certeza]
    bufferOffset = _serializer.float32(obj.clasificacion_certeza, buffer, bufferOffset);
    // Serialize message field [punto_cercano_x]
    bufferOffset = _serializer.float32(obj.punto_cercano_x, buffer, bufferOffset);
    // Serialize message field [punto_cercano_y]
    bufferOffset = _serializer.float32(obj.punto_cercano_y, buffer, bufferOffset);
    // Serialize message field [punto_referencia_x]
    bufferOffset = _serializer.float32(obj.punto_referencia_x, buffer, bufferOffset);
    // Serialize message field [punto_referencia_y]
    bufferOffset = _serializer.float32(obj.punto_referencia_y, buffer, bufferOffset);
    // Serialize message field [punto_referencia_sigma_x]
    bufferOffset = _serializer.float32(obj.punto_referencia_sigma_x, buffer, bufferOffset);
    // Serialize message field [punto_referencia_sigma_y]
    bufferOffset = _serializer.float32(obj.punto_referencia_sigma_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ibeo_objeto
    let len;
    let data = new ibeo_objeto(null);
    // Deserialize message field [id]
    data.id = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [age]
    data.age = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocidad_relativa_x]
    data.velocidad_relativa_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocidad_relativa_y]
    data.velocidad_relativa_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocidad_absoluta_x]
    data.velocidad_absoluta_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocidad_absoluta_y]
    data.velocidad_absoluta_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocidad_absoluta_sigma_x]
    data.velocidad_absoluta_sigma_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocidad_absoluta_sigma_y]
    data.velocidad_absoluta_sigma_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bounding_box_centro_x]
    data.bounding_box_centro_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bounding_box_centro_y]
    data.bounding_box_centro_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bounding_box_largo]
    data.bounding_box_largo = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bounding_box_ancho]
    data.bounding_box_ancho = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [object_box_centro_x]
    data.object_box_centro_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [object_box_centro_y]
    data.object_box_centro_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [object_box_orientacion]
    data.object_box_orientacion = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [object_box_size_x]
    data.object_box_size_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [object_box_size_y]
    data.object_box_size_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [clasificacion]
    data.clasificacion = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [clasificacion_age]
    data.clasificacion_age = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [clasificacion_certeza]
    data.clasificacion_certeza = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [punto_cercano_x]
    data.punto_cercano_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [punto_cercano_y]
    data.punto_cercano_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [punto_referencia_x]
    data.punto_referencia_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [punto_referencia_y]
    data.punto_referencia_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [punto_referencia_sigma_x]
    data.punto_referencia_sigma_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [punto_referencia_sigma_y]
    data.punto_referencia_sigma_y = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 100;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/ibeo_objeto';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f05d4f8d7f4f7ef27109cc9e3a63af19';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #######################################################################
    # This message was automatically generated by the lcm_to_ros package
    # https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu
    #######################################################################
    #
    # Source message:    .msg
    # Creation:          lun 18 feb 2019 17:14:16 CET
    #
    #######################################################################
    int16               id
    float32             age
    float32             velocidad_relativa_x
    float32             velocidad_relativa_y
    float32             velocidad_absoluta_x
    float32             velocidad_absoluta_y
    float32             velocidad_absoluta_sigma_x
    float32             velocidad_absoluta_sigma_y
    float32             bounding_box_centro_x
    float32             bounding_box_centro_y
    float32             bounding_box_largo
    float32             bounding_box_ancho
    float32             object_box_centro_x
    float32             object_box_centro_y
    float32             object_box_orientacion
    float32             object_box_size_x
    float32             object_box_size_y
    int16               clasificacion
    float32             clasificacion_age
    float32             clasificacion_certeza
    float32             punto_cercano_x
    float32             punto_cercano_y
    float32             punto_referencia_x
    float32             punto_referencia_y
    float32             punto_referencia_sigma_x
    float32             punto_referencia_sigma_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ibeo_objeto(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.age !== undefined) {
      resolved.age = msg.age;
    }
    else {
      resolved.age = 0.0
    }

    if (msg.velocidad_relativa_x !== undefined) {
      resolved.velocidad_relativa_x = msg.velocidad_relativa_x;
    }
    else {
      resolved.velocidad_relativa_x = 0.0
    }

    if (msg.velocidad_relativa_y !== undefined) {
      resolved.velocidad_relativa_y = msg.velocidad_relativa_y;
    }
    else {
      resolved.velocidad_relativa_y = 0.0
    }

    if (msg.velocidad_absoluta_x !== undefined) {
      resolved.velocidad_absoluta_x = msg.velocidad_absoluta_x;
    }
    else {
      resolved.velocidad_absoluta_x = 0.0
    }

    if (msg.velocidad_absoluta_y !== undefined) {
      resolved.velocidad_absoluta_y = msg.velocidad_absoluta_y;
    }
    else {
      resolved.velocidad_absoluta_y = 0.0
    }

    if (msg.velocidad_absoluta_sigma_x !== undefined) {
      resolved.velocidad_absoluta_sigma_x = msg.velocidad_absoluta_sigma_x;
    }
    else {
      resolved.velocidad_absoluta_sigma_x = 0.0
    }

    if (msg.velocidad_absoluta_sigma_y !== undefined) {
      resolved.velocidad_absoluta_sigma_y = msg.velocidad_absoluta_sigma_y;
    }
    else {
      resolved.velocidad_absoluta_sigma_y = 0.0
    }

    if (msg.bounding_box_centro_x !== undefined) {
      resolved.bounding_box_centro_x = msg.bounding_box_centro_x;
    }
    else {
      resolved.bounding_box_centro_x = 0.0
    }

    if (msg.bounding_box_centro_y !== undefined) {
      resolved.bounding_box_centro_y = msg.bounding_box_centro_y;
    }
    else {
      resolved.bounding_box_centro_y = 0.0
    }

    if (msg.bounding_box_largo !== undefined) {
      resolved.bounding_box_largo = msg.bounding_box_largo;
    }
    else {
      resolved.bounding_box_largo = 0.0
    }

    if (msg.bounding_box_ancho !== undefined) {
      resolved.bounding_box_ancho = msg.bounding_box_ancho;
    }
    else {
      resolved.bounding_box_ancho = 0.0
    }

    if (msg.object_box_centro_x !== undefined) {
      resolved.object_box_centro_x = msg.object_box_centro_x;
    }
    else {
      resolved.object_box_centro_x = 0.0
    }

    if (msg.object_box_centro_y !== undefined) {
      resolved.object_box_centro_y = msg.object_box_centro_y;
    }
    else {
      resolved.object_box_centro_y = 0.0
    }

    if (msg.object_box_orientacion !== undefined) {
      resolved.object_box_orientacion = msg.object_box_orientacion;
    }
    else {
      resolved.object_box_orientacion = 0.0
    }

    if (msg.object_box_size_x !== undefined) {
      resolved.object_box_size_x = msg.object_box_size_x;
    }
    else {
      resolved.object_box_size_x = 0.0
    }

    if (msg.object_box_size_y !== undefined) {
      resolved.object_box_size_y = msg.object_box_size_y;
    }
    else {
      resolved.object_box_size_y = 0.0
    }

    if (msg.clasificacion !== undefined) {
      resolved.clasificacion = msg.clasificacion;
    }
    else {
      resolved.clasificacion = 0
    }

    if (msg.clasificacion_age !== undefined) {
      resolved.clasificacion_age = msg.clasificacion_age;
    }
    else {
      resolved.clasificacion_age = 0.0
    }

    if (msg.clasificacion_certeza !== undefined) {
      resolved.clasificacion_certeza = msg.clasificacion_certeza;
    }
    else {
      resolved.clasificacion_certeza = 0.0
    }

    if (msg.punto_cercano_x !== undefined) {
      resolved.punto_cercano_x = msg.punto_cercano_x;
    }
    else {
      resolved.punto_cercano_x = 0.0
    }

    if (msg.punto_cercano_y !== undefined) {
      resolved.punto_cercano_y = msg.punto_cercano_y;
    }
    else {
      resolved.punto_cercano_y = 0.0
    }

    if (msg.punto_referencia_x !== undefined) {
      resolved.punto_referencia_x = msg.punto_referencia_x;
    }
    else {
      resolved.punto_referencia_x = 0.0
    }

    if (msg.punto_referencia_y !== undefined) {
      resolved.punto_referencia_y = msg.punto_referencia_y;
    }
    else {
      resolved.punto_referencia_y = 0.0
    }

    if (msg.punto_referencia_sigma_x !== undefined) {
      resolved.punto_referencia_sigma_x = msg.punto_referencia_sigma_x;
    }
    else {
      resolved.punto_referencia_sigma_x = 0.0
    }

    if (msg.punto_referencia_sigma_y !== undefined) {
      resolved.punto_referencia_sigma_y = msg.punto_referencia_sigma_y;
    }
    else {
      resolved.punto_referencia_sigma_y = 0.0
    }

    return resolved;
    }
};

module.exports = ibeo_objeto;
