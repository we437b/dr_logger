; Auto-generated. Do not edit!


(cl:in-package deepracer_simulation-msg)


;//! \htmlinclude Control_input.msg.html

(cl:defclass <Control_input> (roslisp-msg-protocol:ros-message)
  ((Throttle
    :reader Throttle
    :initarg :Throttle
    :type cl:float
    :initform 0.0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (d_Throttle
    :reader d_Throttle
    :initarg :d_Throttle
    :type cl:float
    :initform 0.0)
   (d_angle
    :reader d_angle
    :initarg :d_angle
    :type cl:float
    :initform 0.0)
   (Emergency_stops
    :reader Emergency_stops
    :initarg :Emergency_stops
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Control_input (<Control_input>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Control_input>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Control_input)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepracer_simulation-msg:<Control_input> is deprecated: use deepracer_simulation-msg:Control_input instead.")))

(cl:ensure-generic-function 'Throttle-val :lambda-list '(m))
(cl:defmethod Throttle-val ((m <Control_input>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepracer_simulation-msg:Throttle-val is deprecated.  Use deepracer_simulation-msg:Throttle instead.")
  (Throttle m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <Control_input>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepracer_simulation-msg:angle-val is deprecated.  Use deepracer_simulation-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'd_Throttle-val :lambda-list '(m))
(cl:defmethod d_Throttle-val ((m <Control_input>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepracer_simulation-msg:d_Throttle-val is deprecated.  Use deepracer_simulation-msg:d_Throttle instead.")
  (d_Throttle m))

(cl:ensure-generic-function 'd_angle-val :lambda-list '(m))
(cl:defmethod d_angle-val ((m <Control_input>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepracer_simulation-msg:d_angle-val is deprecated.  Use deepracer_simulation-msg:d_angle instead.")
  (d_angle m))

(cl:ensure-generic-function 'Emergency_stops-val :lambda-list '(m))
(cl:defmethod Emergency_stops-val ((m <Control_input>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepracer_simulation-msg:Emergency_stops-val is deprecated.  Use deepracer_simulation-msg:Emergency_stops instead.")
  (Emergency_stops m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Control_input>) ostream)
  "Serializes a message object of type '<Control_input>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Throttle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'd_Throttle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'd_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'Emergency_stops)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Control_input>) istream)
  "Deserializes a message object of type '<Control_input>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Throttle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'd_Throttle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'd_angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Emergency_stops) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Control_input>)))
  "Returns string type for a message object of type '<Control_input>"
  "deepracer_simulation/Control_input")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Control_input)))
  "Returns string type for a message object of type 'Control_input"
  "deepracer_simulation/Control_input")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Control_input>)))
  "Returns md5sum for a message object of type '<Control_input>"
  "81fc38c03cf9764479d0944954e41f30")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Control_input)))
  "Returns md5sum for a message object of type 'Control_input"
  "81fc38c03cf9764479d0944954e41f30")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Control_input>)))
  "Returns full string definition for message of type '<Control_input>"
  (cl:format cl:nil "~%float64 Throttle~%float64 angle~%float64 d_Throttle~%float64 d_angle~%int8 Emergency_stops~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Control_input)))
  "Returns full string definition for message of type 'Control_input"
  (cl:format cl:nil "~%float64 Throttle~%float64 angle~%float64 d_Throttle~%float64 d_angle~%int8 Emergency_stops~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Control_input>))
  (cl:+ 0
     8
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Control_input>))
  "Converts a ROS message object to a list"
  (cl:list 'Control_input
    (cl:cons ':Throttle (Throttle msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':d_Throttle (d_Throttle msg))
    (cl:cons ':d_angle (d_angle msg))
    (cl:cons ':Emergency_stops (Emergency_stops msg))
))
