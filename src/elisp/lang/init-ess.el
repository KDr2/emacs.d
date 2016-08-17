;;; init-ess.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load ESS mode

(require 'init-elpa)

(require-package 'ess)

(require 'ess-site)
(add-to-list 'auto-mode-alist '("\\.[Rr]\\'" . R-mode))
(add-hook 'ess-mode-hook
          (lambda () (setq ess-indent-level 2)))

(provide 'init-ess)
