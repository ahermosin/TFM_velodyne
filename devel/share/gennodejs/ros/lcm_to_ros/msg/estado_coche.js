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

class estado_coche {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tiempo = null;
      this.calidad_gps = null;
      this.nro_satelites = null;
      this.posicion_x = null;
      this.posicion_y = null;
      this.orientacion = null;
      this.velocidad = null;
      this.aceleracion = null;
      this.k_posicion_x = null;
      this.k_posicion_y = null;
      this.k_orientacion = null;
      this.k_velocidad = null;
      this.k_aceleracion = null;
      this.angulo_volante = null;
      this.flag_msg_gps = null;
      this.flag_msg_canvel = null;
      this.flag_msg_canvol = null;
    }
    else {
      if (initObj.hasOwnProperty('tiempo')) {
        this.tiempo = initObj.tiempo
      }
      else {
        this.tiempo = 0.0;
      }
      if (initObj.hasOwnProperty('calidad_gps')) {
        this.calidad_gps = initObj.calidad_gps
      }
      else {
        this.calidad_gps = 0;
      }
      if (initObj.hasOwnProperty('nro_satelites')) {
        this.nro_satelites = initObj.nro_satelites
      }
      else {
        this.nro_satelites = 0;
      }
      if (initObj.hasOwnProperty('posicion_x')) {
        this.posicion_x = initObj.posicion_x
      }
      else {
        this.posicion_x = 0.0;
      }
      if (initObj.hasOwnProperty('posicion_y')) {
        this.posicion_y = initObj.posicion_y
      }
      else {
        this.posicion_y = 0.0;
      }
      if (initObj.hasOwnProperty('orientacion')) {
        this.orientacion = initObj.orientacion
      }
      else {
        this.orientacion = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad')) {
        this.velocidad = initObj.velocidad
      }
      else {
        this.velocidad = 0.0;
      }
      if (initObj.hasOwnProperty('aceleracion')) {
        this.aceleracion = initObj.aceleracion
      }
      else {
        this.aceleracion = 0.0;
      }
      if (initObj.hasOwnProperty('k_posicion_x')) {
        this.k_posicion_x = initObj.k_posicion_x
      }
      else {
        this.k_posicion_x = 0.0;
      }
      if (initObj.hasOwnProperty('k_posicion_y')) {
        this.k_posicion_y = initObj.k_posicion_y
      }
      else {
        this.k_posicion_y = 0.0;
      }
      if (initObj.hasOwnProperty('k_orientacion')) {
        this.k_orientacion = initObj.k_orientacion
      }
      else {
        this.k_orientacion = 0.0;
      }
      if (initObj.hasOwnProperty('k_velocidad')) {
        this.k_velocidad = initObj.k_velocidad
      }
      else {
        this.k_velocidad = 0.0;
      }
      if (initObj.hasOwnProperty('k_aceleracion')) {
        this.k_aceleracion = initObj.k_aceleracion
      }
      else {
        this.k_aceleracion = 0.0;
      }
      if (initObj.hasOwnProperty('angulo_volante')) {
        this.angulo_volante = initObj.angulo_volante
      }
      else {
        this.angulo_volante = 0.0;
      }
      if (initObj.hasOwnProperty('flag_msg_gps')) {
        this.flag_msg_gps = initObj.flag_msg_gps
      }
      else {
        this.flag_msg_gps = false;
      }
      if (initObj.hasOwnProperty('flag_msg_canvel')) {
        this.flag_msg_canvel = initObj.flag_msg_canvel
      }
      else {
        this.flag_msg_canvel = false;
      }
      if (initObj.hasOwnProperty('flag_msg_canvol')) {
        this.flag_msg_canvol = initObj.flag_msg_canvol
      }
      else {
        this.flag_msg_canvol = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type estado_coche
    // Serialize message field [tiempo]
    bufferOffset = _serializer.float64(obj.tiempo, buffer, bufferOffset);
    // Serialize message field [calidad_gps]
    bufferOffset = _serializer.int8(obj.calidad_gps, buffer, bufferOffset);
    // Serialize message field [nro_satelites]
    bufferOffset = _serializer.int8(obj.nro_satelites, buffer, bufferOffset);
    // Serialize message field [posicion_x]
    bufferOffset = _serializer.float64(obj.posicion_x, buffer, bufferOffset);
    // Serialize message field [posicion_y]
    bufferOffset = _serializer.float64(obj.posicion_y, buffer, bufferOffset);
    // Serialize message field [orientacion]
    bufferOffset = _serializer.float64(obj.orientacion, buffer, bufferOffset);
    // Serialize message field [velocidad]
    bufferOffset = _serializer.float64(obj.velocidad, buffer, bufferOffset);
    // Serialize message field [aceleracion]
    bufferOffset = _serializer.float64(obj.aceleracion, buffer, bufferOffset);
    // Serialize message field [k_posicion_x]
    bufferOffset = _serializer.float64(obj.k_posicion_x, buffer, bufferOffset);
    // Serialize message field [k_posicion_y]
    bufferOffset = _serializer.float64(obj.k_posicion_y, buffer, bufferOffset);
    // Serialize message field [k_orientacion]
    bufferOffset = _serializer.float64(obj.k_orientacion, buffer, bufferOffset);
    // Serialize message field [k_velocidad]
    bufferOffset = _serializer.float64(obj.k_velocidad, buffer, bufferOffset);
    // Serialize message field [k_aceleracion]
    bufferOffset = _serializer.float64(obj.k_aceleracion, buffer, bufferOffset);
    // Serialize message field [angulo_volante]
    bufferOffset = _serializer.float64(obj.angulo_volante, buffer, bufferOffset);
    // Serialize message field [flag_msg_gps]
    bufferOffset = _serializer.bool(obj.flag_msg_gps, buffer, bufferOffset);
    // Serialize message field [flag_msg_canvel]
    bufferOffset = _serializer.bool(obj.flag_msg_canvel, buffer, bufferOffset);
    // Serialize message field [flag_msg_canvol]
    bufferOffset = _serializer.bool(obj.flag_msg_canvol, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type estado_coche
    let len;
    let data = new estado_coche(null);
    // Deserialize message field [tiempo]
    data.tiempo = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [calidad_gps]
    data.calidad_gps = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [nro_satelites]
    data.nro_satelites = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [posicion_x]
    data.posicion_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [posicion_y]
    data.posicion_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [orientacion]
    data.orientacion = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocidad]
    data.velocidad = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [aceleracion]
    data.aceleracion = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_posicion_x]
    data.k_posicion_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_posicion_y]
    data.k_posicion_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_orientacion]
    data.k_orientacion = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_velocidad]
    data.k_velocidad = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_aceleracion]
    data.k_aceleracion = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angulo_volante]
    data.angulo_volante = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [flag_msg_gps]
    data.flag_msg_gps = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [flag_msg_canvel]
    data.flag_msg_canvel = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [flag_msg_canvol]
    data.flag_msg_canvol = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 101;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/estado_coche';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1daf5d53595ad9bd5965114c8d8312ce';
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
    float64             tiempo
    int8                calidad_gps
    int8                nro_satelites
    float64             posicion_x
    float64             posicion_y
    float64             orientacion
    float64             velocidad
    float64             aceleracion
    float64             k_posicion_x
    float64             k_posicion_y
    float64             k_orientacion
    float64             k_velocidad
    float64             k_aceleracion
    float64             angulo_volante
    bool                flag_msg_gps
    bool                flag_msg_canvel
    bool                flag_msg_canvol
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new estado_coche(null);
    if (msg.tiempo !== undefined) {
      resolved.tiempo = msg.tiempo;
    }
    else {
      resolved.tiempo = 0.0
    }

    if (msg.calidad_gps !== undefined) {
      resolved.calidad_gps = msg.calidad_gps;
    }
    else {
      resolved.calidad_gps = 0
    }

    if (msg.nro_satelites !== undefined) {
      resolved.nro_satelites = msg.nro_satelites;
    }
    else {
      resolved.nro_satelites = 0
    }

    if (msg.posicion_x !== undefined) {
      resolved.posicion_x = msg.posicion_x;
    }
    else {
      resolved.posicion_x = 0.0
    }

    if (msg.posicion_y !== undefined) {
      resolved.posicion_y = msg.posicion_y;
    }
    else {
      resolved.posicion_y = 0.0
    }

    if (msg.orientacion !== undefined) {
      resolved.orientacion = msg.orientacion;
    }
    else {
      resolved.orientacion = 0.0
    }

    if (msg.velocidad !== undefined) {
      resolved.velocidad = msg.velocidad;
    }
    else {
      resolved.velocidad = 0.0
    }

    if (msg.aceleracion !== undefined) {
      resolved.aceleracion = msg.aceleracion;
    }
    else {
      resolved.aceleracion = 0.0
    }

    if (msg.k_posicion_x !== undefined) {
      resolved.k_posicion_x = msg.k_posicion_x;
    }
    else {
      resolved.k_posicion_x = 0.0
    }

    if (msg.k_posicion_y !== undefined) {
      resolved.k_posicion_y = msg.k_posicion_y;
    }
    else {
      resolved.k_posicion_y = 0.0
    }

    if (msg.k_orientacion !== undefined) {
      resolved.k_orientacion = msg.k_orientacion;
    }
    else {
      resolved.k_orientacion = 0.0
    }

    if (msg.k_velocidad !== undefined) {
      resolved.k_velocidad = msg.k_velocidad;
    }
    else {
      resolved.k_velocidad = 0.0
    }

    if (msg.k_aceleracion !== undefined) {
      resolved.k_aceleracion = msg.k_aceleracion;
    }
    else {
      resolved.k_aceleracion = 0.0
    }

    if (msg.angulo_volante !== undefined) {
      resolved.angulo_volante = msg.angulo_volante;
    }
    else {
      resolved.angulo_volante = 0.0
    }

    if (msg.flag_msg_gps !== undefined) {
      resolved.flag_msg_gps = msg.flag_msg_gps;
    }
    else {
      resolved.flag_msg_gps = false
    }

    if (msg.flag_msg_canvel !== undefined) {
      resolved.flag_msg_canvel = msg.flag_msg_canvel;
    }
    else {
      resolved.flag_msg_canvel = false
    }

    if (msg.flag_msg_canvol !== undefined) {
      resolved.flag_msg_canvol = msg.flag_msg_canvol;
    }
    else {
      resolved.flag_msg_canvol = false
    }

    return resolved;
    }
};

module.exports = estado_coche;
