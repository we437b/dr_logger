// Auto-generated. Do not edit!

// (in-package deepracer_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Progress {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.off_track = null;
      this.progress = null;
      this.yaw = null;
      this.x = null;
      this.y = null;
      this.z = null;
      this.distance_from_border_1 = null;
      this.distance_from_border_2 = null;
      this.distance_from_center = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('off_track')) {
        this.off_track = initObj.off_track
      }
      else {
        this.off_track = 0;
      }
      if (initObj.hasOwnProperty('progress')) {
        this.progress = initObj.progress
      }
      else {
        this.progress = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
      if (initObj.hasOwnProperty('distance_from_border_1')) {
        this.distance_from_border_1 = initObj.distance_from_border_1
      }
      else {
        this.distance_from_border_1 = 0.0;
      }
      if (initObj.hasOwnProperty('distance_from_border_2')) {
        this.distance_from_border_2 = initObj.distance_from_border_2
      }
      else {
        this.distance_from_border_2 = 0.0;
      }
      if (initObj.hasOwnProperty('distance_from_center')) {
        this.distance_from_center = initObj.distance_from_center
      }
      else {
        this.distance_from_center = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Progress
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [off_track]
    bufferOffset = _serializer.int8(obj.off_track, buffer, bufferOffset);
    // Serialize message field [progress]
    bufferOffset = _serializer.float64(obj.progress, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float64(obj.yaw, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float64(obj.z, buffer, bufferOffset);
    // Serialize message field [distance_from_border_1]
    bufferOffset = _serializer.float64(obj.distance_from_border_1, buffer, bufferOffset);
    // Serialize message field [distance_from_border_2]
    bufferOffset = _serializer.float64(obj.distance_from_border_2, buffer, bufferOffset);
    // Serialize message field [distance_from_center]
    bufferOffset = _serializer.float64(obj.distance_from_center, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Progress
    let len;
    let data = new Progress(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [off_track]
    data.off_track = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [progress]
    data.progress = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_from_border_1]
    data.distance_from_border_1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_from_border_2]
    data.distance_from_border_2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_from_center]
    data.distance_from_center = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 65;
  }

  static datatype() {
    // Returns string type for a message object
    return 'deepracer_msgs/Progress';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e96c60678c296b3091cb64154018f379';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int8 off_track
    float64 progress
    float64 yaw
    float64 x
    float64 y
    float64 z
    float64 distance_from_border_1
    float64 distance_from_border_2
    float64 distance_from_center
    
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Progress(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.off_track !== undefined) {
      resolved.off_track = msg.off_track;
    }
    else {
      resolved.off_track = 0
    }

    if (msg.progress !== undefined) {
      resolved.progress = msg.progress;
    }
    else {
      resolved.progress = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    if (msg.distance_from_border_1 !== undefined) {
      resolved.distance_from_border_1 = msg.distance_from_border_1;
    }
    else {
      resolved.distance_from_border_1 = 0.0
    }

    if (msg.distance_from_border_2 !== undefined) {
      resolved.distance_from_border_2 = msg.distance_from_border_2;
    }
    else {
      resolved.distance_from_border_2 = 0.0
    }

    if (msg.distance_from_center !== undefined) {
      resolved.distance_from_center = msg.distance_from_center;
    }
    else {
      resolved.distance_from_center = 0.0
    }

    return resolved;
    }
};

module.exports = Progress;
