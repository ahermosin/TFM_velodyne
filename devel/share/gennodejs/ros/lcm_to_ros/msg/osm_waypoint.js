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

class osm_waypoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.latitud = null;
      this.longitud = null;
      this.orientacion = null;
    }
    else {
      if (initObj.hasOwnProperty('latitud')) {
        this.latitud = initObj.latitud
      }
      else {
        this.latitud = 0.0;
      }
      if (initObj.hasOwnProperty('longitud')) {
        this.longitud = initObj.longitud
      }
      else {
        this.longitud = 0.0;
      }
      if (initObj.hasOwnProperty('orientacion')) {
        this.orientacion = initObj.orientacion
      }
      else {
        this.orientacion = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type osm_waypoint
    // Serialize message field [latitud]
    bufferOffset = _serializer.float64(obj.latitud, buffer, bufferOffset);
    // Serialize message field [longitud]
    bufferOffset = _serializer.float64(obj.longitud, buffer, bufferOffset);
    // Serialize message field [orientacion]
    bufferOffset = _serializer.float64(obj.orientacion, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type osm_waypoint
    let len;
    let data = new osm_waypoint(null);
    // Deserialize message field [latitud]
    data.latitud = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longitud]
    data.longitud = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [orientacion]
    data.orientacion = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/osm_waypoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '381e9e73dfbceb05072087b2ae24cbf1';
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
    float64             latitud
    float64             longitud
    float64             orientacion
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new osm_waypoint(null);
    if (msg.latitud !== undefined) {
      resolved.latitud = msg.latitud;
    }
    else {
      resolved.latitud = 0.0
    }

    if (msg.longitud !== undefined) {
      resolved.longitud = msg.longitud;
    }
    else {
      resolved.longitud = 0.0
    }

    if (msg.orientacion !== undefined) {
      resolved.orientacion = msg.orientacion;
    }
    else {
      resolved.orientacion = 0.0
    }

    return resolved;
    }
};

module.exports = osm_waypoint;
