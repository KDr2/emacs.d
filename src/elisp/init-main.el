;;; init-main.el --- settings for KDr2's emacs configuration

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; Common Libraries
(load-file "~/.emacs.d/src/elisp/common.el")

;; platform vars
(require 'init-vars)

;; Basic Settings
(require 'init-basic)

;; init packages not on elpa
(if (vars-get 'non-elpa)
    (require 'init-non-elpa))

;; Programming Language Modes
(require 'init-lang)

;; Tool modes
(require 'init-tools)

;; Misc Settings
(load-file "~/.emacs.d/src/elisp/misc.el")

;; Theme Settings
(require 'init-theme)


(provide 'init-main)
