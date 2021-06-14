
(cl:in-package :asdf)

(defsystem "deepracer_simulation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Control_input" :depends-on ("_package_Control_input"))
    (:file "_package_Control_input" :depends-on ("_package"))
  ))