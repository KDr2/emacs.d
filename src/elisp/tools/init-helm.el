;; init-helm.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; helm mode settings
(require-package 'helm)

(require 'helm-config)

(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c M-x") 'helm-M-x)

(setq
 helm-M-x-fuzzy-match t
 helm-recentf-fuzzy-match t
 helm-buffers-fuzzy-matching t
 helm-locate-fuzzy-match t
 helm-semantic-fuzzy-match t
 helm-imenu-fuzzy-match t
 helm-apropos-fuzzy-match t
 helm-lisp-fuzzy-completion t)

;;(helm-mode t)

(provide 'init-helm)
