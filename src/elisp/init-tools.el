;;; init-tools.el --- load tool modes

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; dired
(require 'init-dired)

;; ido
(require 'init-ido)

;; ibuffer
(require 'init-ibuffer)

;; highlight-symbol
(require 'init-hl-s)

;; color-identifiers-mode
(require 'init-color-ident)

;; ace jump
(require 'init-ace-jump)

;; woman
(require 'init-woman)

;; multi-term
(require 'init-multi-term)

;; org mode
(require 'init-org)

;; chinese input method
(ignore-errors (require 'init-pyim))

;; magit mode
(require 'init-magit)

;; yasnippet
(require 'init-yas)

;; auto-complete
(require 'init-ac)

;; xcscope
(require 'init-cscope)

;; cut/paste
(require 'init-xsel)

;; rainbow-delimiters
(require 'init-rainbow-delimiters)

;; helm
;; (require 'init-helm)

;; sdcv
(do-on-os "gnu/linux"
          (require 'init-sdcv))

;; utils
(require 'init-utils)

(provide 'init-tools)
