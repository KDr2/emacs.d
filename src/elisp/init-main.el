;;; main.el --- settings for KDr2's emacs configuration

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;


(require 'init-vars)
(require 'init-elpa)

;; Basic Settings
(load-file "~/.emacs.d/src/elisp/basic.el")

;; Common Libraries
(load-file "~/.emacs.d/src/elisp/common.el")

;; Util Modes
(load-file "~/.emacs.d/src/elisp/util-modes.el")

;; Programming Language Modes
(require 'init-lang)

;; Tool modes
(require 'init-tools)

;; Misc Settings
(load-file "~/.emacs.d/src/elisp/misc.el")

;; Theme Settings
(require 'init-theme)


(provide 'init-main)
