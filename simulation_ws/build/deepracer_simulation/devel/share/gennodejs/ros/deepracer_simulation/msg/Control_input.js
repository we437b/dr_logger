// Auto-generated. Do not edit!

// (in-package deepracer_simulation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Control_input {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Throttle = null;
      this.angle = null;
      this.d_Throttle = null;
      this.d_angle = null;
      this.Emergency_stops = null;
    }
    else {
      if (initObj.hasOwnProperty('Throttle')) {
        this.Throttle = initObj.Throttle
      }
      else {
        this.Throttle = 0.0;
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
      if (initObj.hasOwnProperty('d_Throttle')) {
        this.d_Throttle = initObj.d_Throttle
      }
      else {
        this.d_Throttle = 0.0;
      }
      if (initObj.hasOwnProperty('d_angle')) {
        this.d_angle = initObj.d_angle
      }
      else {
        this.d_angle = 0.0;
      }
      if (initObj.hasOwnProperty('Emergency_stops')) {
        this.Emergency_stops = initObj.Emergency_stops
      }
      else {
        this.Emergency_stops = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Control_input
    // Serialize message field [Throttle]
    bufferOffset = _serializer.float64(obj.Throttle, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float64(obj.angle, buffer, bufferOffset);
    // Serialize message field [d_Throttle]
    bufferOffset = _serializer.float64(obj.d_Throttle, buffer, bufferOffset);
    // Serialize message field [d_angle]
    bufferOffset = _serializer.float64(obj.d_angle, buffer, bufferOffset);
    // Serialize message field [Emergency_stops]
    bufferOffset = _serializer.int8(obj.Emergency_stops, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Control_input
    let len;
    let data = new Control_input(null);
    // Deserialize message field [Throttle]
    data.Throttle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [d_Throttle]
    data.d_Throttle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [d_angle]
    data.d_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Emergency_stops]
    data.Emergency_stops = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'deepracer_simulation/Control_input';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '81fc38c03cf9764479d0944954e41f30';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    float64 Throttle
    float64 angle
    float64 d_Throttle
    float64 d_angle
    int8 Emergency_stops
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Control_input(null);
    if (msg.Throttle !== undefined) {
      resolved.Throttle = msg.Throttle;
    }
    else {
      resolved.Throttle = 0.0
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    if (msg.d_Throttle !== undefined) {
      resolved.d_Throttle = msg.d_Throttle;
    }
    else {
      resolved.d_Throttle = 0.0
    }

    if (msg.d_angle !== undefined) {
      resolved.d_angle = msg.d_angle;
    }
    else {
      resolved.d_angle = 0.0
    }

    if (msg.Emergency_stops !== undefined) {
      resolved.Emergency_stops = msg.Emergency_stops;
    }
    else {
      resolved.Emergency_stops = 0
    }

    return resolved;
    }
};

module.exports = Control_input;
