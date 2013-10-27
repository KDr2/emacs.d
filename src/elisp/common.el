;;; common.el --- common functions/macros for KDr2's emacs configuration

;; Copyright (C) KDr2 

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;


(defmacro do-on-os (os-type &rest body)
  `(if (string= system-type ,os-type)
       (progn ,@body)))



