// Auto-generated. Do not edit!

// (in-package lcm_to_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let simple_channel = require('./simple_channel.js');

//-----------------------------------------------------------

class example_type {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.str = null;
      this.flag = null;
      this.gnash = null;
      this.i8_scalar = null;
      this.i8_array = null;
      this.i16_scalar = null;
      this.i16_array = null;
      this.i32_scalar = null;
      this.i32_array = null;
      this.i64_scalar = null;
      this.i64_array = null;
      this.flt_scalar = null;
      this.flt_array = null;
      this.dbl_scalar = null;
      this.dbl_array = null;
      this.variable_length_array = null;
      this.num_channels = null;
      this.channels = null;
    }
    else {
      if (initObj.hasOwnProperty('str')) {
        this.str = initObj.str
      }
      else {
        this.str = '';
      }
      if (initObj.hasOwnProperty('flag')) {
        this.flag = initObj.flag
      }
      else {
        this.flag = false;
      }
      if (initObj.hasOwnProperty('gnash')) {
        this.gnash = initObj.gnash
      }
      else {
        this.gnash = 0;
      }
      if (initObj.hasOwnProperty('i8_scalar')) {
        this.i8_scalar = initObj.i8_scalar
      }
      else {
        this.i8_scalar = 0;
      }
      if (initObj.hasOwnProperty('i8_array')) {
        this.i8_array = initObj.i8_array
      }
      else {
        this.i8_array = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('i16_scalar')) {
        this.i16_scalar = initObj.i16_scalar
      }
      else {
        this.i16_scalar = 0;
      }
      if (initObj.hasOwnProperty('i16_array')) {
        this.i16_array = initObj.i16_array
      }
      else {
        this.i16_array = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('i32_scalar')) {
        this.i32_scalar = initObj.i32_scalar
      }
      else {
        this.i32_scalar = 0;
      }
      if (initObj.hasOwnProperty('i32_array')) {
        this.i32_array = initObj.i32_array
      }
      else {
        this.i32_array = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('i64_scalar')) {
        this.i64_scalar = initObj.i64_scalar
      }
      else {
        this.i64_scalar = 0;
      }
      if (initObj.hasOwnProperty('i64_array')) {
        this.i64_array = initObj.i64_array
      }
      else {
        this.i64_array = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('flt_scalar')) {
        this.flt_scalar = initObj.flt_scalar
      }
      else {
        this.flt_scalar = 0.0;
      }
      if (initObj.hasOwnProperty('flt_array')) {
        this.flt_array = initObj.flt_array
      }
      else {
        this.flt_array = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('dbl_scalar')) {
        this.dbl_scalar = initObj.dbl_scalar
      }
      else {
        this.dbl_scalar = 0.0;
      }
      if (initObj.hasOwnProperty('dbl_array')) {
        this.dbl_array = initObj.dbl_array
      }
      else {
        this.dbl_array = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('variable_length_array')) {
        this.variable_length_array = initObj.variable_length_array
      }
      else {
        this.variable_length_array = [];
      }
      if (initObj.hasOwnProperty('num_channels')) {
        this.num_channels = initObj.num_channels
      }
      else {
        this.num_channels = 0;
      }
      if (initObj.hasOwnProperty('channels')) {
        this.channels = initObj.channels
      }
      else {
        this.channels = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type example_type
    // Serialize message field [str]
    bufferOffset = _serializer.string(obj.str, buffer, bufferOffset);
    // Serialize message field [flag]
    bufferOffset = _serializer.bool(obj.flag, buffer, bufferOffset);
    // Serialize message field [gnash]
    bufferOffset = _serializer.byte(obj.gnash, buffer, bufferOffset);
    // Serialize message field [i8_scalar]
    bufferOffset = _serializer.int8(obj.i8_scalar, buffer, bufferOffset);
    // Check that the constant length array field [i8_array] has the right length
    if (obj.i8_array.length !== 2) {
      throw new Error('Unable to serialize array field i8_array - length must be 2')
    }
    // Serialize message field [i8_array]
    bufferOffset = _arraySerializer.int8(obj.i8_array, buffer, bufferOffset, 2);
    // Serialize message field [i16_scalar]
    bufferOffset = _serializer.int16(obj.i16_scalar, buffer, bufferOffset);
    // Check that the constant length array field [i16_array] has the right length
    if (obj.i16_array.length !== 2) {
      throw new Error('Unable to serialize array field i16_array - length must be 2')
    }
    // Serialize message field [i16_array]
    bufferOffset = _arraySerializer.int16(obj.i16_array, buffer, bufferOffset, 2);
    // Serialize message field [i32_scalar]
    bufferOffset = _serializer.int32(obj.i32_scalar, buffer, bufferOffset);
    // Check that the constant length array field [i32_array] has the right length
    if (obj.i32_array.length !== 2) {
      throw new Error('Unable to serialize array field i32_array - length must be 2')
    }
    // Serialize message field [i32_array]
    bufferOffset = _arraySerializer.int32(obj.i32_array, buffer, bufferOffset, 2);
    // Serialize message field [i64_scalar]
    bufferOffset = _serializer.int64(obj.i64_scalar, buffer, bufferOffset);
    // Check that the constant length array field [i64_array] has the right length
    if (obj.i64_array.length !== 2) {
      throw new Error('Unable to serialize array field i64_array - length must be 2')
    }
    // Serialize message field [i64_array]
    bufferOffset = _arraySerializer.int64(obj.i64_array, buffer, bufferOffset, 2);
    // Serialize message field [flt_scalar]
    bufferOffset = _serializer.float32(obj.flt_scalar, buffer, bufferOffset);
    // Check that the constant length array field [flt_array] has the right length
    if (obj.flt_array.length !== 2) {
      throw new Error('Unable to serialize array field flt_array - length must be 2')
    }
    // Serialize message field [flt_array]
    bufferOffset = _arraySerializer.float32(obj.flt_array, buffer, bufferOffset, 2);
    // Serialize message field [dbl_scalar]
    bufferOffset = _serializer.float64(obj.dbl_scalar, buffer, bufferOffset);
    // Check that the constant length array field [dbl_array] has the right length
    if (obj.dbl_array.length !== 2) {
      throw new Error('Unable to serialize array field dbl_array - length must be 2')
    }
    // Serialize message field [dbl_array]
    bufferOffset = _arraySerializer.float64(obj.dbl_array, buffer, bufferOffset, 2);
    // Serialize message field [variable_length_array]
    bufferOffset = _arraySerializer.float64(obj.variable_length_array, buffer, bufferOffset, null);
    // Serialize message field [num_channels]
    bufferOffset = _serializer.int32(obj.num_channels, buffer, bufferOffset);
    // Serialize message field [channels]
    // Serialize the length for message field [channels]
    bufferOffset = _serializer.uint32(obj.channels.length, buffer, bufferOffset);
    obj.channels.forEach((val) => {
      bufferOffset = simple_channel.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type example_type
    let len;
    let data = new example_type(null);
    // Deserialize message field [str]
    data.str = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [flag]
    data.flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [gnash]
    data.gnash = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [i8_scalar]
    data.i8_scalar = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [i8_array]
    data.i8_array = _arrayDeserializer.int8(buffer, bufferOffset, 2)
    // Deserialize message field [i16_scalar]
    data.i16_scalar = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [i16_array]
    data.i16_array = _arrayDeserializer.int16(buffer, bufferOffset, 2)
    // Deserialize message field [i32_scalar]
    data.i32_scalar = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [i32_array]
    data.i32_array = _arrayDeserializer.int32(buffer, bufferOffset, 2)
    // Deserialize message field [i64_scalar]
    data.i64_scalar = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [i64_array]
    data.i64_array = _arrayDeserializer.int64(buffer, bufferOffset, 2)
    // Deserialize message field [flt_scalar]
    data.flt_scalar = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flt_array]
    data.flt_array = _arrayDeserializer.float32(buffer, bufferOffset, 2)
    // Deserialize message field [dbl_scalar]
    data.dbl_scalar = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dbl_array]
    data.dbl_array = _arrayDeserializer.float64(buffer, bufferOffset, 2)
    // Deserialize message field [variable_length_array]
    data.variable_length_array = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [num_channels]
    data.num_channels = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [channels]
    // Deserialize array length for message field [channels]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.channels = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.channels[i] = simple_channel.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.str.length;
    length += 8 * object.variable_length_array.length;
    object.channels.forEach((val) => {
      length += simple_channel.getMessageSize(val);
    });
    return length + 99;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/example_type';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1dc0698e415584c20abf27e7abb42161';
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
    # Creation:          jue 07 mar 2019 13:27:48 CET
    #
    #######################################################################
    string              str
    bool                flag
    byte                gnash
    int8                i8_scalar
    int8[2]             i8_array
    int16               i16_scalar
    int16[2]            i16_array
    int32               i32_scalar
    int32[2]            i32_array
    int64               i64_scalar
    int64[2]            i64_array
    float32             flt_scalar
    float32[2]          flt_array
    float64             dbl_scalar
    float64[2]          dbl_array
    float64[]           variable_length_array
    int32               num_channels
    simple_channel[]    channels
    
    ================================================================================
    MSG: lcm_to_ros/simple_channel
    #######################################################################
    # This message was automatically generated by the lcm_to_ros package
    # https://github.com/nrjl/lcm_to_ros, nicholas.lawrance@oregonstate.edu
    #######################################################################
    #
    # Source message:    .msg
    # Creation:          jue 07 mar 2019 13:27:48 CET
    #
    #######################################################################
    string              name
    float64             value
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new example_type(null);
    if (msg.str !== undefined) {
      resolved.str = msg.str;
    }
    else {
      resolved.str = ''
    }

    if (msg.flag !== undefined) {
      resolved.flag = msg.flag;
    }
    else {
      resolved.flag = false
    }

    if (msg.gnash !== undefined) {
      resolved.gnash = msg.gnash;
    }
    else {
      resolved.gnash = 0
    }

    if (msg.i8_scalar !== undefined) {
      resolved.i8_scalar = msg.i8_scalar;
    }
    else {
      resolved.i8_scalar = 0
    }

    if (msg.i8_array !== undefined) {
      resolved.i8_array = msg.i8_array;
    }
    else {
      resolved.i8_array = new Array(2).fill(0)
    }

    if (msg.i16_scalar !== undefined) {
      resolved.i16_scalar = msg.i16_scalar;
    }
    else {
      resolved.i16_scalar = 0
    }

    if (msg.i16_array !== undefined) {
      resolved.i16_array = msg.i16_array;
    }
    else {
      resolved.i16_array = new Array(2).fill(0)
    }

    if (msg.i32_scalar !== undefined) {
      resolved.i32_scalar = msg.i32_scalar;
    }
    else {
      resolved.i32_scalar = 0
    }

    if (msg.i32_array !== undefined) {
      resolved.i32_array = msg.i32_array;
    }
    else {
      resolved.i32_array = new Array(2).fill(0)
    }

    if (msg.i64_scalar !== undefined) {
      resolved.i64_scalar = msg.i64_scalar;
    }
    else {
      resolved.i64_scalar = 0
    }

    if (msg.i64_array !== undefined) {
      resolved.i64_array = msg.i64_array;
    }
    else {
      resolved.i64_array = new Array(2).fill(0)
    }

    if (msg.flt_scalar !== undefined) {
      resolved.flt_scalar = msg.flt_scalar;
    }
    else {
      resolved.flt_scalar = 0.0
    }

    if (msg.flt_array !== undefined) {
      resolved.flt_array = msg.flt_array;
    }
    else {
      resolved.flt_array = new Array(2).fill(0)
    }

    if (msg.dbl_scalar !== undefined) {
      resolved.dbl_scalar = msg.dbl_scalar;
    }
    else {
      resolved.dbl_scalar = 0.0
    }

    if (msg.dbl_array !== undefined) {
      resolved.dbl_array = msg.dbl_array;
    }
    else {
      resolved.dbl_array = new Array(2).fill(0)
    }

    if (msg.variable_length_array !== undefined) {
      resolved.variable_length_array = msg.variable_length_array;
    }
    else {
      resolved.variable_length_array = []
    }

    if (msg.num_channels !== undefined) {
      resolved.num_channels = msg.num_channels;
    }
    else {
      resolved.num_channels = 0
    }

    if (msg.channels !== undefined) {
      resolved.channels = new Array(msg.channels.length);
      for (let i = 0; i < resolved.channels.length; ++i) {
        resolved.channels[i] = simple_channel.Resolve(msg.channels[i]);
      }
    }
    else {
      resolved.channels = []
    }

    return resolved;
    }
};

module.exports = example_type;
