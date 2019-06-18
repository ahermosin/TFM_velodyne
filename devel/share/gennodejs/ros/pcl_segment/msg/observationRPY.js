// Auto-generated. Do not edit!

// (in-package pcl_segment.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let positionRPY = require('./positionRPY.js');

//-----------------------------------------------------------

class observationRPY {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position = null;
      this.is_Known = null;
    }
    else {
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new positionRPY();
      }
      if (initObj.hasOwnProperty('is_Known')) {
        this.is_Known = initObj.is_Known
      }
      else {
        this.is_Known = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type observationRPY
    // Serialize message field [position]
    bufferOffset = positionRPY.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [is_Known]
    bufferOffset = _serializer.bool(obj.is_Known, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type observationRPY
    let len;
    let data = new observationRPY(null);
    // Deserialize message field [position]
    data.position = positionRPY.deserialize(buffer, bufferOffset);
    // Deserialize message field [is_Known]
    data.is_Known = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 57;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pcl_segment/observationRPY';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4dd6d3d5c4e65b8b85418ed0108e97f8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    pcl_segment/positionRPY position
    bool is_Known
    
    ================================================================================
    MSG: pcl_segment/positionRPY
    float64 x
    float64 y
    float64 z
    float64 roll
    float64 pitch
    float64 yaw
    time stamp
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new observationRPY(null);
    if (msg.position !== undefined) {
      resolved.position = positionRPY.Resolve(msg.position)
    }
    else {
      resolved.position = new positionRPY()
    }

    if (msg.is_Known !== undefined) {
      resolved.is_Known = msg.is_Known;
    }
    else {
      resolved.is_Known = false
    }

    return resolved;
    }
};

module.exports = observationRPY;
