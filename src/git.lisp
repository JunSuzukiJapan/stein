(in-package :cl-user)
(defpackage stein.git
  (:use :cl)
  (:export :init
           :clone))
(in-package :stein.git)

(defun init ()
  (stein.util:run-command "git" "init"))

(defun clone (uri)
  (stein.util:run-command "git" "clone" uri))
