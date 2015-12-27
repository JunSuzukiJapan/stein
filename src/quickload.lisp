(in-package :cl-user)
(defpackage stein.quickload
  (:use :cl)
  (:export :quickload))
(in-package :stein.quickload)

(defmethod quickload ((str string))
  (format t "not implemented yet."))


