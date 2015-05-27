;;; init-color-ident.el

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require 'init-elpa)

(require-package 'color-identifiers-mode)

(add-hook 'after-init-hook 'global-color-identifiers-mode)

(provide 'init-color-ident)
