;; init-helm.el

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; helm mode settings
(require-package 'helm)

(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
;;(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)
;;(helm-mode t)

(provide 'init-helm)
