(in-package :cl-user)
(defpackage stein.util
  (:use :cl)
  (:export :run-command
	   :current-directory
	   :cd))
(in-package :stein.util)


(defun run-command (cmd &rest args)
#+sbcl
  (let ((error-string (make-array '(0) :element-type 'base-char
                                  :fill-pointer 0
                                  :adjustable t)))
    (with-output-to-string (stream)
      (with-output-to-string (error error-string)
        (let* ((process (sb-ext:run-program cmd args :output stream :error error :search t)) ; ':search t' => use $PATH
               (exit-code (sb-ext:process-exit-code process)))
          (if (/= exit-code 0)
                (error "while executing command '~a'~%~a" cmd error-string))))))
#+ccl
  (let ((error-string (make-array '(0) :element-type 'base-char
                                  :fill-pointer 0
                                  :adjustable t)))
    (with-output-to-string (stream)
      (with-output-to-string (error error-string)
        (let ((external-process (ccl:run-program cmd args :output stream :error error)))
          (multiple-value-bind (status exit-code)
              (ccl:external-process-status external-process)
            (if (/= exit-code 0)
                (error "while executing command '~a'~%~a" cmd error-string))))))))

(defun cd (path)
#+(or ccl sbcl)
  (uiop/os:chdir path))

(defun current-directory ()
#+sbcl
  (sb-posix:getcwd)
#+ccl
  (ccl:current-directory))
