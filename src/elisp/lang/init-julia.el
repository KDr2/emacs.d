;;; init-julia.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; Julia Mode Settings

;;
;; no julia package on elpa ToT
;;(require-package 'julia-mode)
;;

(require 'init-elpa)

(require-package 'julia-mode)

(add-to-list 'auto-mode-alist '("\\.jl\\'" . julia-mode))

;; should init after ESS
(provide 'init-julia)
