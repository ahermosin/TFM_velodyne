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

class can_coche_direccion {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp_sec = null;
      this.timestamp_nsec = null;
      this.angulo_volante = null;
      this.velocidad_volante = null;
      this.angulo_columna = null;
      this.velocidad_columna = null;
      this.par_direccion = null;
      this.flag_mensajes = null;
    }
    else {
      if (initObj.hasOwnProperty('timestamp_sec')) {
        this.timestamp_sec = initObj.timestamp_sec
      }
      else {
        this.timestamp_sec = 0;
      }
      if (initObj.hasOwnProperty('timestamp_nsec')) {
        this.timestamp_nsec = initObj.timestamp_nsec
      }
      else {
        this.timestamp_nsec = 0;
      }
      if (initObj.hasOwnProperty('angulo_volante')) {
        this.angulo_volante = initObj.angulo_volante
      }
      else {
        this.angulo_volante = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad_volante')) {
        this.velocidad_volante = initObj.velocidad_volante
      }
      else {
        this.velocidad_volante = 0.0;
      }
      if (initObj.hasOwnProperty('angulo_columna')) {
        this.angulo_columna = initObj.angulo_columna
      }
      else {
        this.angulo_columna = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad_columna')) {
        this.velocidad_columna = initObj.velocidad_columna
      }
      else {
        this.velocidad_columna = 0.0;
      }
      if (initObj.hasOwnProperty('par_direccion')) {
        this.par_direccion = initObj.par_direccion
      }
      else {
        this.par_direccion = 0.0;
      }
      if (initObj.hasOwnProperty('flag_mensajes')) {
        this.flag_mensajes = initObj.flag_mensajes
      }
      else {
        this.flag_mensajes = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type can_coche_direccion
    // Serialize message field [timestamp_sec]
    bufferOffset = _serializer.int32(obj.timestamp_sec, buffer, bufferOffset);
    // Serialize message field [timestamp_nsec]
    bufferOffset = _serializer.int32(obj.timestamp_nsec, buffer, bufferOffset);
    // Serialize message field [angulo_volante]
    bufferOffset = _serializer.float64(obj.angulo_volante, buffer, bufferOffset);
    // Serialize message field [velocidad_volante]
    bufferOffset = _serializer.float64(obj.velocidad_volante, buffer, bufferOffset);
    // Serialize message field [angulo_columna]
    bufferOffset = _serializer.float64(obj.angulo_columna, buffer, bufferOffset);
    // Serialize message field [velocidad_columna]
    bufferOffset = _serializer.float64(obj.velocidad_columna, buffer, bufferOffset);
    // Serialize message field [par_direccion]
    bufferOffset = _serializer.float64(obj.par_direccion, buffer, bufferOffset);
    // Serialize message field [flag_mensajes]
    bufferOffset = _serializer.byte(obj.flag_mensajes, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type can_coche_direccion
    let len;
    let data = new can_coche_direccion(null);
    // Deserialize message field [timestamp_sec]
    data.timestamp_sec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [timestamp_nsec]
    data.timestamp_nsec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [angulo_volante]
    data.angulo_volante = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocidad_volante]
    data.velocidad_volante = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angulo_columna]
    data.angulo_columna = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocidad_columna]
    data.velocidad_columna = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [par_direccion]
    data.par_direccion = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [flag_mensajes]
    data.flag_mensajes = _deserializer.byte(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 49;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/can_coche_direccion';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2a77a418fbb4092f983b505954b450fd';
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
    # Creation:          lun 18 feb 2019 17:14:15 CET
    #
    #######################################################################
    int32               timestamp_sec
    int32               timestamp_nsec
    float64             angulo_volante
    float64             velocidad_volante
    float64             angulo_columna
    float64             velocidad_columna
    float64             par_direccion
    byte                flag_mensajes
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new can_coche_direccion(null);
    if (msg.timestamp_sec !== undefined) {
      resolved.timestamp_sec = msg.timestamp_sec;
    }
    else {
      resolved.timestamp_sec = 0
    }

    if (msg.timestamp_nsec !== undefined) {
      resolved.timestamp_nsec = msg.timestamp_nsec;
    }
    else {
      resolved.timestamp_nsec = 0
    }

    if (msg.angulo_volante !== undefined) {
      resolved.angulo_volante = msg.angulo_volante;
    }
    else {
      resolved.angulo_volante = 0.0
    }

    if (msg.velocidad_volante !== undefined) {
      resolved.velocidad_volante = msg.velocidad_volante;
    }
    else {
      resolved.velocidad_volante = 0.0
    }

    if (msg.angulo_columna !== undefined) {
      resolved.angulo_columna = msg.angulo_columna;
    }
    else {
      resolved.angulo_columna = 0.0
    }

    if (msg.velocidad_columna !== undefined) {
      resolved.velocidad_columna = msg.velocidad_columna;
    }
    else {
      resolved.velocidad_columna = 0.0
    }

    if (msg.par_direccion !== undefined) {
      resolved.par_direccion = msg.par_direccion;
    }
    else {
      resolved.par_direccion = 0.0
    }

    if (msg.flag_mensajes !== undefined) {
      resolved.flag_mensajes = msg.flag_mensajes;
    }
    else {
      resolved.flag_mensajes = 0
    }

    return resolved;
    }
};

module.exports = can_coche_direccion;
