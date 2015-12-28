(in-package :cl-user)
(defpackage stein
  (:nicknames :git :stn)
  (:use :cl)
  (:import-from :stein.util
                :run-command
		:cd
		:current-directory)
  (:import-from :stein.git
                :init
                :clone)
  (:import-from :stein.quickload
                :quickload
		:reload)
  (:export :init
           :clone
           :run-command
	   :cd
	   :current-directory
           :quickload
	   :reload))
(in-package :stein)
