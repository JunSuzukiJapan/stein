(in-package :cl-user)
(defpackage stein.git
  (:use :cl)
;  (:import-from :stein.util
;               :run-command)
  (:export :init
           :clone))
(in-package :stein.git)

(defun init ()
  (stein.util:run-command "git" "init"))

(defun clone (uri)
  (stein.util:run-command "git" "clone" uri))