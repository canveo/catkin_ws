// Auto-generated. Do not edit!

// (in-package robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ultrasonico {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.metrico = null;
      this.ultrasonico = null;
    }
    else {
      if (initObj.hasOwnProperty('metrico')) {
        this.metrico = initObj.metrico
      }
      else {
        this.metrico = new std_msgs.msg.Bool();
      }
      if (initObj.hasOwnProperty('ultrasonico')) {
        this.ultrasonico = initObj.ultrasonico
      }
      else {
        this.ultrasonico = new sensor_msgs.msg.Range();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ultrasonico
    // Serialize message field [metrico]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.metrico, buffer, bufferOffset);
    // Serialize message field [ultrasonico]
    bufferOffset = sensor_msgs.msg.Range.serialize(obj.ultrasonico, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ultrasonico
    let len;
    let data = new ultrasonico(null);
    // Deserialize message field [metrico]
    data.metrico = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    // Deserialize message field [ultrasonico]
    data.ultrasonico = sensor_msgs.msg.Range.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.Range.getMessageSize(object.ultrasonico);
    return length + 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msgs/ultrasonico';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4d215fc6d958a6fc2548282e53b7769e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Bool metrico
    sensor_msgs/Range ultrasonico
    
    ================================================================================
    MSG: std_msgs/Bool
    bool data
    ================================================================================
    MSG: sensor_msgs/Range
    # Single range reading from an active ranger that emits energy and reports
    # one range reading that is valid along an arc at the distance measured. 
    # This message is  not appropriate for laser scanners. See the LaserScan
    # message if you are working with a laser scanner.
    
    # This message also can represent a fixed-distance (binary) ranger.  This
    # sensor will have min_range===max_range===distance of detection.
    # These sensors follow REP 117 and will output -Inf if the object is detected
    # and +Inf if the object is outside of the detection range.
    
    Header header           # timestamp in the header is the time the ranger
                            # returned the distance reading
    
    # Radiation type enums
    # If you want a value added to this list, send an email to the ros-users list
    uint8 ULTRASOUND=0
    uint8 INFRARED=1
    
    uint8 radiation_type    # the type of radiation used by the sensor
                            # (sound, IR, etc) [enum]
    
    float32 field_of_view   # the size of the arc that the distance reading is
                            # valid for [rad]
                            # the object causing the range reading may have
                            # been anywhere within -field_of_view/2 and
                            # field_of_view/2 at the measured range. 
                            # 0 angle corresponds to the x-axis of the sensor.
    
    float32 min_range       # minimum range value [m]
    float32 max_range       # maximum range value [m]
                            # Fixed distance rangers require min_range==max_range
    
    float32 range           # range data [m]
                            # (Note: values < range_min or > range_max
                            # should be discarded)
                            # Fixed distance rangers only output -Inf or +Inf.
                            # -Inf represents a detection within fixed distance.
                            # (Detection too close to the sensor to quantify)
                            # +Inf represents no detection within the fixed distance.
                            # (Object out of range)
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
    const resolved = new ultrasonico(null);
    if (msg.metrico !== undefined) {
      resolved.metrico = std_msgs.msg.Bool.Resolve(msg.metrico)
    }
    else {
      resolved.metrico = new std_msgs.msg.Bool()
    }

    if (msg.ultrasonico !== undefined) {
      resolved.ultrasonico = sensor_msgs.msg.Range.Resolve(msg.ultrasonico)
    }
    else {
      resolved.ultrasonico = new sensor_msgs.msg.Range()
    }

    return resolved;
    }
};

module.exports = ultrasonico;
