// Auto-generated. Do not edit!

// (in-package deepracer_msgs.msg)


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
    // Deserialize message field [Emergency_stops]
    data.Emergency_stops = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'deepracer_msgs/Control_input';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ee15870a09046e7814ea809ce3c9164e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 Throttle
    float64 angle
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
