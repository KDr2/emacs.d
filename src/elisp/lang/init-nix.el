;;; init-nix.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load Nix Mode

(require 'init-elpa)

(require-package 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

(provide 'init-nix)
