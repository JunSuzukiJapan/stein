#|
  This file is a part of stein project.
  Copyright (c) 2015 Jun Suzuki (jun.suzuki.japan@gmail.com)
|#

#|
  Author: Jun Suzuki (jun.suzuki.japan@gmail.com)
|#

(in-package :cl-user)
(defpackage stein-asd
  (:use :cl :asdf))
(in-package :stein-asd)

(defsystem stein
  :version "0.1"
  :author "Jun Suzuki"
  :license "MIT"
  :depends-on (:cl-ppcre)
  :components ((:module "src"
                :components
		((:file "util")
		 (:file "git")
		 (:file "quickload")
		 (:file "stein"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op stein-test))))
