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

class can_modulo_estado {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Timestamp_sec = null;
      this.Timestamp_nsec = null;
      this.IdModulo = null;
      this.InputVolA = null;
      this.InputVolB = null;
      this.InputCorrA = null;
      this.InputCorrB = null;
      this.OutputAnlg1 = null;
      this.OutputAnlg2 = null;
      this.InputDig1 = null;
      this.InputDig2 = null;
      this.InputDig3 = null;
      this.InputDig4 = null;
      this.OutputDig1 = null;
      this.OutputDig2 = null;
      this.OutputDig3 = null;
      this.OutputDig4 = null;
      this.OutputDig5 = null;
      this.OutputDig6 = null;
      this.OutputDig7 = null;
      this.OutputDig8 = null;
    }
    else {
      if (initObj.hasOwnProperty('Timestamp_sec')) {
        this.Timestamp_sec = initObj.Timestamp_sec
      }
      else {
        this.Timestamp_sec = 0;
      }
      if (initObj.hasOwnProperty('Timestamp_nsec')) {
        this.Timestamp_nsec = initObj.Timestamp_nsec
      }
      else {
        this.Timestamp_nsec = 0;
      }
      if (initObj.hasOwnProperty('IdModulo')) {
        this.IdModulo = initObj.IdModulo
      }
      else {
        this.IdModulo = 0;
      }
      if (initObj.hasOwnProperty('InputVolA')) {
        this.InputVolA = initObj.InputVolA
      }
      else {
        this.InputVolA = 0.0;
      }
      if (initObj.hasOwnProperty('InputVolB')) {
        this.InputVolB = initObj.InputVolB
      }
      else {
        this.InputVolB = 0.0;
      }
      if (initObj.hasOwnProperty('InputCorrA')) {
        this.InputCorrA = initObj.InputCorrA
      }
      else {
        this.InputCorrA = 0.0;
      }
      if (initObj.hasOwnProperty('InputCorrB')) {
        this.InputCorrB = initObj.InputCorrB
      }
      else {
        this.InputCorrB = 0.0;
      }
      if (initObj.hasOwnProperty('OutputAnlg1')) {
        this.OutputAnlg1 = initObj.OutputAnlg1
      }
      else {
        this.OutputAnlg1 = 0.0;
      }
      if (initObj.hasOwnProperty('OutputAnlg2')) {
        this.OutputAnlg2 = initObj.OutputAnlg2
      }
      else {
        this.OutputAnlg2 = 0.0;
      }
      if (initObj.hasOwnProperty('InputDig1')) {
        this.InputDig1 = initObj.InputDig1
      }
      else {
        this.InputDig1 = false;
      }
      if (initObj.hasOwnProperty('InputDig2')) {
        this.InputDig2 = initObj.InputDig2
      }
      else {
        this.InputDig2 = false;
      }
      if (initObj.hasOwnProperty('InputDig3')) {
        this.InputDig3 = initObj.InputDig3
      }
      else {
        this.InputDig3 = false;
      }
      if (initObj.hasOwnProperty('InputDig4')) {
        this.InputDig4 = initObj.InputDig4
      }
      else {
        this.InputDig4 = false;
      }
      if (initObj.hasOwnProperty('OutputDig1')) {
        this.OutputDig1 = initObj.OutputDig1
      }
      else {
        this.OutputDig1 = false;
      }
      if (initObj.hasOwnProperty('OutputDig2')) {
        this.OutputDig2 = initObj.OutputDig2
      }
      else {
        this.OutputDig2 = false;
      }
      if (initObj.hasOwnProperty('OutputDig3')) {
        this.OutputDig3 = initObj.OutputDig3
      }
      else {
        this.OutputDig3 = false;
      }
      if (initObj.hasOwnProperty('OutputDig4')) {
        this.OutputDig4 = initObj.OutputDig4
      }
      else {
        this.OutputDig4 = false;
      }
      if (initObj.hasOwnProperty('OutputDig5')) {
        this.OutputDig5 = initObj.OutputDig5
      }
      else {
        this.OutputDig5 = false;
      }
      if (initObj.hasOwnProperty('OutputDig6')) {
        this.OutputDig6 = initObj.OutputDig6
      }
      else {
        this.OutputDig6 = false;
      }
      if (initObj.hasOwnProperty('OutputDig7')) {
        this.OutputDig7 = initObj.OutputDig7
      }
      else {
        this.OutputDig7 = false;
      }
      if (initObj.hasOwnProperty('OutputDig8')) {
        this.OutputDig8 = initObj.OutputDig8
      }
      else {
        this.OutputDig8 = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type can_modulo_estado
    // Serialize message field [Timestamp_sec]
    bufferOffset = _serializer.int32(obj.Timestamp_sec, buffer, bufferOffset);
    // Serialize message field [Timestamp_nsec]
    bufferOffset = _serializer.int32(obj.Timestamp_nsec, buffer, bufferOffset);
    // Serialize message field [IdModulo]
    bufferOffset = _serializer.byte(obj.IdModulo, buffer, bufferOffset);
    // Serialize message field [InputVolA]
    bufferOffset = _serializer.float64(obj.InputVolA, buffer, bufferOffset);
    // Serialize message field [InputVolB]
    bufferOffset = _serializer.float64(obj.InputVolB, buffer, bufferOffset);
    // Serialize message field [InputCorrA]
    bufferOffset = _serializer.float64(obj.InputCorrA, buffer, bufferOffset);
    // Serialize message field [InputCorrB]
    bufferOffset = _serializer.float64(obj.InputCorrB, buffer, bufferOffset);
    // Serialize message field [OutputAnlg1]
    bufferOffset = _serializer.float64(obj.OutputAnlg1, buffer, bufferOffset);
    // Serialize message field [OutputAnlg2]
    bufferOffset = _serializer.float64(obj.OutputAnlg2, buffer, bufferOffset);
    // Serialize message field [InputDig1]
    bufferOffset = _serializer.bool(obj.InputDig1, buffer, bufferOffset);
    // Serialize message field [InputDig2]
    bufferOffset = _serializer.bool(obj.InputDig2, buffer, bufferOffset);
    // Serialize message field [InputDig3]
    bufferOffset = _serializer.bool(obj.InputDig3, buffer, bufferOffset);
    // Serialize message field [InputDig4]
    bufferOffset = _serializer.bool(obj.InputDig4, buffer, bufferOffset);
    // Serialize message field [OutputDig1]
    bufferOffset = _serializer.bool(obj.OutputDig1, buffer, bufferOffset);
    // Serialize message field [OutputDig2]
    bufferOffset = _serializer.bool(obj.OutputDig2, buffer, bufferOffset);
    // Serialize message field [OutputDig3]
    bufferOffset = _serializer.bool(obj.OutputDig3, buffer, bufferOffset);
    // Serialize message field [OutputDig4]
    bufferOffset = _serializer.bool(obj.OutputDig4, buffer, bufferOffset);
    // Serialize message field [OutputDig5]
    bufferOffset = _serializer.bool(obj.OutputDig5, buffer, bufferOffset);
    // Serialize message field [OutputDig6]
    bufferOffset = _serializer.bool(obj.OutputDig6, buffer, bufferOffset);
    // Serialize message field [OutputDig7]
    bufferOffset = _serializer.bool(obj.OutputDig7, buffer, bufferOffset);
    // Serialize message field [OutputDig8]
    bufferOffset = _serializer.bool(obj.OutputDig8, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type can_modulo_estado
    let len;
    let data = new can_modulo_estado(null);
    // Deserialize message field [Timestamp_sec]
    data.Timestamp_sec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Timestamp_nsec]
    data.Timestamp_nsec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [IdModulo]
    data.IdModulo = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [InputVolA]
    data.InputVolA = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [InputVolB]
    data.InputVolB = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [InputCorrA]
    data.InputCorrA = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [InputCorrB]
    data.InputCorrB = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [OutputAnlg1]
    data.OutputAnlg1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [OutputAnlg2]
    data.OutputAnlg2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [InputDig1]
    data.InputDig1 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [InputDig2]
    data.InputDig2 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [InputDig3]
    data.InputDig3 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [InputDig4]
    data.InputDig4 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [OutputDig1]
    data.OutputDig1 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [OutputDig2]
    data.OutputDig2 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [OutputDig3]
    data.OutputDig3 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [OutputDig4]
    data.OutputDig4 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [OutputDig5]
    data.OutputDig5 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [OutputDig6]
    data.OutputDig6 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [OutputDig7]
    data.OutputDig7 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [OutputDig8]
    data.OutputDig8 = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 69;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/can_modulo_estado';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e6f65a6fba4df534967c07b0198c1dba';
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
    int32               Timestamp_sec
    int32               Timestamp_nsec
    byte                IdModulo
    float64             InputVolA
    float64             InputVolB
    float64             InputCorrA
    float64             InputCorrB
    float64             OutputAnlg1
    float64             OutputAnlg2
    bool                InputDig1
    bool                InputDig2
    bool                InputDig3
    bool                InputDig4
    bool                OutputDig1
    bool                OutputDig2
    bool                OutputDig3
    bool                OutputDig4
    bool                OutputDig5
    bool                OutputDig6
    bool                OutputDig7
    bool                OutputDig8
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new can_modulo_estado(null);
    if (msg.Timestamp_sec !== undefined) {
      resolved.Timestamp_sec = msg.Timestamp_sec;
    }
    else {
      resolved.Timestamp_sec = 0
    }

    if (msg.Timestamp_nsec !== undefined) {
      resolved.Timestamp_nsec = msg.Timestamp_nsec;
    }
    else {
      resolved.Timestamp_nsec = 0
    }

    if (msg.IdModulo !== undefined) {
      resolved.IdModulo = msg.IdModulo;
    }
    else {
      resolved.IdModulo = 0
    }

    if (msg.InputVolA !== undefined) {
      resolved.InputVolA = msg.InputVolA;
    }
    else {
      resolved.InputVolA = 0.0
    }

    if (msg.InputVolB !== undefined) {
      resolved.InputVolB = msg.InputVolB;
    }
    else {
      resolved.InputVolB = 0.0
    }

    if (msg.InputCorrA !== undefined) {
      resolved.InputCorrA = msg.InputCorrA;
    }
    else {
      resolved.InputCorrA = 0.0
    }

    if (msg.InputCorrB !== undefined) {
      resolved.InputCorrB = msg.InputCorrB;
    }
    else {
      resolved.InputCorrB = 0.0
    }

    if (msg.OutputAnlg1 !== undefined) {
      resolved.OutputAnlg1 = msg.OutputAnlg1;
    }
    else {
      resolved.OutputAnlg1 = 0.0
    }

    if (msg.OutputAnlg2 !== undefined) {
      resolved.OutputAnlg2 = msg.OutputAnlg2;
    }
    else {
      resolved.OutputAnlg2 = 0.0
    }

    if (msg.InputDig1 !== undefined) {
      resolved.InputDig1 = msg.InputDig1;
    }
    else {
      resolved.InputDig1 = false
    }

    if (msg.InputDig2 !== undefined) {
      resolved.InputDig2 = msg.InputDig2;
    }
    else {
      resolved.InputDig2 = false
    }

    if (msg.InputDig3 !== undefined) {
      resolved.InputDig3 = msg.InputDig3;
    }
    else {
      resolved.InputDig3 = false
    }

    if (msg.InputDig4 !== undefined) {
      resolved.InputDig4 = msg.InputDig4;
    }
    else {
      resolved.InputDig4 = false
    }

    if (msg.OutputDig1 !== undefined) {
      resolved.OutputDig1 = msg.OutputDig1;
    }
    else {
      resolved.OutputDig1 = false
    }

    if (msg.OutputDig2 !== undefined) {
      resolved.OutputDig2 = msg.OutputDig2;
    }
    else {
      resolved.OutputDig2 = false
    }

    if (msg.OutputDig3 !== undefined) {
      resolved.OutputDig3 = msg.OutputDig3;
    }
    else {
      resolved.OutputDig3 = false
    }

    if (msg.OutputDig4 !== undefined) {
      resolved.OutputDig4 = msg.OutputDig4;
    }
    else {
      resolved.OutputDig4 = false
    }

    if (msg.OutputDig5 !== undefined) {
      resolved.OutputDig5 = msg.OutputDig5;
    }
    else {
      resolved.OutputDig5 = false
    }

    if (msg.OutputDig6 !== undefined) {
      resolved.OutputDig6 = msg.OutputDig6;
    }
    else {
      resolved.OutputDig6 = false
    }

    if (msg.OutputDig7 !== undefined) {
      resolved.OutputDig7 = msg.OutputDig7;
    }
    else {
      resolved.OutputDig7 = false
    }

    if (msg.OutputDig8 !== undefined) {
      resolved.OutputDig8 = msg.OutputDig8;
    }
    else {
      resolved.OutputDig8 = false
    }

    return resolved;
    }
};

module.exports = can_modulo_estado;
