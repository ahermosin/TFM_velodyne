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

class mobileye_obstaculo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp_sec = null;
      this.timestamp_nsec = null;
      this.posicionX = null;
      this.posicionY = null;
      this.velocidadRel = null;
      this.aceleracionX = null;
      this.longitud = null;
      this.ancho = null;
      this.angulo = null;
      this.angleRate = null;
      this.scaleChange = null;
      this.edad = null;
      this.id = null;
      this.tipo = null;
      this.status = null;
      this.carril = null;
      this.flags = null;
      this.intermitentes = null;
      this.cutInOut = null;
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
      if (initObj.hasOwnProperty('posicionX')) {
        this.posicionX = initObj.posicionX
      }
      else {
        this.posicionX = 0.0;
      }
      if (initObj.hasOwnProperty('posicionY')) {
        this.posicionY = initObj.posicionY
      }
      else {
        this.posicionY = 0.0;
      }
      if (initObj.hasOwnProperty('velocidadRel')) {
        this.velocidadRel = initObj.velocidadRel
      }
      else {
        this.velocidadRel = 0.0;
      }
      if (initObj.hasOwnProperty('aceleracionX')) {
        this.aceleracionX = initObj.aceleracionX
      }
      else {
        this.aceleracionX = 0.0;
      }
      if (initObj.hasOwnProperty('longitud')) {
        this.longitud = initObj.longitud
      }
      else {
        this.longitud = 0.0;
      }
      if (initObj.hasOwnProperty('ancho')) {
        this.ancho = initObj.ancho
      }
      else {
        this.ancho = 0.0;
      }
      if (initObj.hasOwnProperty('angulo')) {
        this.angulo = initObj.angulo
      }
      else {
        this.angulo = 0.0;
      }
      if (initObj.hasOwnProperty('angleRate')) {
        this.angleRate = initObj.angleRate
      }
      else {
        this.angleRate = 0.0;
      }
      if (initObj.hasOwnProperty('scaleChange')) {
        this.scaleChange = initObj.scaleChange
      }
      else {
        this.scaleChange = 0.0;
      }
      if (initObj.hasOwnProperty('edad')) {
        this.edad = initObj.edad
      }
      else {
        this.edad = 0;
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('tipo')) {
        this.tipo = initObj.tipo
      }
      else {
        this.tipo = 0;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
      if (initObj.hasOwnProperty('carril')) {
        this.carril = initObj.carril
      }
      else {
        this.carril = 0;
      }
      if (initObj.hasOwnProperty('flags')) {
        this.flags = initObj.flags
      }
      else {
        this.flags = 0;
      }
      if (initObj.hasOwnProperty('intermitentes')) {
        this.intermitentes = initObj.intermitentes
      }
      else {
        this.intermitentes = 0;
      }
      if (initObj.hasOwnProperty('cutInOut')) {
        this.cutInOut = initObj.cutInOut
      }
      else {
        this.cutInOut = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mobileye_obstaculo
    // Serialize message field [timestamp_sec]
    bufferOffset = _serializer.int32(obj.timestamp_sec, buffer, bufferOffset);
    // Serialize message field [timestamp_nsec]
    bufferOffset = _serializer.int32(obj.timestamp_nsec, buffer, bufferOffset);
    // Serialize message field [posicionX]
    bufferOffset = _serializer.float32(obj.posicionX, buffer, bufferOffset);
    // Serialize message field [posicionY]
    bufferOffset = _serializer.float32(obj.posicionY, buffer, bufferOffset);
    // Serialize message field [velocidadRel]
    bufferOffset = _serializer.float32(obj.velocidadRel, buffer, bufferOffset);
    // Serialize message field [aceleracionX]
    bufferOffset = _serializer.float32(obj.aceleracionX, buffer, bufferOffset);
    // Serialize message field [longitud]
    bufferOffset = _serializer.float32(obj.longitud, buffer, bufferOffset);
    // Serialize message field [ancho]
    bufferOffset = _serializer.float32(obj.ancho, buffer, bufferOffset);
    // Serialize message field [angulo]
    bufferOffset = _serializer.float32(obj.angulo, buffer, bufferOffset);
    // Serialize message field [angleRate]
    bufferOffset = _serializer.float32(obj.angleRate, buffer, bufferOffset);
    // Serialize message field [scaleChange]
    bufferOffset = _serializer.float32(obj.scaleChange, buffer, bufferOffset);
    // Serialize message field [edad]
    bufferOffset = _serializer.int16(obj.edad, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.byte(obj.id, buffer, bufferOffset);
    // Serialize message field [tipo]
    bufferOffset = _serializer.byte(obj.tipo, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.byte(obj.status, buffer, bufferOffset);
    // Serialize message field [carril]
    bufferOffset = _serializer.byte(obj.carril, buffer, bufferOffset);
    // Serialize message field [flags]
    bufferOffset = _serializer.byte(obj.flags, buffer, bufferOffset);
    // Serialize message field [intermitentes]
    bufferOffset = _serializer.byte(obj.intermitentes, buffer, bufferOffset);
    // Serialize message field [cutInOut]
    bufferOffset = _serializer.byte(obj.cutInOut, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mobileye_obstaculo
    let len;
    let data = new mobileye_obstaculo(null);
    // Deserialize message field [timestamp_sec]
    data.timestamp_sec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [timestamp_nsec]
    data.timestamp_nsec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [posicionX]
    data.posicionX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [posicionY]
    data.posicionY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocidadRel]
    data.velocidadRel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [aceleracionX]
    data.aceleracionX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [longitud]
    data.longitud = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ancho]
    data.ancho = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angulo]
    data.angulo = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angleRate]
    data.angleRate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [scaleChange]
    data.scaleChange = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [edad]
    data.edad = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [tipo]
    data.tipo = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [carril]
    data.carril = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [flags]
    data.flags = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [intermitentes]
    data.intermitentes = _deserializer.byte(buffer, bufferOffset);
    // Deserialize message field [cutInOut]
    data.cutInOut = _deserializer.byte(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 53;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/mobileye_obstaculo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '089b186e41a459d4bb6e84f175bf79ab';
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
    float32             posicionX
    float32             posicionY
    float32             velocidadRel
    float32             aceleracionX
    float32             longitud
    float32             ancho
    float32             angulo
    float32             angleRate
    float32             scaleChange
    int16               edad
    byte                id
    byte                tipo
    byte                status
    byte                carril
    byte                flags
    byte                intermitentes
    byte                cutInOut
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mobileye_obstaculo(null);
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

    if (msg.posicionX !== undefined) {
      resolved.posicionX = msg.posicionX;
    }
    else {
      resolved.posicionX = 0.0
    }

    if (msg.posicionY !== undefined) {
      resolved.posicionY = msg.posicionY;
    }
    else {
      resolved.posicionY = 0.0
    }

    if (msg.velocidadRel !== undefined) {
      resolved.velocidadRel = msg.velocidadRel;
    }
    else {
      resolved.velocidadRel = 0.0
    }

    if (msg.aceleracionX !== undefined) {
      resolved.aceleracionX = msg.aceleracionX;
    }
    else {
      resolved.aceleracionX = 0.0
    }

    if (msg.longitud !== undefined) {
      resolved.longitud = msg.longitud;
    }
    else {
      resolved.longitud = 0.0
    }

    if (msg.ancho !== undefined) {
      resolved.ancho = msg.ancho;
    }
    else {
      resolved.ancho = 0.0
    }

    if (msg.angulo !== undefined) {
      resolved.angulo = msg.angulo;
    }
    else {
      resolved.angulo = 0.0
    }

    if (msg.angleRate !== undefined) {
      resolved.angleRate = msg.angleRate;
    }
    else {
      resolved.angleRate = 0.0
    }

    if (msg.scaleChange !== undefined) {
      resolved.scaleChange = msg.scaleChange;
    }
    else {
      resolved.scaleChange = 0.0
    }

    if (msg.edad !== undefined) {
      resolved.edad = msg.edad;
    }
    else {
      resolved.edad = 0
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.tipo !== undefined) {
      resolved.tipo = msg.tipo;
    }
    else {
      resolved.tipo = 0
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    if (msg.carril !== undefined) {
      resolved.carril = msg.carril;
    }
    else {
      resolved.carril = 0
    }

    if (msg.flags !== undefined) {
      resolved.flags = msg.flags;
    }
    else {
      resolved.flags = 0
    }

    if (msg.intermitentes !== undefined) {
      resolved.intermitentes = msg.intermitentes;
    }
    else {
      resolved.intermitentes = 0
    }

    if (msg.cutInOut !== undefined) {
      resolved.cutInOut = msg.cutInOut;
    }
    else {
      resolved.cutInOut = 0
    }

    return resolved;
    }
};

module.exports = mobileye_obstaculo;
