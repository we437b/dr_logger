;; Auto-generated. Do not edit!


(when (boundp 'deepracer_msgs::Control_input)
  (if (not (find-package "DEEPRACER_MSGS"))
    (make-package "DEEPRACER_MSGS"))
  (shadow 'Control_input (find-package "DEEPRACER_MSGS")))
(unless (find-package "DEEPRACER_MSGS::CONTROL_INPUT")
  (make-package "DEEPRACER_MSGS::CONTROL_INPUT"))

(in-package "ROS")
;;//! \htmlinclude Control_input.msg.html


(defclass deepracer_msgs::Control_input
  :super ros::object
  :slots (_Throttle _angle _Emergency_stops ))

(defmethod deepracer_msgs::Control_input
  (:init
   (&key
    ((:Throttle __Throttle) 0.0)
    ((:angle __angle) 0.0)
    ((:Emergency_stops __Emergency_stops) 0)
    )
   (send-super :init)
   (setq _Throttle (float __Throttle))
   (setq _angle (float __angle))
   (setq _Emergency_stops (round __Emergency_stops))
   self)
  (:Throttle
   (&optional __Throttle)
   (if __Throttle (setq _Throttle __Throttle)) _Throttle)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:Emergency_stops
   (&optional __Emergency_stops)
   (if __Emergency_stops (setq _Emergency_stops __Emergency_stops)) _Emergency_stops)
  (:serialization-length
   ()
   (+
    ;; float64 _Throttle
    8
    ;; float64 _angle
    8
    ;; int8 _Emergency_stops
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _Throttle
       (sys::poke _Throttle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _Emergency_stops
       (write-byte _Emergency_stops s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _Throttle
     (setq _Throttle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _Emergency_stops
     (setq _Emergency_stops (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _Emergency_stops 127) (setq _Emergency_stops (- _Emergency_stops 256)))
   ;;
   self)
  )

(setf (get deepracer_msgs::Control_input :md5sum-) "ee15870a09046e7814ea809ce3c9164e")
(setf (get deepracer_msgs::Control_input :datatype-) "deepracer_msgs/Control_input")
(setf (get deepracer_msgs::Control_input :definition-)
      "float64 Throttle
float64 angle
int8 Emergency_stops

")



(provide :deepracer_msgs/Control_input "ee15870a09046e7814ea809ce3c9164e")


