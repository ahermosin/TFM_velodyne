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

class mobileye_tsr_status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp_sec = null;
      this.timestamp_nsec = null;
      this.tsr1_tipo = null;
      this.tsr1_valor = null;
      this.tsr2_tipo = null;
      this.tsr2_valor = null;
      this.tsr3_tipo = null;
      this.tsr3_valor = null;
      this.tsr4_tipo = null;
      this.tsr4_valor = null;
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
      if (initObj.hasOwnProperty('tsr1_tipo')) {
        this.tsr1_tipo = initObj.tsr1_tipo
      }
      else {
        this.tsr1_tipo = 0;
      }
      if (initObj.hasOwnProperty('tsr1_valor')) {
        this.tsr1_valor = initObj.tsr1_valor
      }
      else {
        this.tsr1_valor = 0;
      }
      if (initObj.hasOwnProperty('tsr2_tipo')) {
        this.tsr2_tipo = initObj.tsr2_tipo
      }
      else {
        this.tsr2_tipo = 0;
      }
      if (initObj.hasOwnProperty('tsr2_valor')) {
        this.tsr2_valor = initObj.tsr2_valor
      }
      else {
        this.tsr2_valor = 0;
      }
      if (initObj.hasOwnProperty('tsr3_tipo')) {
        this.tsr3_tipo = initObj.tsr3_tipo
      }
      else {
        this.tsr3_tipo = 0;
      }
      if (initObj.hasOwnProperty('tsr3_valor')) {
        this.tsr3_valor = initObj.tsr3_valor
      }
      else {
        this.tsr3_valor = 0;
      }
      if (initObj.hasOwnProperty('tsr4_tipo')) {
        this.tsr4_tipo = initObj.tsr4_tipo
      }
      else {
        this.tsr4_tipo = 0;
      }
      if (initObj.hasOwnProperty('tsr4_valor')) {
        this.tsr4_valor = initObj.tsr4_valor
      }
      else {
        this.tsr4_valor = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mobileye_tsr_status
    // Serialize message field [timestamp_sec]
    bufferOffset = _serializer.int32(obj.timestamp_sec, buffer, bufferOffset);
    // Serialize message field [timestamp_nsec]
    bufferOffset = _serializer.int32(obj.timestamp_nsec, buffer, bufferOffset);
    // Serialize message field [tsr1_tipo]
    bufferOffset = _serializer.byte(obj.tsr1_tipo, buffer, bufferOffset);
    // Serialize message field [tsr1_valor]
    bufferOffset = _serializer.byte(obj.tsr1_valor, buffer, bufferOffset);
    // Serialize message field [tsr2_tipo]
    bufferOffset = _serializer.byte(obj.tsr2_tipo, buffer, bufferOffset);
    // Serialize message field [tsr2_valor]
    bufferOffset = _serializer.byte(obj.tsr2_valor, buffer, bufferOffset);
    // Serialize message field [tsr3_tipo]
    bufferOffset = _serializer.byte(obj.tsr3_tipo, buffer, bufferOffset);
    // Serialize message field [tsr3_valor]
    bufferOffset = _serializer.byte(obj.tsr3_valor, buffer, bufferOffset);
    // Serialize message field [tsr4_tipo]
    bufferOffset = _serializer.byte(obj.tsr4_tipo, buffer, bufferOffset);
    // Serialize message field [tsr4_valor]
    bufferOffset = _serializer.byte(obj.tsr4_valor, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mobileye_tsr_status
    let len;
    let data = new mobileye_tsr_status(null);
    // Deserialize message field [timestamp_sec]
    data.timestamp_sec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [timestamp_nsec]
    data.timestamp_nsec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [tsr1_tipo]
    data.tsr1_tipo = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [tsr1_valor]
    data.tsr1_valor = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [tsr2_tipo]
    data.tsr2_tipo = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [tsr2_valor]
    data.tsr2_valor = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [tsr3_tipo]
    data.tsr3_tipo = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [tsr3_valor]
    data.tsr3_valor = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [tsr4_tipo]
    data.tsr4_tipo = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [tsr4_valor]
    data.tsr4_valor = _deserializer.byte(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/mobileye_tsr_status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8ddb6df2c3438877c3e5e4ec2624a854';
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
    # Creation:          lun 18 feb 2019 17:14:17 CET
    #
    #######################################################################
    int32               timestamp_sec
    int32               timestamp_nsec
    byte                tsr1_tipo
    byte                tsr1_valor
    byte                tsr2_tipo
    byte                tsr2_valor
    byte                tsr3_tipo
    byte                tsr3_valor
    byte                tsr4_tipo
    byte                tsr4_valor
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mobileye_tsr_status(null);
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

    if (msg.tsr1_tipo !== undefined) {
      resolved.tsr1_tipo = msg.tsr1_tipo;
    }
    else {
      resolved.tsr1_tipo = 0
    }

    if (msg.tsr1_valor !== undefined) {
      resolved.tsr1_valor = msg.tsr1_valor;
    }
    else {
      resolved.tsr1_valor = 0
    }

    if (msg.tsr2_tipo !== undefined) {
      resolved.tsr2_tipo = msg.tsr2_tipo;
    }
    else {
      resolved.tsr2_tipo = 0
    }

    if (msg.tsr2_valor !== undefined) {
      resolved.tsr2_valor = msg.tsr2_valor;
    }
    else {
      resolved.tsr2_valor = 0
    }

    if (msg.tsr3_tipo !== undefined) {
      resolved.tsr3_tipo = msg.tsr3_tipo;
    }
    else {
      resolved.tsr3_tipo = 0
    }

    if (msg.tsr3_valor !== undefined) {
      resolved.tsr3_valor = msg.tsr3_valor;
    }
    else {
      resolved.tsr3_valor = 0
    }

    if (msg.tsr4_tipo !== undefined) {
      resolved.tsr4_tipo = msg.tsr4_tipo;
    }
    else {
      resolved.tsr4_tipo = 0
    }

    if (msg.tsr4_valor !== undefined) {
      resolved.tsr4_valor = msg.tsr4_valor;
    }
    else {
      resolved.tsr4_valor = 0
    }

    return resolved;
    }
};

module.exports = mobileye_tsr_status;
