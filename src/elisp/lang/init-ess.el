;;; init-ess.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load ESS mode

(require-package 'ess)

(require 'ess-site)
(add-to-list 'auto-mode-alist '("\\.[Rr]\\'" . R-mode))

(provide 'init-ess)
