;;; init-go.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load Go-Lang mode

(require 'init-elpa)

(require-package 'go-mode)

;;(require 'go-mode-load)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(provide 'init-go)
