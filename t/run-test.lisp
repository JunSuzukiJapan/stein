#!/usr/bin/sbcl --script

(load "quicklisp.lisp")
(quicklisp-quickstart:install)
;(handler-case
;    (quicklisp-quickstart:install)
;  (condition (e)
;    (format t "error while installing quicklisp. ~a~%" e)))

(ql:quickload :prove)

(if (prove:run :stein-test)
    (sb-ext:quit :unix-status 0)
    (sb-ext:quit :unix-status 1))
