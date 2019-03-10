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

class estado_coche_LL {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tiempo = null;
      this.calidad_gps = null;
      this.nro_satelites = null;
      this.UTM_x = null;
      this.UTM_y = null;
      this.orientacion = null;
      this.velocidad = null;
      this.aceleracion = null;
      this.k_UTM_x = null;
      this.k_UTM_y = null;
      this.k_longitud = null;
      this.k_latitud = null;
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
      if (initObj.hasOwnProperty('UTM_x')) {
        this.UTM_x = initObj.UTM_x
      }
      else {
        this.UTM_x = 0.0;
      }
      if (initObj.hasOwnProperty('UTM_y')) {
        this.UTM_y = initObj.UTM_y
      }
      else {
        this.UTM_y = 0.0;
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
      if (initObj.hasOwnProperty('k_UTM_x')) {
        this.k_UTM_x = initObj.k_UTM_x
      }
      else {
        this.k_UTM_x = 0.0;
      }
      if (initObj.hasOwnProperty('k_UTM_y')) {
        this.k_UTM_y = initObj.k_UTM_y
      }
      else {
        this.k_UTM_y = 0.0;
      }
      if (initObj.hasOwnProperty('k_longitud')) {
        this.k_longitud = initObj.k_longitud
      }
      else {
        this.k_longitud = 0.0;
      }
      if (initObj.hasOwnProperty('k_latitud')) {
        this.k_latitud = initObj.k_latitud
      }
      else {
        this.k_latitud = 0.0;
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
    // Serializes a message object of type estado_coche_LL
    // Serialize message field [tiempo]
    bufferOffset = _serializer.float64(obj.tiempo, buffer, bufferOffset);
    // Serialize message field [calidad_gps]
    bufferOffset = _serializer.int8(obj.calidad_gps, buffer, bufferOffset);
    // Serialize message field [nro_satelites]
    bufferOffset = _serializer.int8(obj.nro_satelites, buffer, bufferOffset);
    // Serialize message field [UTM_x]
    bufferOffset = _serializer.float64(obj.UTM_x, buffer, bufferOffset);
    // Serialize message field [UTM_y]
    bufferOffset = _serializer.float64(obj.UTM_y, buffer, bufferOffset);
    // Serialize message field [orientacion]
    bufferOffset = _serializer.float64(obj.orientacion, buffer, bufferOffset);
    // Serialize message field [velocidad]
    bufferOffset = _serializer.float64(obj.velocidad, buffer, bufferOffset);
    // Serialize message field [aceleracion]
    bufferOffset = _serializer.float64(obj.aceleracion, buffer, bufferOffset);
    // Serialize message field [k_UTM_x]
    bufferOffset = _serializer.float64(obj.k_UTM_x, buffer, bufferOffset);
    // Serialize message field [k_UTM_y]
    bufferOffset = _serializer.float64(obj.k_UTM_y, buffer, bufferOffset);
    // Serialize message field [k_longitud]
    bufferOffset = _serializer.float64(obj.k_longitud, buffer, bufferOffset);
    // Serialize message field [k_latitud]
    bufferOffset = _serializer.float64(obj.k_latitud, buffer, bufferOffset);
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
    //deserializes a message object of type estado_coche_LL
    let len;
    let data = new estado_coche_LL(null);
    // Deserialize message field [tiempo]
    data.tiempo = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [calidad_gps]
    data.calidad_gps = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [nro_satelites]
    data.nro_satelites = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [UTM_x]
    data.UTM_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [UTM_y]
    data.UTM_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [orientacion]
    data.orientacion = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocidad]
    data.velocidad = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [aceleracion]
    data.aceleracion = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_UTM_x]
    data.k_UTM_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_UTM_y]
    data.k_UTM_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_longitud]
    data.k_longitud = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_latitud]
    data.k_latitud = _deserializer.float64(buffer, bufferOffset);
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
    return 117;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/estado_coche_LL';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e7c25e06970f89ceb6cf213885e085a4';
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
    float64             UTM_x
    float64             UTM_y
    float64             orientacion
    float64             velocidad
    float64             aceleracion
    float64             k_UTM_x
    float64             k_UTM_y
    float64             k_longitud
    float64             k_latitud
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
    const resolved = new estado_coche_LL(null);
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

    if (msg.UTM_x !== undefined) {
      resolved.UTM_x = msg.UTM_x;
    }
    else {
      resolved.UTM_x = 0.0
    }

    if (msg.UTM_y !== undefined) {
      resolved.UTM_y = msg.UTM_y;
    }
    else {
      resolved.UTM_y = 0.0
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

    if (msg.k_UTM_x !== undefined) {
      resolved.k_UTM_x = msg.k_UTM_x;
    }
    else {
      resolved.k_UTM_x = 0.0
    }

    if (msg.k_UTM_y !== undefined) {
      resolved.k_UTM_y = msg.k_UTM_y;
    }
    else {
      resolved.k_UTM_y = 0.0
    }

    if (msg.k_longitud !== undefined) {
      resolved.k_longitud = msg.k_longitud;
    }
    else {
      resolved.k_longitud = 0.0
    }

    if (msg.k_latitud !== undefined) {
      resolved.k_latitud = msg.k_latitud;
    }
    else {
      resolved.k_latitud = 0.0
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

module.exports = estado_coche_LL;
