;;; init-ruby.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load Ruby Mode

(require 'init-elpa)

(require-package 'ruby-mode)
;;(when (package-installed-p 'ruby-mode)
;;  (require 'ruby-electric))

(add-to-list 'auto-mode-alist '("\\.rbw?\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rjs\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml?\\'" . html-mode))
;;(add-hook 'ruby-mode-hook
;;          (lambda()
;;            (ruby-electric-mode nil)))
 
(provide 'init-ruby)
