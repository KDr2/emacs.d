;;; init-yas.el --- yasnippet settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require 'init-elpa)

(require-package 'yasnippet)
;; (require-package 'yasnippet-bundle)

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

(global-set-key "\C-xx" 'yas/expand)

(ignore-errors (yas-global-mode 1))

(provide 'init-yas)
