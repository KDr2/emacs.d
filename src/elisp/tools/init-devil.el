;;; init-devil.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require-package 'devil)

(global-devil-mode)
(global-set-key (kbd "C-,") 'global-devil-mode)

(provide 'init-devil)
