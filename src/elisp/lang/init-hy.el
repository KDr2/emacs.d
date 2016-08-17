;;; init-hy.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require 'init-elpa)

(require-package 'hy-mode)

(add-to-list 'auto-mode-alist '("\\.hy\\'" . hy-mode))

(provide 'init-hy)
