#|
  This file is a part of stein project.
  Copyright (c) 2015 Jun Suzuki (jun.suzuki.japan@gmail.com)
|#

(in-package :cl-user)
(defpackage stein-test-asd
  (:use :cl :asdf))
(in-package :stein-test-asd)

(defsystem stein-test
  :author "Jun Suzuki"
  :license ""
  :depends-on (:stein
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "stein"))))

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
