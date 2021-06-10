;; Auto-generated. Do not edit!


(when (boundp 'deepracer_msgs::Progress)
  (if (not (find-package "DEEPRACER_MSGS"))
    (make-package "DEEPRACER_MSGS"))
  (shadow 'Progress (find-package "DEEPRACER_MSGS")))
(unless (find-package "DEEPRACER_MSGS::PROGRESS")
  (make-package "DEEPRACER_MSGS::PROGRESS"))

(in-package "ROS")
;;//! \htmlinclude Progress.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass deepracer_msgs::Progress
  :super ros::object
  :slots (_header _off_track _progress _yaw _x _y _z _distance_from_border_1 _distance_from_border_2 _distance_from_center ))

(defmethod deepracer_msgs::Progress
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:off_track __off_track) 0)
    ((:progress __progress) 0.0)
    ((:yaw __yaw) 0.0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:distance_from_border_1 __distance_from_border_1) 0.0)
    ((:distance_from_border_2 __distance_from_border_2) 0.0)
    ((:distance_from_center __distance_from_center) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _off_track (round __off_track))
   (setq _progress (float __progress))
   (setq _yaw (float __yaw))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _distance_from_border_1 (float __distance_from_border_1))
   (setq _distance_from_border_2 (float __distance_from_border_2))
   (setq _distance_from_center (float __distance_from_center))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:off_track
   (&optional __off_track)
   (if __off_track (setq _off_track __off_track)) _off_track)
  (:progress
   (&optional __progress)
   (if __progress (setq _progress __progress)) _progress)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:distance_from_border_1
   (&optional __distance_from_border_1)
   (if __distance_from_border_1 (setq _distance_from_border_1 __distance_from_border_1)) _distance_from_border_1)
  (:distance_from_border_2
   (&optional __distance_from_border_2)
   (if __distance_from_border_2 (setq _distance_from_border_2 __distance_from_border_2)) _distance_from_border_2)
  (:distance_from_center
   (&optional __distance_from_center)
   (if __distance_from_center (setq _distance_from_center __distance_from_center)) _distance_from_center)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _off_track
    1
    ;; float64 _progress
    8
    ;; float64 _yaw
    8
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _distance_from_border_1
    8
    ;; float64 _distance_from_border_2
    8
    ;; float64 _distance_from_center
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _off_track
       (write-byte _off_track s)
     ;; float64 _progress
       (sys::poke _progress (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_from_border_1
       (sys::poke _distance_from_border_1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_from_border_2
       (sys::poke _distance_from_border_2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_from_center
       (sys::poke _distance_from_center (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _off_track
     (setq _off_track (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _off_track 127) (setq _off_track (- _off_track 256)))
   ;; float64 _progress
     (setq _progress (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_from_border_1
     (setq _distance_from_border_1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_from_border_2
     (setq _distance_from_border_2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_from_center
     (setq _distance_from_center (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get deepracer_msgs::Progress :md5sum-) "e96c60678c296b3091cb64154018f379")
(setf (get deepracer_msgs::Progress :datatype-) "deepracer_msgs/Progress")
(setf (get deepracer_msgs::Progress :definition-)
      "Header header
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

")



(provide :deepracer_msgs/Progress "e96c60678c296b3091cb64154018f379")


