;;; init-multi-term.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; multi-term settings

(require 'init-elpa)

(require-package 'multi-term)

(setq multi-term-program "/bin/bash")
(defun term-mode-settings ()
  "Settings for `term-mode'"
  (make-local-variable 'scroll-margin)
  (setq-default scroll-margin 0))
(add-hook 'term-mode-hook 'term-mode-settings)

(provide 'init-multi-term)
