#!/usr/bin/sbcl --script

(load "quicklisp.lisp")
(quicklisp-quickstart:install)

(ql:quickload :prove)

(if (prove:run :stein-test)
    (sb-ext:quit :unix-status 0)
    (sb-ext:quit :unix-status 1))
