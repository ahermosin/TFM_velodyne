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

class imu_all {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Timestamp_sec = null;
      this.Timestamp_nsec = null;
      this.Roll = null;
      this.Pitch = null;
      this.Yaw = null;
      this.Wx = null;
      this.Wy = null;
      this.Wz = null;
      this.AcelX = null;
      this.AcelY = null;
      this.AcelZ = null;
      this.VelN = null;
      this.VelE = null;
      this.VelZ = null;
      this.GPSLong = null;
      this.GPSLat = null;
      this.GPSAlt = null;
      this.Temp = null;
      this.IMUTime = null;
      this.BITStatus = null;
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
      if (initObj.hasOwnProperty('Roll')) {
        this.Roll = initObj.Roll
      }
      else {
        this.Roll = 0.0;
      }
      if (initObj.hasOwnProperty('Pitch')) {
        this.Pitch = initObj.Pitch
      }
      else {
        this.Pitch = 0.0;
      }
      if (initObj.hasOwnProperty('Yaw')) {
        this.Yaw = initObj.Yaw
      }
      else {
        this.Yaw = 0.0;
      }
      if (initObj.hasOwnProperty('Wx')) {
        this.Wx = initObj.Wx
      }
      else {
        this.Wx = 0.0;
      }
      if (initObj.hasOwnProperty('Wy')) {
        this.Wy = initObj.Wy
      }
      else {
        this.Wy = 0.0;
      }
      if (initObj.hasOwnProperty('Wz')) {
        this.Wz = initObj.Wz
      }
      else {
        this.Wz = 0.0;
      }
      if (initObj.hasOwnProperty('AcelX')) {
        this.AcelX = initObj.AcelX
      }
      else {
        this.AcelX = 0.0;
      }
      if (initObj.hasOwnProperty('AcelY')) {
        this.AcelY = initObj.AcelY
      }
      else {
        this.AcelY = 0.0;
      }
      if (initObj.hasOwnProperty('AcelZ')) {
        this.AcelZ = initObj.AcelZ
      }
      else {
        this.AcelZ = 0.0;
      }
      if (initObj.hasOwnProperty('VelN')) {
        this.VelN = initObj.VelN
      }
      else {
        this.VelN = 0.0;
      }
      if (initObj.hasOwnProperty('VelE')) {
        this.VelE = initObj.VelE
      }
      else {
        this.VelE = 0.0;
      }
      if (initObj.hasOwnProperty('VelZ')) {
        this.VelZ = initObj.VelZ
      }
      else {
        this.VelZ = 0.0;
      }
      if (initObj.hasOwnProperty('GPSLong')) {
        this.GPSLong = initObj.GPSLong
      }
      else {
        this.GPSLong = 0.0;
      }
      if (initObj.hasOwnProperty('GPSLat')) {
        this.GPSLat = initObj.GPSLat
      }
      else {
        this.GPSLat = 0.0;
      }
      if (initObj.hasOwnProperty('GPSAlt')) {
        this.GPSAlt = initObj.GPSAlt
      }
      else {
        this.GPSAlt = 0.0;
      }
      if (initObj.hasOwnProperty('Temp')) {
        this.Temp = initObj.Temp
      }
      else {
        this.Temp = 0.0;
      }
      if (initObj.hasOwnProperty('IMUTime')) {
        this.IMUTime = initObj.IMUTime
      }
      else {
        this.IMUTime = 0;
      }
      if (initObj.hasOwnProperty('BITStatus')) {
        this.BITStatus = initObj.BITStatus
      }
      else {
        this.BITStatus = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type imu_all
    // Serialize message field [Timestamp_sec]
    bufferOffset = _serializer.int32(obj.Timestamp_sec, buffer, bufferOffset);
    // Serialize message field [Timestamp_nsec]
    bufferOffset = _serializer.int32(obj.Timestamp_nsec, buffer, bufferOffset);
    // Serialize message field [Roll]
    bufferOffset = _serializer.float64(obj.Roll, buffer, bufferOffset);
    // Serialize message field [Pitch]
    bufferOffset = _serializer.float64(obj.Pitch, buffer, bufferOffset);
    // Serialize message field [Yaw]
    bufferOffset = _serializer.float64(obj.Yaw, buffer, bufferOffset);
    // Serialize message field [Wx]
    bufferOffset = _serializer.float64(obj.Wx, buffer, bufferOffset);
    // Serialize message field [Wy]
    bufferOffset = _serializer.float64(obj.Wy, buffer, bufferOffset);
    // Serialize message field [Wz]
    bufferOffset = _serializer.float64(obj.Wz, buffer, bufferOffset);
    // Serialize message field [AcelX]
    bufferOffset = _serializer.float64(obj.AcelX, buffer, bufferOffset);
    // Serialize message field [AcelY]
    bufferOffset = _serializer.float64(obj.AcelY, buffer, bufferOffset);
    // Serialize message field [AcelZ]
    bufferOffset = _serializer.float64(obj.AcelZ, buffer, bufferOffset);
    // Serialize message field [VelN]
    bufferOffset = _serializer.float64(obj.VelN, buffer, bufferOffset);
    // Serialize message field [VelE]
    bufferOffset = _serializer.float64(obj.VelE, buffer, bufferOffset);
    // Serialize message field [VelZ]
    bufferOffset = _serializer.float64(obj.VelZ, buffer, bufferOffset);
    // Serialize message field [GPSLong]
    bufferOffset = _serializer.float64(obj.GPSLong, buffer, bufferOffset);
    // Serialize message field [GPSLat]
    bufferOffset = _serializer.float64(obj.GPSLat, buffer, bufferOffset);
    // Serialize message field [GPSAlt]
    bufferOffset = _serializer.float64(obj.GPSAlt, buffer, bufferOffset);
    // Serialize message field [Temp]
    bufferOffset = _serializer.float64(obj.Temp, buffer, bufferOffset);
    // Serialize message field [IMUTime]
    bufferOffset = _serializer.int32(obj.IMUTime, buffer, bufferOffset);
    // Serialize message field [BITStatus]
    bufferOffset = _serializer.int16(obj.BITStatus, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type imu_all
    let len;
    let data = new imu_all(null);
    // Deserialize message field [Timestamp_sec]
    data.Timestamp_sec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Timestamp_nsec]
    data.Timestamp_nsec = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Roll]
    data.Roll = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Pitch]
    data.Pitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Yaw]
    data.Yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Wx]
    data.Wx = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Wy]
    data.Wy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Wz]
    data.Wz = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AcelX]
    data.AcelX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AcelY]
    data.AcelY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AcelZ]
    data.AcelZ = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [VelN]
    data.VelN = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [VelE]
    data.VelE = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [VelZ]
    data.VelZ = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [GPSLong]
    data.GPSLong = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [GPSLat]
    data.GPSLat = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [GPSAlt]
    data.GPSAlt = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Temp]
    data.Temp = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [IMUTime]
    data.IMUTime = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [BITStatus]
    data.BITStatus = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 142;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lcm_to_ros/imu_all';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ec9945e7705b83f3d7cbfa676d070663';
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
    float64             Roll
    float64             Pitch
    float64             Yaw
    float64             Wx
    float64             Wy
    float64             Wz
    float64             AcelX
    float64             AcelY
    float64             AcelZ
    float64             VelN
    float64             VelE
    float64             VelZ
    float64             GPSLong
    float64             GPSLat
    float64             GPSAlt
    float64             Temp
    int32               IMUTime
    int16               BITStatus
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new imu_all(null);
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

    if (msg.Roll !== undefined) {
      resolved.Roll = msg.Roll;
    }
    else {
      resolved.Roll = 0.0
    }

    if (msg.Pitch !== undefined) {
      resolved.Pitch = msg.Pitch;
    }
    else {
      resolved.Pitch = 0.0
    }

    if (msg.Yaw !== undefined) {
      resolved.Yaw = msg.Yaw;
    }
    else {
      resolved.Yaw = 0.0
    }

    if (msg.Wx !== undefined) {
      resolved.Wx = msg.Wx;
    }
    else {
      resolved.Wx = 0.0
    }

    if (msg.Wy !== undefined) {
      resolved.Wy = msg.Wy;
    }
    else {
      resolved.Wy = 0.0
    }

    if (msg.Wz !== undefined) {
      resolved.Wz = msg.Wz;
    }
    else {
      resolved.Wz = 0.0
    }

    if (msg.AcelX !== undefined) {
      resolved.AcelX = msg.AcelX;
    }
    else {
      resolved.AcelX = 0.0
    }

    if (msg.AcelY !== undefined) {
      resolved.AcelY = msg.AcelY;
    }
    else {
      resolved.AcelY = 0.0
    }

    if (msg.AcelZ !== undefined) {
      resolved.AcelZ = msg.AcelZ;
    }
    else {
      resolved.AcelZ = 0.0
    }

    if (msg.VelN !== undefined) {
      resolved.VelN = msg.VelN;
    }
    else {
      resolved.VelN = 0.0
    }

    if (msg.VelE !== undefined) {
      resolved.VelE = msg.VelE;
    }
    else {
      resolved.VelE = 0.0
    }

    if (msg.VelZ !== undefined) {
      resolved.VelZ = msg.VelZ;
    }
    else {
      resolved.VelZ = 0.0
    }

    if (msg.GPSLong !== undefined) {
      resolved.GPSLong = msg.GPSLong;
    }
    else {
      resolved.GPSLong = 0.0
    }

    if (msg.GPSLat !== undefined) {
      resolved.GPSLat = msg.GPSLat;
    }
    else {
      resolved.GPSLat = 0.0
    }

    if (msg.GPSAlt !== undefined) {
      resolved.GPSAlt = msg.GPSAlt;
    }
    else {
      resolved.GPSAlt = 0.0
    }

    if (msg.Temp !== undefined) {
      resolved.Temp = msg.Temp;
    }
    else {
      resolved.Temp = 0.0
    }

    if (msg.IMUTime !== undefined) {
      resolved.IMUTime = msg.IMUTime;
    }
    else {
      resolved.IMUTime = 0
    }

    if (msg.BITStatus !== undefined) {
      resolved.BITStatus = msg.BITStatus;
    }
    else {
      resolved.BITStatus = 0
    }

    return resolved;
    }
};

module.exports = imu_all;
