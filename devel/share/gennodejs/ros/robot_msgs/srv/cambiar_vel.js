// Auto-generated. Do not edit!

// (in-package robot_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class cambiar_velRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.velocidad = null;
    }
    else {
      if (initObj.hasOwnProperty('velocidad')) {
        this.velocidad = initObj.velocidad
      }
      else {
        this.velocidad = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cambiar_velRequest
    // Serialize message field [velocidad]
    bufferOffset = _serializer.float32(obj.velocidad, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cambiar_velRequest
    let len;
    let data = new cambiar_velRequest(null);
    // Deserialize message field [velocidad]
    data.velocidad = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msgs/cambiar_velRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '038d1d82280753495fded4897c712e65';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 velocidad
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new cambiar_velRequest(null);
    if (msg.velocidad !== undefined) {
      resolved.velocidad = msg.velocidad;
    }
    else {
      resolved.velocidad = 0.0
    }

    return resolved;
    }
};

class cambiar_velResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Mensaje = null;
    }
    else {
      if (initObj.hasOwnProperty('Mensaje')) {
        this.Mensaje = initObj.Mensaje
      }
      else {
        this.Mensaje = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cambiar_velResponse
    // Serialize message field [Mensaje]
    bufferOffset = _serializer.string(obj.Mensaje, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cambiar_velResponse
    let len;
    let data = new cambiar_velResponse(null);
    // Deserialize message field [Mensaje]
    data.Mensaje = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.Mensaje);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msgs/cambiar_velResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e238a58a5f2dd3b7d0de288ab5ff05c0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string Mensaje
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new cambiar_velResponse(null);
    if (msg.Mensaje !== undefined) {
      resolved.Mensaje = msg.Mensaje;
    }
    else {
      resolved.Mensaje = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: cambiar_velRequest,
  Response: cambiar_velResponse,
  md5sum() { return '8741f5a26630d67b17b5a382a1c74988'; },
  datatype() { return 'robot_msgs/cambiar_vel'; }
};
