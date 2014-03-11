;;; init-org.el --- yasnippet settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require 'init-elpa)

(require-package 'yasnippet)
(require-package 'yasnippet-bundle)

(global-set-key "\C-xx" 'yas/expand)

(provide 'init-yas)
