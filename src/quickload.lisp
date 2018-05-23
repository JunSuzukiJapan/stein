(in-package :cl-user)
(defpackage stein.quickload
  (:use :cl)
  (:export :quickload
	   :reload))
(in-package :stein.quickload)

(defmethod quickload ((package symbol))
  (ql:quickload package))

(defmethod quickload ((uri string))
  (let* ((prev-dir (stein.util:current-directory))
	 (list (packagename-from-uri uri))
	 (package (car list)))
    (let* ((ql-home QL-SETUP:*QUICKLISP-HOME*)
	   (ql-local-projects (merge-pathnames #p"local-projects" ql-home)))
      (stein.util:cd ql-local-projects))
    (stein.git:clone uri)
    (ql:register-local-projects)
    (prog1
	(ql:quickload package)
      (stein.util:cd prev-dir))))

(defun reload (package)
  (ql:register-local-projects)
  (ql:quickload package))

(defun packagename-from-uri (uri)
  (let* ((s (ppcre:scan-to-strings "[0-9a-zA-Z]+\.git$" uri))
	 (packagename (ppcre:split "\\." s)))
    packagename))
