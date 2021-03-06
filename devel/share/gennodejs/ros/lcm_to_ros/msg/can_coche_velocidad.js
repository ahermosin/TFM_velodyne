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

class can_coche_velocidad {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp_sec = null;
      this.timestamp_nsec = null;
      this.velocidad = null;
      this.aceleracion = null;
      this.velocidad_ruedas_delanteras = null;
      this.velocidad_trasera_izquierda = null;
      this.velocidad_trasera_derecha = null;
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
      if (initObj.hasOwnProperty('velocidad_ruedas_delanteras')) {
        this.velocidad_ruedas_delanteras = initObj.velocidad_ruedas_delanteras
      }
      else {
        this.velocidad_ruedas_delanteras = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad_trasera_izquierda')) {
        this.velocidad_trasera_izquierda = initObj.velocidad_trasera_izquierda
      }
      else {
        this.velocidad_trasera_izquierda = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad_trasera_derecha')) {
        this.velocidad_trasera_derecha = initObj.velocidad_trasera_derecha
      }
      else {
        this.velocidad_trasera_derecha = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type can_coche_velocidad
    // Serialize message field [timestamp_sec]
    bufferOffset = _serializer.int32(obj.timestamp_sec, buffer, bufferOffset);
    // Serialize message field [timestamp_nsec]
    bufferOffset = _serializer.int32(obj.timestamp_nsec, buffer, bufferOffset);
    // Serialize message field [velocidad]
    bufferOffset = _serializer.float64(obj.velocidad, buffer, bufferOffset);
    // Serialize message field [aceleracion]
    bufferOffset = _serializer.float64(obj.aceleracion, buffer, bufferOffset);
    // Serialize message field [velocidad_ruedas_delanteras]
    bufferOffset = _serializer.float64(obj.velocidad_ruedas_delanteras, buffer, bufferOffset);
    // Serialize message field [velocidad_trasera_izquierda]
    bufferOffset = _serializer.float64(obj.velocidad_trasera_izquierda, buffer, bufferOffset);
    // Serialize message field [velocidad_trasera_derecha]
    bufferOffset = _serializer.float64(obj.velocidad_trasera_derecha, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type can_coche_velocidad
    let len;
    let data = new can_coche_velocidad(null);
    // Deserialize message field [timestamp_sec]
    data.timestamp_sec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [timestamp_nsec]
    data.timestamp_nsec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [velocidad]
    data.velocidad = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [aceleracion]
    data.aceleracion = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocidad_ruedas_delanteras]
    data.velocidad_ruedas_delanteras = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocidad_trasera_izquierda]
    data.velocidad_trasera_izquierda = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocidad_trasera_derecha]
    data.velocidad_trasera_derecha = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/can_coche_velocidad';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b0b5e19e1c76075e25f358480988c020';
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
    float64             velocidad
    float64             aceleracion
    float64             velocidad_ruedas_delanteras
    float64             velocidad_trasera_izquierda
    float64             velocidad_trasera_derecha
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new can_coche_velocidad(null);
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

    if (msg.velocidad_ruedas_delanteras !== undefined) {
      resolved.velocidad_ruedas_delanteras = msg.velocidad_ruedas_delanteras;
    }
    else {
      resolved.velocidad_ruedas_delanteras = 0.0
    }

    if (msg.velocidad_trasera_izquierda !== undefined) {
      resolved.velocidad_trasera_izquierda = msg.velocidad_trasera_izquierda;
    }
    else {
      resolved.velocidad_trasera_izquierda = 0.0
    }

    if (msg.velocidad_trasera_derecha !== undefined) {
      resolved.velocidad_trasera_derecha = msg.velocidad_trasera_derecha;
    }
    else {
      resolved.velocidad_trasera_derecha = 0.0
    }

    return resolved;
    }
};

module.exports = can_coche_velocidad;
