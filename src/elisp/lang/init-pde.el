;;; init-pde.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load PDE mode

(require 'init-elpa)

(do-on-os
 "gnu/linux"
 (require-package 'pde))

(do-on-os
 "darwin"
 (add-non-elpa-load-path "/emacs-pde/lisp"))

(do-on-os
 "windows-nt"
 (add-non-elpa-load-path "/emacs-pde/lisp"))

(load "pde-load")

;; do not inset a new line when insert a ';'
(defun orignal-semicolon ()
  (interactive)
  (insert ";"))
(add-hook 'cperl-mode-hook
          '(lambda ()
             (local-set-key ";" 'orignal-semicolon)))

(provide 'init-pde)
