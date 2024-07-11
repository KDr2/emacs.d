;;; init-racket.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load modes about racket

(require 'init-elpa)

(require-package 'racket-mode)
(require-package 'scribble-mode)

;; (add-to-list 'auto-mode-alist '("\\.rkt\\'" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

(provide 'init-racket)
