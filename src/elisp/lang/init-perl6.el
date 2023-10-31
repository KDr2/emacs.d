;;; init-perl6.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load perl6 Mode

(require 'init-perl6)

(require-package 'perl6-mode)

(add-to-list 'auto-mode-alist '("\\.nqp?\\'" . perl6-mode))
(add-to-list 'auto-mode-alist '("\\.pm6\\'" . perl6-mode))

(provide 'init-perl6)
