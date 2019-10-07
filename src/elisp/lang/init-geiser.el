;;; init-geiser.el --- geiser mode settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require 'init-elpa)

(require-package 'geiser)
(setq geiser-active-implementations '(guile racket chez))
(setq geiser-default-implementation 'guile)

(provide 'init-geiser)
