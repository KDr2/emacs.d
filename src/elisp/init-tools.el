;;; init-lang.el --- load tool modes 

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;


(add-to-list 'load-path
             (concatenate 'string user-emacs-directory "src/elisp/tools"))

;; dired
(require 'init-dired)

;; ido
(require 'init-ido)

;; ibuffer
(require 'init-ibuffer)

;; highlight-symbol
(require 'init-hl-s)

;; ace jump
(require 'init-ace-jump)

;; woman
(require 'init-woman)

;; multi-term
(require 'init-multi-term)

;; org mode
(require 'init-org)

;; chinese input method
(require 'init-eim)

;; magit mode
(require 'init-magit)

;; yasnippet
(require 'init-yas)

;; git-emacs
;;(require 'init-git-emacs)

;; mercurial mode
(require 'init-mercurial)

;; auto-complete
(require 'init-ac)

;; xcscope
(require 'init-cscope)

;; cut/paste
(require 'init-xsel)

;; utils
(require 'init-utils)

(provide 'init-tools)

