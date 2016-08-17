;;; init-coffee.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load modes about coffee-mode

(require 'init-elpa)

(require-package 'coffee-mode)

;; automatically clean up bad whitespace
;;(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
;;(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

;; This gives you a tab of 2 spaces
;; (custom-set-variables '(coffee-tab-width 2))

(provide 'init-coffee)
