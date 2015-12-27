(in-package :cl-user)
(defpackage stein
  (:nicknames :git :stn)
  (:use :cl)
  (:import-from :stein.util
                :run-command)
  (:import-from :stein.git
                :init
                :clone)
  (:import-from :stein.quickload
                :quickload)
  (:export :init
           :clone
           :run-command
           :quickload))
(in-package :stein)
