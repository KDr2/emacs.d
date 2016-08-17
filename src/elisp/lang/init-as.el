;;; init-gas.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load gas-mode

;; There's no gas-mode on ELPA :(
;;(require-package 'gas-mode)
(require 'gas-mode)
(add-to-list 'auto-mode-alist '("\\.[sS]\\'" . gas-mode))

(provide 'init-as)
