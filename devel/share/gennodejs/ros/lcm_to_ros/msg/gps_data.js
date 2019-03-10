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

class gps_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp_sec = null;
      this.timestamp_nsec = null;
      this.hora = null;
      this.utm_este = null;
      this.utm_norte = null;
      this.longitud = null;
      this.latitud = null;
      this.altura = null;
      this.hdop = null;
      this.velocidad = null;
      this.heading_vel = null;
      this.semi_major_desv = null;
      this.semi_minor_desv = null;
      this.semi_major_orien = null;
      this.calidad = null;
      this.nro_satelites = null;
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
      if (initObj.hasOwnProperty('hora')) {
        this.hora = initObj.hora
      }
      else {
        this.hora = 0.0;
      }
      if (initObj.hasOwnProperty('utm_este')) {
        this.utm_este = initObj.utm_este
      }
      else {
        this.utm_este = 0.0;
      }
      if (initObj.hasOwnProperty('utm_norte')) {
        this.utm_norte = initObj.utm_norte
      }
      else {
        this.utm_norte = 0.0;
      }
      if (initObj.hasOwnProperty('longitud')) {
        this.longitud = initObj.longitud
      }
      else {
        this.longitud = 0.0;
      }
      if (initObj.hasOwnProperty('latitud')) {
        this.latitud = initObj.latitud
      }
      else {
        this.latitud = 0.0;
      }
      if (initObj.hasOwnProperty('altura')) {
        this.altura = initObj.altura
      }
      else {
        this.altura = 0.0;
      }
      if (initObj.hasOwnProperty('hdop')) {
        this.hdop = initObj.hdop
      }
      else {
        this.hdop = 0.0;
      }
      if (initObj.hasOwnProperty('velocidad')) {
        this.velocidad = initObj.velocidad
      }
      else {
        this.velocidad = 0.0;
      }
      if (initObj.hasOwnProperty('heading_vel')) {
        this.heading_vel = initObj.heading_vel
      }
      else {
        this.heading_vel = 0.0;
      }
      if (initObj.hasOwnProperty('semi_major_desv')) {
        this.semi_major_desv = initObj.semi_major_desv
      }
      else {
        this.semi_major_desv = 0.0;
      }
      if (initObj.hasOwnProperty('semi_minor_desv')) {
        this.semi_minor_desv = initObj.semi_minor_desv
      }
      else {
        this.semi_minor_desv = 0.0;
      }
      if (initObj.hasOwnProperty('semi_major_orien')) {
        this.semi_major_orien = initObj.semi_major_orien
      }
      else {
        this.semi_major_orien = 0.0;
      }
      if (initObj.hasOwnProperty('calidad')) {
        this.calidad = initObj.calidad
      }
      else {
        this.calidad = 0;
      }
      if (initObj.hasOwnProperty('nro_satelites')) {
        this.nro_satelites = initObj.nro_satelites
      }
      else {
        this.nro_satelites = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gps_data
    // Serialize message field [timestamp_sec]
    bufferOffset = _serializer.int32(obj.timestamp_sec, buffer, bufferOffset);
    // Serialize message field [timestamp_nsec]
    bufferOffset = _serializer.int32(obj.timestamp_nsec, buffer, bufferOffset);
    // Serialize message field [hora]
    bufferOffset = _serializer.float64(obj.hora, buffer, bufferOffset);
    // Serialize message field [utm_este]
    bufferOffset = _serializer.float64(obj.utm_este, buffer, bufferOffset);
    // Serialize message field [utm_norte]
    bufferOffset = _serializer.float64(obj.utm_norte, buffer, bufferOffset);
    // Serialize message field [longitud]
    bufferOffset = _serializer.float64(obj.longitud, buffer, bufferOffset);
    // Serialize message field [latitud]
    bufferOffset = _serializer.float64(obj.latitud, buffer, bufferOffset);
    // Serialize message field [altura]
    bufferOffset = _serializer.float64(obj.altura, buffer, bufferOffset);
    // Serialize message field [hdop]
    bufferOffset = _serializer.float64(obj.hdop, buffer, bufferOffset);
    // Serialize message field [velocidad]
    bufferOffset = _serializer.float64(obj.velocidad, buffer, bufferOffset);
    // Serialize message field [heading_vel]
    bufferOffset = _serializer.float64(obj.heading_vel, buffer, bufferOffset);
    // Serialize message field [semi_major_desv]
    bufferOffset = _serializer.float64(obj.semi_major_desv, buffer, bufferOffset);
    // Serialize message field [semi_minor_desv]
    bufferOffset = _serializer.float64(obj.semi_minor_desv, buffer, bufferOffset);
    // Serialize message field [semi_major_orien]
    bufferOffset = _serializer.float64(obj.semi_major_orien, buffer, bufferOffset);
    // Serialize message field [calidad]
    bufferOffset = _serializer.int8(obj.calidad, buffer, bufferOffset);
    // Serialize message field [nro_satelites]
    bufferOffset = _serializer.int8(obj.nro_satelites, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gps_data
    let len;
    let data = new gps_data(null);
    // Deserialize message field [timestamp_sec]
    data.timestamp_sec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [timestamp_nsec]
    data.timestamp_nsec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [hora]
    data.hora = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [utm_este]
    data.utm_este = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [utm_norte]
    data.utm_norte = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longitud]
    data.longitud = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [latitud]
    data.latitud = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [altura]
    data.altura = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [hdop]
    data.hdop = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocidad]
    data.velocidad = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [heading_vel]
    data.heading_vel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [semi_major_desv]
    data.semi_major_desv = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [semi_minor_desv]
    data.semi_minor_desv = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [semi_major_orien]
    data.semi_major_orien = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [calidad]
    data.calidad = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [nro_satelites]
    data.nro_satelites = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 106;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/gps_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e21f09763c07512fc7b4f32331812cbc';
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
    int32               timestamp_sec
    int32               timestamp_nsec
    float64             hora
    float64             utm_este
    float64             utm_norte
    float64             longitud
    float64             latitud
    float64             altura
    float64             hdop
    float64             velocidad
    float64             heading_vel
    float64             semi_major_desv
    float64             semi_minor_desv
    float64             semi_major_orien
    int8                calidad
    int8                nro_satelites
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gps_data(null);
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

    if (msg.hora !== undefined) {
      resolved.hora = msg.hora;
    }
    else {
      resolved.hora = 0.0
    }

    if (msg.utm_este !== undefined) {
      resolved.utm_este = msg.utm_este;
    }
    else {
      resolved.utm_este = 0.0
    }

    if (msg.utm_norte !== undefined) {
      resolved.utm_norte = msg.utm_norte;
    }
    else {
      resolved.utm_norte = 0.0
    }

    if (msg.longitud !== undefined) {
      resolved.longitud = msg.longitud;
    }
    else {
      resolved.longitud = 0.0
    }

    if (msg.latitud !== undefined) {
      resolved.latitud = msg.latitud;
    }
    else {
      resolved.latitud = 0.0
    }

    if (msg.altura !== undefined) {
      resolved.altura = msg.altura;
    }
    else {
      resolved.altura = 0.0
    }

    if (msg.hdop !== undefined) {
      resolved.hdop = msg.hdop;
    }
    else {
      resolved.hdop = 0.0
    }

    if (msg.velocidad !== undefined) {
      resolved.velocidad = msg.velocidad;
    }
    else {
      resolved.velocidad = 0.0
    }

    if (msg.heading_vel !== undefined) {
      resolved.heading_vel = msg.heading_vel;
    }
    else {
      resolved.heading_vel = 0.0
    }

    if (msg.semi_major_desv !== undefined) {
      resolved.semi_major_desv = msg.semi_major_desv;
    }
    else {
      resolved.semi_major_desv = 0.0
    }

    if (msg.semi_minor_desv !== undefined) {
      resolved.semi_minor_desv = msg.semi_minor_desv;
    }
    else {
      resolved.semi_minor_desv = 0.0
    }

    if (msg.semi_major_orien !== undefined) {
      resolved.semi_major_orien = msg.semi_major_orien;
    }
    else {
      resolved.semi_major_orien = 0.0
    }

    if (msg.calidad !== undefined) {
      resolved.calidad = msg.calidad;
    }
    else {
      resolved.calidad = 0
    }

    if (msg.nro_satelites !== undefined) {
      resolved.nro_satelites = msg.nro_satelites;
    }
    else {
      resolved.nro_satelites = 0
    }

    return resolved;
    }
};

module.exports = gps_data;
