;;; init-ac.el --- atuo-complete mode settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require 'init-elpa)

(require-package 'auto-complete)

(when (require 'auto-complete)
  (global-auto-complete-mode t)
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)
  (setq ac-auto-start 3)
  (define-key ac-mode-map (kbd "M-/") 'auto-complete))

(global-auto-complete-mode t)

(provide 'init-ac)
