// Auto-generated. Do not edit!

// (in-package lcm_to_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let osm_waypoint = require('./osm_waypoint.js');

//-----------------------------------------------------------

class osm_route_request {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.inicio = null;
      this.fin = null;
      this.n_etapas = null;
      this.etapas = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('inicio')) {
        this.inicio = initObj.inicio
      }
      else {
        this.inicio = new osm_waypoint();
      }
      if (initObj.hasOwnProperty('fin')) {
        this.fin = initObj.fin
      }
      else {
        this.fin = new osm_waypoint();
      }
      if (initObj.hasOwnProperty('n_etapas')) {
        this.n_etapas = initObj.n_etapas
      }
      else {
        this.n_etapas = 0;
      }
      if (initObj.hasOwnProperty('etapas')) {
        this.etapas = initObj.etapas
      }
      else {
        this.etapas = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type osm_route_request
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [inicio]
    bufferOffset = osm_waypoint.serialize(obj.inicio, buffer, bufferOffset);
    // Serialize message field [fin]
    bufferOffset = osm_waypoint.serialize(obj.fin, buffer, bufferOffset);
    // Serialize message field [n_etapas]
    bufferOffset = _serializer.int32(obj.n_etapas, buffer, bufferOffset);
    // Serialize message field [etapas]
    // Serialize the length for message field [etapas]
    bufferOffset = _serializer.uint32(obj.etapas.length, buffer, bufferOffset);
    obj.etapas.forEach((val) => {
      bufferOffset = osm_waypoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type osm_route_request
    let len;
    let data = new osm_route_request(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [inicio]
    data.inicio = osm_waypoint.deserialize(buffer, bufferOffset);
    // Deserialize message field [fin]
    data.fin = osm_waypoint.deserialize(buffer, bufferOffset);
    // Deserialize message field [n_etapas]
    data.n_etapas = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [etapas]
    // Deserialize array length for message field [etapas]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.etapas = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.etapas[i] = osm_waypoint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.etapas.length;
    return length + 60;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/osm_route_request';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c8617b42a17e4b21ee29ddac6f86b262';
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
    int32               id
    osm_waypoint        inicio
    osm_waypoint        fin
    int32               n_etapas
    osm_waypoint[]      etapas
    
    ================================================================================
    MSG: lcm_to_ros/osm_waypoint
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
    const resolved = new osm_route_request(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.inicio !== undefined) {
      resolved.inicio = osm_waypoint.Resolve(msg.inicio)
    }
    else {
      resolved.inicio = new osm_waypoint()
    }

    if (msg.fin !== undefined) {
      resolved.fin = osm_waypoint.Resolve(msg.fin)
    }
    else {
      resolved.fin = new osm_waypoint()
    }

    if (msg.n_etapas !== undefined) {
      resolved.n_etapas = msg.n_etapas;
    }
    else {
      resolved.n_etapas = 0
    }

    if (msg.etapas !== undefined) {
      resolved.etapas = new Array(msg.etapas.length);
      for (let i = 0; i < resolved.etapas.length; ++i) {
        resolved.etapas[i] = osm_waypoint.Resolve(msg.etapas[i]);
      }
    }
    else {
      resolved.etapas = []
    }

    return resolved;
    }
};

module.exports = osm_route_request;